package com.example.hotel;

import com.example.hotel.classes.Order;
import com.example.hotel.dao.OrdersDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    static final Logger logger = LogManager.getLogger(OrderServlet.class);

    /** Post method to make order (add to Orders table in database) */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String user_id = session.getAttribute("user_id").toString();
        String capacity = request.getParameter("capacity");
        String roomClass = request.getParameter("class");
        String date1 = request.getParameter("datepicker1");
        String date2 = request.getParameter("datepicker2");

        Order order = new Order(user_id, capacity, roomClass, date1, date2, "wait");

        int rowCount = OrdersDao.addOrder(order);

        if(rowCount>0){
            logger.info("success");
            request.setAttribute("status", "success");
        }
        else{
            logger.error("failed");
            request.setAttribute("status", "failed");
        }

        request.getRequestDispatcher("account.jsp").forward(request, response);

    }
}
