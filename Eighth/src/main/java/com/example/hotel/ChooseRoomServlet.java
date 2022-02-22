package com.example.hotel;

import com.example.hotel.classes.Order;
import com.example.hotel.dao.OrdersDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/choose")
public class ChooseRoomServlet extends HttpServlet {
    static final Logger logger = LogManager.getLogger(ChooseRoomServlet.class);

    /** Get method for manager to choose the room that need to be assigned to order */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
            Order order = OrdersDao.getOrderById(orderId);
            if(order != null){
                logger.info("success");
                session.setAttribute("orderId", orderId);
                session.setAttribute("orderUserId", order.getUser_id());
                session.setAttribute("capacity", order.getCapacity());
                session.setAttribute("class", order.getRoomClass());
                session.setAttribute("firstDate", order.getDate1());
                session.setAttribute("secondDate", order.getDate2());
                dispatcher = request.getRequestDispatcher("chooseRoom.jsp");
            } else{
                logger.error("failed");
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("index.jsp");
            }
            dispatcher.forward(request, response);
    }
}
