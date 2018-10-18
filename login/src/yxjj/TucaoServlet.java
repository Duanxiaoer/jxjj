package yxjj;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TucaoServlet")
public class TucaoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emil = request.getParameter("email");
        String pwd = request.getParameter("pwd");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<h1>" + emil+pwd + "</h1>");
    }
}
