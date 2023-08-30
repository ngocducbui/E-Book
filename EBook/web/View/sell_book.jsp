<%-- 
    Document   : sell_book
    Created on : Aug 29, 2023, 10:46:33 PM
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
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
        <title>EBook: Sell Old Book</title>
    </head>
    <body style="background-color: #f0f1f2">
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <%@include file= "navbar.jsp"%>

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-primary">Sell Old Book</h4>

                            <form action="/EBook/AddBookOld" method="post" enctype="multipart/form-data" class="mt-4">
                                <input type="hidden" value="${userObj.email}" name="user">
                                <div class="form-group mb-3" >
                                    <label for="exampleInputName" class="form-label">Book Name<span class="red-star">*</span></label>
                                    <input name="bookname" type="text" class="form-control" id="exampleInputName" aria-describedby="">
                                </div>

                                <div class="form-group mb-3">
                                    <label for="exampleInputAuthor" class="form-label">Author Name<span class="red-star">*</span></label>
                                    <input name="author" type="text" class="form-control" id="exampleInputAuthor" aria-describedby="">
                                </div>

                                <div class="form-group mb-3">
                                    <label for="exampleInputPrice" class="form-label">Price<span class="red-star">*</span></label>
                                    <input name="price" type="number" class="form-control" id="exampleInputPrice" aria-describedby="">
                                </div>
                                <div class="form-group mb-3">
                                    <label for="exampleInputImg" class="form-label">Upload Photo</label>
                                    <input name="img" type="file" class="form-control-file" id="exampleInputImg">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary w-50">Sell Book</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </div>



    </body>
</html>
