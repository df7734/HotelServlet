package com.example.hotel;


import com.example.hotel.classes.User;
import com.example.hotel.dao.UsersDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    static final Logger userLogger = LogManager.getLogger(LoginServlet.class);

    /** Post method to login user (check from Users table in database) */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = UsersDao.getUserByLoginPassword(request.getParameter("email"), request.getParameter("password"));

            if(user != null){
                userLogger.info("login");
                HttpSession session = request.getSession();
                session.setAttribute("name", user.getName());
                session.setAttribute("user_id", user.getId());
                response.sendRedirect("index.jsp");
                userLogger.info("successful redirect to index.jsp");
            } else{
                request.setAttribute("status", "failed");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
                userLogger.error("wrong password");
            }
    }
}
