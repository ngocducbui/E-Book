/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author ADMIN
 */
@WebServlet(urlPatterns = {"/duc2"})
public class duc2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet duc2</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet duc2 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productId = request.getParameter("productId");

        // Thêm sản phẩm vào giỏ hàng của người dùng (có thể lưu vào session hoặc cơ sở dữ liệu)
        // ... Thêm logic xử lý thêm sản phẩm vào giỏ hàng ...
        // Trả về phản hồi cho front-end
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        JSONObject jsonResponse = new JSONObject();
        try {
            jsonResponse.put("success", true);
        } catch (JSONException ex) {
            Logger.getLogger(duc2.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.print(jsonResponse.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productId = request.getParameter("productId");

        // Thêm sản phẩm vào giỏ hàng của người dùng (có thể lưu vào session hoặc cơ sở dữ liệu)
        // ... Thêm logic xử lý thêm sản phẩm vào giỏ hàng ...
        // Trả về phản hồi cho front-end
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        JSONObject jsonResponse = new JSONObject();
        try {
            jsonResponse.put("success", true);
        } catch (JSONException ex) {
            Logger.getLogger(duc2.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.print(jsonResponse.toString());
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
