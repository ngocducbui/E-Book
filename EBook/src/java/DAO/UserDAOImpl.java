/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Database.DBConnection;
import Model.Book;
import Model.User;
import com.mysql.cj.xdevapi.PreparableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
public class UserDAOImpl implements UserDAO {

    @Override
    public boolean userRegister(User user) {
        boolean f = false;
        Connection con = DBConnection.getConnection();
        try {
            String sql = "insert into user(name,email,phno,password) VALUES (?,?,?,?) ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPassword());
            int i = ps.executeUpdate();
            con.close();

            if (i == 1) {
                f = true;
            }
            DBConnection.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public User login(String email, String password) {
        Connection con = DBConnection.getConnection();
        User user = null;
        try {
            String sql = "select *from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPhno(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setLandmark(rs.getString(7));
                user.setCity(rs.getString(8));
                user.setState(rs.getString(9));
                user.setPinc(rs.getString(10));
            }
            DBConnection.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public User getUserById(int id) {

        User user = null;
        Connection con = DBConnection.getConnection();
        try {

            String sql = "select * from user where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPhno(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setLandmark(rs.getString(7));
                user.setCity(rs.getString(8));
                user.setState(rs.getString(9));
                user.setPinc(rs.getString(10));
                user.setPhoto(rs.getString(11));

            }
            DBConnection.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;

    }

    @Override
    public boolean updateUserById(User user) {

        boolean f = false;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE ebook.`user`\n"
                    + "SET name=?, email=?, phno=?, address=?, landmark=?, city=?, state=?, pincode=?, photo=?\n"
                    + "WHERE id=? ;";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhno());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getLandmark());
            ps.setString(6, user.getCity());
            ps.setString(7, user.getState());
            ps.setString(8, user.getPinc());
            ps.setString(9, user.getPhoto());
            ps.setInt(10, user.getId());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
            DBConnection.closeConnection(con);

        } catch (Exception e) {
        }
        return f;

    }

}
