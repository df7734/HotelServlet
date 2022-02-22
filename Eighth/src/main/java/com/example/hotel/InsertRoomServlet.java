package com.example.hotel;

import com.example.hotel.classes.Room;
import com.example.hotel.dao.RoomsDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/insertRoom")
public class InsertRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String number = request.getParameter("number");
        String capacity = request.getParameter("capacity");
        String roomClass = request.getParameter("roomClass");
        String price = request.getParameter("price");
        String status = request.getParameter("status");
        Room room = new Room(number, capacity, roomClass, price, status);
        RoomsDao.insertRoom(room);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewRooms.jsp?page=1");
        dispatcher.forward(request, response);
    }
}
