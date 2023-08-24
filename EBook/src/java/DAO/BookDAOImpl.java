/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Database.DBConnection;
import Model.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author ADMIN
 */
public class BookDAOImpl implements BookDAO {

    @Override
    public boolean addBook(Book book) {
        boolean f = false;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO ebook.book\n"
                    + "(bookname, author, price, bookcategory, status, photo, user_email)\n"
                    + "VALUES(?,?,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, book.getBookCategory());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getPrice());
            ps.setString(4, book.getBookCategory());
            ps.setString(5, book.getStatus());
            ps.setString(6, book.getPhotoName());
            ps.setString(7, book.getEmail());
            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }
        } catch (Exception e) {
        }
        return f;
    }

}
