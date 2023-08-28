/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import Model.Cart;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface CartDAO {
    public boolean addCart(Cart cart);
    public List<Cart> getAllCartByIdUser(int id);
    public boolean deleteCart(int id);
    
}
