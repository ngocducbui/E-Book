/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BookDAOImpl;
import Model.Book;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddBook", urlPatterns = {"/AddBook"})
@MultipartConfig
public class AddBook extends HttpServlet {

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
            out.println("<title>Servlet AddBook</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBook at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String formType = request.getParameter("formType");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

        try {
            if ("editform".equals(formType)) {
                String bookName = request.getParameter("bookname");
                String id_new = request.getParameter("idbook").trim();
                // int id = Integer.parseInt(request.getParameter("idbook"));
                int id = Integer.parseInt(id_new);
                String author = request.getParameter("author");
                String price = request.getParameter("price");
                String categories = request.getParameter("btype");
                String status = request.getParameter("bstatus");
                Part part = request.getPart("img");
                String fileName = part.getSubmittedFileName();

                Book b = new Book();
                b.setBookId(id);
                b.setBookName(bookName);
                b.setAuthor(author);
                b.setPrice(price);
                b.setBookCategory(categories);
                b.setStatus(status);

                BookDAOImpl dao = new BookDAOImpl();
                boolean f = dao.UpdateBook(b);
                HttpSession session = request.getSession();
                url = "/View/admin/allBook.jsp";

                if (f) {
                    request.setAttribute("success", true);
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                } else {
                    request.setAttribute("success", false);
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                }

            } else {
                //String url=getServletContext().getRealPath("");
                String bookName = request.getParameter("bookname");
                String author = request.getParameter("author");
                String price = request.getParameter("price");
                String categories = request.getParameter("btype");
                String status = request.getParameter("bstatus");
                Part part = request.getPart("img");
                String fileName = part.getSubmittedFileName();

                Book book = new Book(bookName, author, price, categories, status, fileName, "Admin");

                BookDAOImpl dao = new BookDAOImpl();
                boolean f = dao.addBook(book);

                HttpSession session = request.getSession();

                url += "/View/admin/addBook.jsp";
                if (f) {
                    String path = getServletContext().getRealPath("") + "book";
                    String path_new = path.replace(String.valueOf("\\build"), "");
                    File file = new File(path);
                    part.write(path_new + File.separator + fileName);
                    session.setAttribute("successMsg", "Book Add Successfully.");
                    response.sendRedirect(url);
                } else {
                    session.setAttribute("failedMsg", "Something wrong!");
                    response.sendRedirect(url);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

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
