/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BookDAOImpl;
import DAO.CartDAOImpl;
import Model.Book;
import Model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

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
            out.println("<title>Servlet AddToCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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

        try {
            String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

            int bid = Integer.parseInt(request.getParameter("bid"));
            int uid = Integer.parseInt(request.getParameter("uid"));

            BookDAOImpl dao = new BookDAOImpl();
            Book book = dao.getBookById(bid);

            Cart cart = new Cart();
            cart.setBid(bid);
            cart.setUserid(uid);
            cart.setBookName(book.getBookName());
            cart.setAuthor(book.getAuthor());
            cart.setPrice(Double.parseDouble(book.getPrice()));
            cart.setTotalPrice(Double.parseDouble(book.getPrice()));

            CartDAOImpl dao_cart = new CartDAOImpl();
            boolean f = dao_cart.addCart(cart);

            HttpSession session = request.getSession();
            url += "/View/all_new_book.jsp";
            if (f) {
                session.setAttribute("addCart", "Book Added To Cart");
                response.sendRedirect(url);

            } else {
                session.setAttribute("failed", "Somthing Wrong On Server");
                response.sendRedirect(url);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        int userId = Integer.parseInt(request.getParameter("userId"));

        BookDAOImpl dao = new BookDAOImpl();
        Book book = dao.getBookById(productId);

        Cart cart = new Cart();
        cart.setBid(productId);
        cart.setUserid(userId);
        cart.setBookName(book.getBookName());
        cart.setAuthor(book.getAuthor());
        cart.setPrice(Double.parseDouble(book.getPrice()));
        cart.setTotalPrice(Double.parseDouble(book.getPrice()));

        CartDAOImpl dao_cart = new CartDAOImpl();
        boolean f = dao_cart.addCart(cart);

        HttpSession session = request.getSession();
//        url += "/View/all_new_book.jsp";
        if (f) {
            session.setAttribute("addCart", "Book Added To Cart");
//            response.sendRedirect(url);

        } else {
            session.setAttribute("failed", "Somthing Wrong On Server");
//            response.sendRedirect(url);
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        JSONObject jsonResponse = new JSONObject();
        try {
            jsonResponse.put("success", true);
        } catch (JSONException ex) {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.print(jsonResponse.toString());

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
