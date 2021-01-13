package servlett;
import struct.UserAccount;
import utils.DButils;
import utils.MyUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/login"})
public class LoginServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

        public LoginServlet() {
            super();
        }

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {


            // Forward to /WEB-INF/views/homeView.jsp
            // (Users can not access directly into JSP pages placed in WEB-INF)
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/login.jsp");

            dispatcher.forward(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            String nume = request.getParameter("first_name");
            String prenume = request.getParameter("last_name");
            String parola = request.getParameter("Password");
            String rememberMeStr = request.getParameter("rememberMe");
            boolean remember = "Y".equals(rememberMeStr);

            UserAccount user = null;
            boolean hasError = false;
            String errorString = null;

            if (nume == null || parola == null || prenume==null|| nume.length() == 0 || parola.length() == 0||prenume.length()==0) {
                hasError = true;
                errorString = "Required username and password!";
            } else {
                Connection conn = MyUtils.getStoredConnection(request);
                try {
                    // Find the user in the DB.
                    user = DButils.findUser(conn, nume, prenume,parola);

                    if (user == null) {
                        hasError = true;
                        errorString = "User Name or password invalid";
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    hasError = true;
                    errorString = e.getMessage();
                }
            }
            // If error, forward to /WEB-INF/views/login.jsp
            if (hasError) {
                user = new UserAccount();
                user.setNume(nume);
                user.setPrenume(prenume);
                user.setPassword(parola);

                // Store information in request attribute, before forward.
                request.setAttribute("errorString", errorString);
                request.setAttribute("user", user);

                // Forward to /WEB-INF/views/login.jsp
                RequestDispatcher dispatcher //
                        = this.getServletContext().getRequestDispatcher("/WEB-INF/view/login.jsp");

                dispatcher.forward(request, response);

            }
            // If no error
            // Store user information in Session
            // And redirect to userInfo page.
            else {
                HttpSession session = request.getSession();
                MyUtils.storeLoginedUser(session, user);

                // If user checked "Remember me".
                if (remember) {
                    MyUtils.storeUserCookie(response, user);
                }
                // Else delete cookie.
                else {
                    MyUtils.deleteUserCookie(response);
                }

                // Redirect to userInfo page.
                response.sendRedirect(request.getContextPath() + "/account");
            }
        }
}

