package com.example.helloservlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class HelloWorldServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<h1>Hello World!</h1>");
    }
}
