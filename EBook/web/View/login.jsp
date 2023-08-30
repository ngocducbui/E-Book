<%-- 
    Document   : login
    Created on : Aug 23, 2023, 11:12:01 PM
    Author     : ADMIN
--%>
<%@page import="Model.User"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook: Login</title>
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
        <style>
            .child {
                position: fixed;
                top: 130px;
                left: 0;
                right: 0
                    /* Các thuộc tính khác */
            }
        </style>

    </head>
    <body style="background-color: #f0f1f2">

        <%@include file= "navbar.jsp"%>

        <div style="padding-top: 130px">
            <c:if test="${not empty failedMsg}">
                <div class="alert alert-danger child"  id="myDiv" role="alert">
                    Email or Password Is Incorrect!. Please Try Again.
                </div>
                <c:remove var="failedMsg" scope="session" />
            </c:if>
        </div>
        <div>



            <div class="container p-2" >

                <div class="row"style="padding-top: 70px"  >

                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-body ">
                                <h4 class="text-center">Login Page</h4>

                                <form action="/EBook/Login" method="post">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
                                        <div id="emailHelp" class="form-text"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                                    </div>
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                    </div>
                                    <br>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary mb-2 w-50">Login</button>
                                        <br>
                                        <a href="<%=url%>/View/register.jsp" style="text-decoration: none">Create Account</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            // Lấy tham chiếu đến thẻ div
            var myDiv = document.getElementById('myDiv');

            // Thiết lập hàm tự động ẩn thẻ div sau 5 giây
            function hideDiv() {
                myDiv.style.display = 'none';
            }

            // Gọi hàm hideDiv sau 5 giây (5000ms)
            setTimeout(hideDiv, 3000);

        </script>
    </body>
</html>
