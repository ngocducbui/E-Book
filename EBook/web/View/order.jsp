<%-- 
    Document   : order
    Created on : Aug 29, 2023, 11:37:59 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook: Orders</title>
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
        <style>
            .table td {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis; /* (Tùy chọn) Hiển thị dấu chấm (...) khi nội dung quá dài */
            }
        </style>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file= "navbar.jsp"%>      

        <div class="text-center mt-3 mb-3">
            <h4>Your Order</h4>
        </div>
        <table class="table table-hover">
            <thead class="table-info">
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        Book_order_001
                    </td>

                    <td>
                        Ngoc Duc
                    </td>
                    <td>
                        Python Java
                    </td>
                    <td>
                        NXB Viet Nam
                    </td>
                    <td>
                        100.0
                    </td>
                    <td>
                        COD
                    </td>
                </tr>
                <tr>
                    <td>
                        Book_order_001
                    </td>

                    <td>
                        Ngoc Duc
                    </td>
                    <td>
                        Python Java
                    </td>
                    <td>
                        NXB Viet Nam
                    </td>
                    <td>
                        100.0
                    </td>
                    <td>
                        COD
                    </td>
                </tr>

            </tbody>
        </table>

    </body>
</html>
