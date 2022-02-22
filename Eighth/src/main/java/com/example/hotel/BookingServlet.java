package com.example.hotel;

import com.example.hotel.classes.Booking;
import com.example.hotel.classes.Room;
import com.example.hotel.dao.BookingsDao;
import com.example.hotel.dao.RoomsDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/book")
public class BookingServlet extends HttpServlet {
    static final Logger logger = LogManager.getLogger(BookingServlet.class);

    /** Post method to book the room (add entry to Bookings table)*/
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String room_no = request.getParameter("roomNo");
        String user_id = session.getAttribute("user_id").toString();
        String date3 = request.getParameter("datepicker3");
        String date4 = request.getParameter("datepicker4");
        String room_id = "";

            Room room = RoomsDao.getRoomByNumber(room_no);

            if(room != null){
                logger.info("success");
                room_id = room.getId();
            } else{
                logger.error("booking failed");
                request.setAttribute("status", "failed");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            // current date
            LocalDateTime expirationTime = LocalDateTime.now().plusDays(2);

            Booking booking = new Booking(room_id, user_id, date3, date4, "not paid", String.valueOf(expirationTime));

            int rowCount = BookingsDao.addBooking(booking);
            if(rowCount>0){
                logger.info("set date success");
                request.setAttribute("status", "success");
            }
            else{
                logger.error("set date fail");
                request.setAttribute("status", "failed");
            }

            request.getRequestDispatcher("account.jsp").forward(request, response);
    }
}
