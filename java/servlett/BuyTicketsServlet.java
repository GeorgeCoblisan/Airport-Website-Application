package servlett;

import routs.Graf;
import routs.Oras;
import struct.Bilete;
import struct.Reviews;
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
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = { "/buyticket"})
public class BuyTicketsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static List<Bilete> tickets = null;
    public BuyTicketsServlet() {
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
        String plecare =(String)request.getParameter("plecare_aero");
        String destinatie =(String)request.getParameter("sosire_aero");
        String data =(String)request.getParameter("data");
        String cargo=(String)request.getParameter("cargo");
        String pers=(String)request.getParameter("pers");
        String eco=(String)request.getParameter("eco");
        String bus=(String)request.getParameter("bus");
        String fc=(String)request.getParameter("fc");

        List<Oras> rout= Graf.getInstanta().GasireRuta(plecare,destinatie);
       String errorString = null;
       try{
           if(DButils.VerfRout(conn,rout,data,pers,cargo)==false)
            {
                errorString="Routa negasita";
            }
           tickets=DButils.queryBilete(conn,rout,eco,bus,fc);
           System.out.println(errorString);
       }catch(SQLException e)
        {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        request.setAttribute("errorString", errorString);
        request.setAttribute("buyticket", rout);
        request.setAttribute("tickets",tickets);
        System.out.println("trecut");
        if (errorString == null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/view/cumparare_bilete.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            System.out.println("Nu s-a gasit ruta");
            response.sendRedirect(request.getContextPath() + "/buyticket");
        }
       System.out.println(plecare+" "+destinatie+" "+data+" "+cargo+" "+pers);

   }
}
