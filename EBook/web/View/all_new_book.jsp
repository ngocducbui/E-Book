<%-- 
    Document   : all_new_book
    Created on : Aug 27, 2023, 2:55:21 PM
    Author     : ADMIN
--%>
<%@page import="Model.Book"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BookDAOImpl"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook: All New Book</title>
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file= "navbar.jsp"%>

        <div class="container">
            <div class="row">
                <%
                    BookDAOImpl dao = new BookDAOImpl();
                    List<Book> list_re = dao.getAllNewBook();
                    for (Book book : list_re) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho mt-4">
                        <div class="card-body text-center">
                            <img alt="" src="../book/<%=book.getPhotoName()%>" style="width: 200px;height: 250px;" class="img-thumblin">
                            <h5 class="card-title"><%=book.getBookName()%></h5>
                            <p><%=book.getAuthor()%></p>
                            <p>Category: <%=book.getBookCategory()%></p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3"><i class="fa-solid fa-dollar-sign" style="margin-right: 0.1rem"></i><%=book.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>

    </body>
</html>
