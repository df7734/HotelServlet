package com.example.hotel;

import com.example.hotel.classes.Booking;
import com.example.hotel.dao.BookingsDao;
import com.example.hotel.dao.OrdersDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/assign")
public class AssignServlet extends HttpServlet {
    static final Logger logger = LogManager.getLogger(AssignServlet.class);

    /** Post method to assign room to user order and convert order to booking */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String roomId = request.getParameter("roomId");
        String userId = (String) session.getAttribute("orderUserId");
        String date1 = (String) session.getAttribute("firstDate");
        String date2 = (String) session.getAttribute("secondDate");
        String status = "not paid";
        LocalDateTime expirationTime = LocalDateTime.now().plusDays(2);

        Booking booking = new Booking(roomId, userId, date1, date2, status, String.valueOf(expirationTime));

        RequestDispatcher dispatcher = request.getRequestDispatcher("manager.jsp");

            int rowCount = BookingsDao.addBooking(booking);

            //Update order
            String orderId = (String) session.getAttribute("orderId");

            int rowCount2 = OrdersDao.updateOrderById(orderId);
            if(rowCount>0 && rowCount2>0){
                logger.info("success");
                request.setAttribute("status", "success");
            }
            else{
                logger.error("assign failed");
                request.setAttribute("status", "failed");
            }

            dispatcher.forward(request, response);
    }
}
