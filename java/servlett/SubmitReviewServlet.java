package servlett;
import struct.ReviewSubmit;
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

@WebServlet(urlPatterns = { "/submitreview"})
public class SubmitReviewServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public SubmitReviewServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // Forward to /WEB-INF/views/homeView.jsp
        // (Users can not access directly into JSP pages placed in WEB-INF)
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/SubmitReview.jsp");

        dispatcher.forward(request, response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
        String nume = (String) request.getParameter("nume");
        String prenume = (String) request.getParameter("prenume");
        String duty_free = (String) request.getParameter("duty_free");
        String review = (String) request.getParameter("review");
        //System.out.println(duty_free);
        ReviewSubmit rs=null;
        if(duty_free=="") {
             rs = new ReviewSubmit(nume,prenume,review);
        }
        if(nume==""&&prenume=="")
        {
           rs = new ReviewSubmit(review,duty_free);
        }
        String errorString = null;
        System.out.println(rs.getReview());
        if (errorString == null) {
            try {
                if(duty_free=="") {
                    DButils.LeaveReviewAngajat(conn, rs);
                }
                if(nume==""&&prenume=="")
                {
                    DButils.LeaveReviewUC(conn,rs);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                errorString = e.getMessage();
            }
        }
        request.setAttribute("errorString", errorString);
        request.setAttribute("submitreview", rs);

        // If error, forward to Edit page.
        if (errorString != null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/view/SubmitReview.jsp");
            dispatcher.forward(request, response);
        }
        // If everything nice.
        // Redirect to the product listing page.
        else {
            response.sendRedirect(request.getContextPath() + "/reviews");
        }
    }
}
