/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import Model.Book;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface BookDAO {
    public boolean addBook(Book book);
    public List<Book> getAllBook();
    public boolean UpdateBook(Book book);
    public boolean Delete(int id);
    public List<Book> getNewBook();
    public List<Book> getRecentBook();
    public List<Book> getOldBook();
    public List<Book> getAllRecentBook();
    public List<Book> getAllNewBook();
    public List<Book> getAllOldBook();
}
