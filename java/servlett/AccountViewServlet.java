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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = { "/account"})
public class AccountViewServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

        public AccountViewServlet() {
            super();
        }

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            HttpSession session = request.getSession();

            // Check User has logged on
            UserAccount loginedUser = MyUtils.getLoginedUser(session);
            Connection conn = MyUtils.getStoredConnection(request);


            // Not logged in
            if (loginedUser == null) {
                // Redirect to login page.
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            String errorString = null;
            List<Bilete> tickets = null;
            try{
                tickets= DButils.queryIstoricBilete(conn,loginedUser);
            }catch(SQLException e)
            {
                e.printStackTrace();
                errorString = e.getMessage();
            }
            // Store info to the request attribute before forwarding.
            request.setAttribute("user", loginedUser);
            request.setAttribute("istB",tickets);

            // If the user has logged in, then forward to the page
            // /WEB-INF/views/userInfoView.jsp
            if(errorString==null) {
                RequestDispatcher dispatcher //
                        = this.getServletContext().getRequestDispatcher("/WEB-INF/view/account.jsp");
                dispatcher.forward(request, response);
            }
            else
            {
                System.out.println("trecut");
            }

        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            doGet(request, response);
        }
}
