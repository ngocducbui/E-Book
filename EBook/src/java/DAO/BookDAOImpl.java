/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Database.DBConnection;
import Model.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getPrice());
            ps.setString(4, book.getBookCategory());
            ps.setString(5, book.getStatus());
            ps.setString(6, book.getPhotoName());
            ps.setString(7, book.getEmail());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
        }
        return f;
    }

    @Override
    public List<Book> getAllBook() {
        List<Book> list = new ArrayList<Book>();
        Connection con = DBConnection.getConnection();
        Book book = null;
        try {

            String sql = "select * from book;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean UpdateBook(Book book) {
        boolean f = false;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE ebook.book\n"
                    + "SET bookname=?, author=?, price=?, bookcategory=?, status=?\n"
                    + "WHERE bookId=?;";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getPrice());
            ps.setString(4, book.getBookCategory());
            ps.setString(5, book.getStatus());
            ps.setInt(6, book.getBookId());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
        }
        return f;
    }

    @Override
    public boolean Delete(int id) {

        boolean f = false;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM ebook.book\n"
                    + "WHERE bookId=?;";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
        }
        return f;

    }

    @Override
    public List<Book> getNewBook() {

        List<Book> list = new ArrayList<Book>();
        Connection con = DBConnection.getConnection();
        Book book = null;
        try {

            String sql = "select * from book where bookcategory=? and status=? order by bookId DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<Book> getRecentBook() {
        List<Book> list = new ArrayList<Book>();
        Connection con = DBConnection.getConnection();
        Book book = null;
        try {

            String sql = "select * from book where status=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<Book> getOldBook() {

        List<Book> list = new ArrayList<Book>();
        Connection con = DBConnection.getConnection();
        Book book = null;
        try {

            String sql = "select * from book where bookcategory=? and status=? order by bookId DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<Book> getAllRecentBook() {
        List<Book> list = new ArrayList<Book>();
        Connection con = DBConnection.getConnection();
        Book book = null;
        try {

            String sql = "select * from book where status=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<Book> getAllNewBook() {

        List<Book> list = new ArrayList<Book>();
        Connection con = DBConnection.getConnection();
        Book book = null;
        try {

            String sql = "select * from book where bookcategory=? and status=? order by bookId DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<Book> getAllOldBook() {

        List<Book> list = new ArrayList<Book>();
        Connection con = DBConnection.getConnection();
        Book book = null;
        try {

            String sql = "select * from book where bookcategory=? and status=? order by bookId DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getString(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhotoName(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

}
