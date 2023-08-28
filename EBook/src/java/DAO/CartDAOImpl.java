/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Cart;
import java.sql.Connection;
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
public class CartDAOImpl implements CartDAO {

    @Override
    public boolean addCart(Cart cart) {
        boolean f = false;
        Connection con = DBConnection.getConnection();
        try {
            String sql = "INSERT INTO ebook.cart\n"
                    + "(bid, uid, bookName, author, price, totalprice)\n"
                    + "VALUES(?, ?, ?, ?, ?, ?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cart.getBid());
            ps.setInt(2, cart.getUserid());
            ps.setString(3, cart.getBookName());
            ps.setString(4, cart.getAuthor());
            ps.setDouble(5, cart.getPrice());
            ps.setDouble(6, cart.getTotalPrice());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Cart> getAllCart() {

        List<Cart> list = new ArrayList<Cart>();
        Connection con = DBConnection.getConnection();
        Cart cart = null;
        try {

            String sql = "select * from cart;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cart = new Cart();
                cart.setCid(rs.getInt(1));
                cart.setBid(rs.getInt(2));
                cart.setUserid(rs.getInt(3));
                cart.setBookName(rs.getString(4));
                cart.setAuthor(rs.getString(5));
                cart.setPrice(Double.parseDouble(rs.getString(6)));
                cart.setTotalPrice(Double.parseDouble(rs.getString(7)));
                list.add(cart);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<Cart> getAllCartByIdUser(int id) {
        List<Cart> list = new ArrayList<Cart>();
        Connection con = DBConnection.getConnection();
        Cart cart = null;
        double total = 0.0;
        try {

            String sql = "select * from cart where uid=?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cart = new Cart();
                cart.setCid(rs.getInt(1));
                cart.setBid(rs.getInt(2));
                cart.setUserid(rs.getInt(3));
                cart.setBookName(rs.getString(4));
                cart.setAuthor(rs.getString(5));
                cart.setPrice(rs.getDouble(6));
                total = total + rs.getDouble(7);
                cart.setTotalPrice(total);
                list.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean deleteCart(int id) {
        boolean f = false;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM ebook.cart\n"
                    + "WHERE cid=?;";
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

}
