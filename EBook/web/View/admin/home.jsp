<%-- 
    Document   : home
    Created on : Aug 24, 2023, 1:51:19 AM
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
        <title>Admin: Home</title>
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>


        <style type="text/css">
            a{
                text-decoration: none;
                color:black;
            }
            a:hover h4{
                text-decoration: none;
                color: #00cc00;
            }
        </style>
    </head>
    <body>
        <%@include file= "navbar.jsp"%>

        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="addBook.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-square-plus fa-beat fa-3x text-primary"></i><br><br>
                                <h4>Add Book</h4>
                                -----------
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="allBook.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book fa-beat fa-3x text-danger"></i><br><br>
                                <h4>All Books</h4>
                                -----------
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="orders.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-cart-flatbed fa-beat fa-3x text-warning"></i><br><br>
                                <h4>Orders</h4>
                                -----------
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="logout.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-right-from-bracket fa-beat fa-3x"></i><br><br>
                                <h4>Logout</h4>
                                -----------
                            </div>
                        </div>
                    </a>

                </div>
            </div>
        </div>

    </body>
</html>
