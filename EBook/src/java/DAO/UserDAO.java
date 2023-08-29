/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import Model.User;

/**
 *
 * @author ADMIN
 */
public interface UserDAO {
    public boolean userRegister(User user);
    public User login(String email, String password);
    public User getUserById(int id);
}
