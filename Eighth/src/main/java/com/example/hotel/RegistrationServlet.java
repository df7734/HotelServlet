package com.example.hotel;

import com.example.hotel.classes.User;
import com.example.hotel.dao.UsersDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import validation.UserValid;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    static final Logger logger = LogManager.getLogger(RegistrationServlet.class);

    /** Post method to register user (add to Users table in database) */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User(request.getParameter("name"), request.getParameter("email"), request.getParameter("password"),  request.getParameter("phone"));
            if(UserValid.userIsValid(user)){
                    logger.info("valid");
                    int rowCount = UsersDao.registerUser(user);

                    if(rowCount>0){
                        logger.info("successful registration");
                        request.setAttribute("status", "success");
                    }
                    else{
                        logger.info("failed registration");
                        request.setAttribute("status", "failed");
                    }
            }
            else {
                logger.error("not valid");
                request.setAttribute("status", "failedByValid");
            }
            request.getRequestDispatcher("registration.jsp").forward(request, response);
    }
}
