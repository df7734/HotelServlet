package com.example.hotel;

import com.example.hotel.dao.RoomsDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/deleteRoom")
public class DeleteRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String number = request.getParameter("roomNumber");
        RoomsDao.deleteRoom(number);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewRooms.jsp?page=1");
        dispatcher.forward(request, response);
    }
}
