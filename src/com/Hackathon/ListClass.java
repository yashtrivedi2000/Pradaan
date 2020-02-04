package com.Hackathon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.SQLException;
import java.util.List;
 
import javax.servlet.RequestDispatcher;
import com.DAO.*;
 
@WebServlet("/list")
public class ListClass extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DataBase dao = new DataBase();
 
        try {
            List<String> listCatagory = dao.list();
            request.setAttribute("listCategory", listCatagory);
            RequestDispatcher dispatcher = request.getRequestDispatcher("donate_Donator.jsp");
            dispatcher.forward(request, response);
 
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}