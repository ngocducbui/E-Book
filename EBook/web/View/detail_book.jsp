<%-- 
    Document   : detail_book
    Created on : Aug 27, 2023, 3:59:39 PM
    Author     : ADMIN
--%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook: Detail</title>
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file= "navbar.jsp"%>

        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center p-5 border">
                    <img src="" style="height: 100px; width: 100px;">
                    <br>
                    <h4>Book Name</h4>
                    <h5>Author Name: Hiiiiii</h5>
                    <h5>Category: New</h5>
                </div>
                <div class="col-md-6 text-center p-5 border">
                    <h2>Java Programing</h2>
                    <div class="row mt-2">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class=" col-md-4 fa-solid fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="  col-md-4 fa-solid fa-rotate-left fa-2x"></i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class=" col-md-4  fa-solid fa-truck fa-2x"></i>
                            <p>Free Delivery</p>
                        </div>
                    </div>
                    <div class="row text-center p-3 justify-content-around">
                        <a href="" class="btn btn-success col-md-4" ><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add To Cart</a>
                        <a href="" class="btn btn-secondary col-md-4"><i class="fa-solid fa-dollar-sign" style="margin-right: 0.1rem"></i>200</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
