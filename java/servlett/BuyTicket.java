package servlett;

import struct.Bilete;
import struct.UserAccount;
import utils.DButils;
import utils.MyUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@WebServlet(urlPatterns = { "/buyt"})
public class BuyTicket extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BuyTicket() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // Forward to /WEB-INF/views/homeView.jsp
        // (Users can not access directly into JSP pages placed in WEB-INF)
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/cumparare_bilete.jsp");

        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);

        //System.out.println(BuyTicketsServlet.tickets.get(0).getNr_bilet());
        UserAccount ua=MyUtils.getLoginedUser(request.getSession());
        Date date=new Date();
        SimpleDateFormat date1=new SimpleDateFormat("yyyy-MM-dd");
        //date1.format(date);
        //System.out.println(date1.format(date));
        String errorString = null;
        try{
            DButils.buyTicket(conn,BuyTicketsServlet.tickets,ua,date1.format(date));
        }catch(SQLException e)
        {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        request.setAttribute("errorString", errorString);
        if(errorString==null)
        {
            response.sendRedirect(request.getContextPath() + "/account");
        }
        else
        {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/view/cumparare_bilete.jsp");
            dispatcher.forward(request, response);
            System.out.println("Esuare");
        }

    }
}
