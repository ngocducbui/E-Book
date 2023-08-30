<%-- 
    Document   : index
    Created on : Aug 23, 2023, 3:28:20 PM
    Author     : ADMIN
--%>

<%@page import="DAO.CartDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Cart"%>
<%@page import="Model.User"%>
<%@page import="Model.Book"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BookDAOImpl"%>
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
        <title>EBook: Home</title>
        <link rel="icon" type="image/png" sizes="32x32" href="book/132332687_1877481222429292_8982841910306197256_o.jpg">

        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>

//            window.onload = function () {
//                // Kiểm tra xem có thuộc tính thành công hay không
//                logout = false;
//                var logout = <%= request.getAttribute("logout")%>;
//
//                if (logout) {
//
//                    Swal.fire({
//                        icon: 'success',
//                        title: 'You Have Successfully\n\
//             Logged Out!',
//                        showConfirmButton: false,
//                        timer: 1500
//                    }
//                    )
//                }
//            };

            $(document).ready(function () {
                $(".addToCartBtn").click(function (event) {
                    event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

                    var productId = $(this).data("productid"); // Lấy productId từ thuộc tính data-productid
                    var userId = $(this).data("userid"); // Lấy userId từ thuộc tính data-userid

                    // Gửi yêu cầu POST tới servlet khi người dùng nhấn nút
                    $.ajax({
                        type: "POST",
                        url: "AddToCart",
                        data: {
                            productId: productId,
                            userId: userId
                        },
                        dataType: "json",
                        success: function (response) {
                            if (response.success) {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Thêm sản phẩm thành công!',
                                    showConfirmButton: false,
                                    timer: 1000
                                });
                                updateCartCount();
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Thêm sản phẩm thất bại.',
                                    showConfirmButton: false,
                                    timer: 1000
                                });
                            }
                        },
                        error: function () {
                            alert("Lỗi trong quá trình xử lý yêu cầu.");
                        }
                    });
                });

                function updateCartCount() {
                    const totalCartLink = document.getElementById("total-cart");
                    let currentValue = parseInt(totalCartLink.textContent, 10);
                    currentValue++;
                    totalCartLink.textContent = currentValue;

                }
            });

        </script>
    </head>
    <body style="background-color:#f7f7f7 ">



        <c:if test="${not empty logout}">
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'You Have Successfully\n\
             Logged Out!',
                    showConfirmButton: false,
                    timer: 1500
                }
                );
            </script>
            <c:remove var="logout" scope="session" />

        </c:if>

                <%@include file= "View/navbar.jsp"%>




        <div class="container-fluid back-img content justify-content-center" style="margin-top: 90px">
            <h2 class="text-center text-danger" style="z-index: 100">  EBook Management System</h2>

            <div class="overlay"></div>
        </div>

        <!--        Recent book-->
        <div class="container" >
            <h3 class="text-center">Recent Book</h3>
            <div class="row ">
                <%                    BookDAOImpl dao = new BookDAOImpl();
                    List<Book> list_re = dao.getRecentBook();
                    for (Book book : list_re) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=book.getPhotoName()%>" style="width: 200px;height: 250px;" class="img-thumblin">
                            <h5 class="card-title"><%=book.getBookName()%></h5>
                            <p><%=book.getAuthor()%></p>
                            <p>Category: <%=book.getBookCategory()%></p>
                            <div class="row text-center justify-content-between">
                                <%
                                    if (user == null) {
                                %>
                                <a  href="<%=url%>/View/login.jsp" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <%
                                } else {
                                %>
<!--                                <a href="AddToCart?bid=<%=book.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>-->
                                <a href="#" class="btn btn-danger btn-sm col-md-4 addToCartBtn" data-productid="<%=book.getBookId()%>" data-userid="<%=user.getId()%>"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <%
                                    }
                                %>
                                <a href="<%=url%>/View/detail_book.jsp?bid=<%=book.getBookId()%>" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3"><i class="fa-solid fa-dollar-sign" style="margin-right: 0.1rem"></i><%=book.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>

                <div class="text-center mt-4">
                    <a href="" class="btn btn-danger btn-sm">View All</a>
                </div>
            </div>
        </div>
        <!--      End  Recent book-->
        <hr>
        <!--        New book-->
        <div class="container" >
            <h3 class="text-center">New Book</h3>
            <div class="row ">

                <%
                    List<Book> list = dao.getNewBook();
                    for (Book book : list) {
                %>
                <div class="col-md-3 bg-light">

                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=book.getPhotoName()%>" style="width: 200px;height: 250px;" class="img-thumblin">
                            <h5 class="card-title"><%=book.getBookName()%></h5>
                            <p><%=book.getAuthor()%></p>
                            <p>Category: <%=book.getBookCategory()%></p>
                            <div class="row text-center justify-content-between">
                                <%
                                    if (user == null) {
                                %>
                                <a  href="<%=url%>/View/login.jsp" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <%
                                } else {
                                %>
<!--                                <a href="AddToCart?bid=<%=book.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>-->
                                <a href="#" class="btn btn-danger btn-sm col-md-4 addToCartBtn" data-productid="<%=book.getBookId()%>" data-userid="<%=user.getId()%>"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <%
                                    }
                                %>
                                <a href="<%=url%>/View/detail_book.jsp?bid=<%=book.getBookId()%>" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3"><i class="fa-solid fa-dollar-sign" style="margin-right: 0.1rem"></i><%=book.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>



                <br>
                <div class="text-center mt-4">
                    <a href="" class="btn btn-danger btn-sm">View All</a>
                </div>
            </div>
        </div>
        <!--      End  New book-->
        <hr>

        <!--        Old book-->
        <div class="container" >
            <h3 class="text-center">Old Book</h3>
            <div class="row ">
                <%
                    List<Book> list_old = dao.getOldBook();
                    for (Book book : list_old) {
                %>
                <div class="col-md-3 bg-light">

                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=book.getPhotoName()%>" style="width: 200px;height: 250px;" class="img-thumblin">
                            <h5 class="card-title"><%=book.getBookName()%></h5>
                            <p><%=book.getAuthor()%></p>
                            <p>Category: <%=book.getBookCategory()%></p>
                            <div class="row text-center justify-content-between">
                                <%
                                    if (user == null) {
                                %>
                                <a  href="<%=url%>/View/login.jsp" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <%
                                } else {
                                %>
<!--                                <a href="AddToCart?bid=<%=book.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>-->
                                <a href="#" class="btn btn-danger btn-sm col-md-4 addToCartBtn" data-productid="<%=book.getBookId()%>" data-userid="<%=user.getId()%>"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <%
                                    }
                                %>
                                <a href="<%=url%>/View/detail_book.jsp?bid=<%=book.getBookId()%>" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3"><i class="fa-solid fa-dollar-sign" style="margin-right: 0.1rem"></i><%=book.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>

                <br>
                <div class="text-center mt-4">
                    <a href="" class="btn btn-danger btn-sm">View All</a>
                </div>
            </div>
        </div>
        <!--      End  Old book-->

        <%@include file="View/footer.jsp" %>
    </body>
</html>
