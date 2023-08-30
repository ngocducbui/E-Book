<%-- 
    Document   : setting
    Created on : Aug 29, 2023, 9:06:12 PM
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
        <title>EBook: Setting</title>
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
                color: #22bf76;
            }
            a:hover p{
                text-decoration: none;
                color: #22bf76;
            }
        </style>
    </head>

    <body style="background-color: #f0f1f2">

        <%@include file= "navbar.jsp"%>

        <c:if test="${ empty userObj}">
            <script>
                //   $('#permissionDeniedModal').modal('show');
                window.location.href = '<%=url%>/View/login.jsp';
            </script>
        </c:if>
        <div class="container">
            <h2 class="text-center mt-3">Hello, ${userObj.name}</h2>
            <div class="row p-5">
                <div class="col-md-6">
                    <a href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book-open fa-3x text-primary"></i>
                                <h4 class="mt-1">Sell Old Book</h4>
                                <p>Sell Old Books</p>
                                -----------
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-6">
                    <a href="profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-user-pen fa-3x text-primary"></i>
                                <h4 class="mt-1">Edit Profile</h4>
                                <p>Edit Information</p>
                                -----------
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-4">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-location-dot fa-3x text-danger"></i>
                                <h4 class="mt-2">Address</h4>
                                <p>Edit Address</p>
                                -----------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-4">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-box-open fa-3x text-danger"></i>
                                <h4 class="mt-2">My Order</h4>
                                <p>Track Your Order</p>
                                -----------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-4">
                    <a href="">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-circle-info fa-3x text-danger"></i>
                                <h4 class="mt-2">Help Center</h4>
                                <p>24/7 Service</p>
                                -----------
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>
        <footer class="footer">
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
