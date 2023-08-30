<%-- 
    Document   : addBook
    Created on : Aug 24, 2023, 4:51:06 AM
    Author     : ADMIN
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CartDAOImpl"%>
<%@page import="Model.Cart"%>
<%@page import="java.util.List"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
    List<Cart> list_cart = new ArrayList<Cart>();
    CartDAOImpl dao_cart = new CartDAOImpl();
    list_cart = dao_cart.getAllCart();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Books</title>
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <script src="<%=url%>/JS/myjs.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

    </head>
    <body style="background-color: #f0f2f2">

        <%@include file= "navbar.jsp"%>
        <c:if test="${empty adminObj}">
            <c:if test="${empty userObj}">
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

                <script>
//                    swal("Delete Successful", {
//                        icon: "success",
//                    });
//                    // $('#accessDeniedModal').modal('show');
//                    window.location.href = '../login.jsp';

                </script>
            </c:if>
            <c:if test="${not empty userObj}">
                <script>
                    //   $('#permissionDeniedModal').modal('show');
                    window.location.href = '<%=url%>/index.jsp';
                </script>
            </c:if>
        </c:if>


        <div class="container">
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Add Book</h4>
                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg}</p>
                                <c:remove var="successMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session" />
                            </c:if>
                            <form action="/EBook/AddBook" method="post" enctype="multipart/form-data">
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
                                    <label for="inputState" class="form-label">Book Categories<span class="red-star">*</span></label>
                                    <select name="btype" class="form-control form-select" id="inputState">
                                        <option selected>--select--</option>
                                        <option value="New">New Book</option>
                                        <option value="Old">Old Book</option>
                                    </select>
                                </div>


                                <div class="form-group mb-3">
                                    <label for="inputStatus" class="form-label">Book Status<span class="red-star">*</span></label>
                                    <select name="bstatus" class="form-control form-select" id="inputStatus">
                                        <option selected>--select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>

                                <div class="form-group mb-3">
                                    <label for="exampleInputImg" class="form-label">Upload Photo</label>
                                    <input name="img" type="file" class="form-control-file" id="exampleInputImg">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary w-50">Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
