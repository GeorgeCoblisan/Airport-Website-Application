package servlett;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import struct.UserAccount;
import utils.DButils;
import utils.MyUtils;
@WebServlet(urlPatterns = {"/registration"})
public class RegistrationServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public RegistrationServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // Forward to /WEB-INF/views/homeView.jsp
        // (Users can not access directly into JSP pages placed in WEB-INF)
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/registration.jsp");

        dispatcher.forward(request, response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
         System.out.println("trecut");
        String nume = (String) request.getParameter("nume");
        String prenume = (String) request.getParameter("prenume");
        String email = (String) request.getParameter("email");
        String CNP = (String) request.getParameter("CNP");
        String nr_telefon = (String) request.getParameter("nr_telefon");
        String password = (String) request.getParameter("password");
        UserAccount user = new UserAccount(nume, prenume, email,CNP,nr_telefon,password);

        String errorString = null;

        // Product ID is the string literal [a-zA-Z_0-9]
        // with at least 1 character
        String regex = "\\w+";

        if (nume == null || !nume.matches(regex)) {
            errorString = "Nume invalid!";
        }
        if (prenume == null || !prenume.matches(regex)) {
            errorString = "Prenume invalid!";
        }
        if (email == null) {
            errorString = "Email invalid!";
        }
        if (nr_telefon == null || !nr_telefon.matches(regex)) {
            errorString = "Nr_telefon invalid!";
        }
        if (CNP == null || !CNP.matches(regex)) {
            errorString = "CNP invalid!";
        }
        if (password == null || !password.matches(regex)) {
            errorString = "Password invalid!";
        }

        if (errorString == null) {
            try {
                DButils.inregistrare(conn,user);
            } catch (SQLException e) {
                e.printStackTrace();
                errorString = e.getMessage();
            }
        }

        // Store infomation to request attribute, before forward to views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("registration", user);

        // If error, forward to Edit page.
        if (errorString != null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/view/registration.jsp");
            dispatcher.forward(request, response);
        }
        // If everything nice.
        // Redirect to the product listing page.
        else {
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
}
