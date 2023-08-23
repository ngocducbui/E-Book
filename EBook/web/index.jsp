<%-- 
    Document   : index
    Created on : Aug 23, 2023, 3:28:20 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook:</title>
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

    </head>
    <body style="background-color:#f7f7f7 ">

        <%@include file= "View/navbar.jsp"%>

        <div class="container-fluid back-img">
            <h2 class="text-center text-danger"> EBook Management System</h2>
        </div>


        <!--        Recent book-->
        <div class="container" >
            <h3 class="text-center">Recent Book</h3>
            <div class="row ">
                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="text-center">
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
                <div class="col-md-3 bg-light">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="text-center">
                    <a href="" class="btn btn-danger btn-sm">View All</a>
                </div>
            </div>
        </div>
        <!--      End  New book-->
        <hr>

        <!--        Old book-->
        <div class="container" >
            <h3 class="text-center">Olds Book</h3>
            <div class="row ">
                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <img alt="" src="book/python.jpg" style="width: 200px;height: 250px;" class="img-thumblin">
                            <p>Java Programming</p>
                            <p>Balumahuwnw</p>
                            <p>Category:New</p>
                            <div class="row text-center justify-content-between">
                                <a href="" class="btn btn-danger btn-sm col-md-4"><i class="fa-solid fa-cart-plus" style="margin-right: 0.3rem"></i>Add Cart</a>
                                <a href="" class="btn btn-success btn-sm col-md-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm col-md-3">299</a>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="text-center">
                    <a href="" class="btn btn-danger btn-sm">View All</a>
                </div>
            </div>
        </div>
        <!--      End  Old book-->

        <%@include file="View/footer.jsp" %>
    </body>
</html>
