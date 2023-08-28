<%-- 
    Document   : cart
    Created on : Aug 28, 2023, 3:10:11 PM
    Author     : ADMIN
--%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook: Cart</title>
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file= "navbar.jsp"%>

        <div class="container mt-4">
            <div class="row p-2">
                <div class="col-md-6">
                    <div class="card bg-white">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Select Item</h3>

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">First</th>
                                        <th scope="col">Last</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>


                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details For Order</h3>
                            <form>
                                <div class="row  mt-4" >
                                    <div class="form-group col-md-6">
                                        <label for="inputName"  class="form-label">Name</label>
                                        <input type="text" value="" name="name" class="form-control" id="inputName" placeholder="Name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail"  class="form-label">Email</label>
                                        <input type="email" value="" name="email" class="form-control" id="inputEmail" placeholder="Email">
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="form-group col-md-6">
                                        <label for="inputphone"  class="form-label">Phone Number</label>
                                        <input type="number" value="" name="phone" class="form-control" id="inputphone" placeholder="Phone No">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputAddress"  class="form-label">Address</label>
                                        <input type="text" value="" name="address" class="form-control" id="inputAddress" placeholder="Address">
                                    </div>
                                </div>
                                <div class="row  mt-4">
                                    <div class="form-group col-md-6">
                                        <label for="inputLand"  class="form-label">Landmark</label>
                                        <input type="text" value="" name="landmark" class="form-control" id="inputLand" placeholder="Landmark">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputCity"  class="form-label">City</label>
                                        <input type="text" value="" name="city" class="form-control" id="inputCity" placeholder="City">
                                    </div>
                                </div>
                                <div class="row  mt-4">
                                    <div class="form-group col-md-6">
                                        <label for="inputState"  class="form-label">State</label>
                                        <input type="text" value="" name="state" class="form-control" id="inputState" placeholder="State">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPin"  class="form-label">Pin Code</label>
                                        <input type="number" value="" name="pin" class="form-control" id="inputPin" placeholder="Pin Code">
                                    </div>
                                </div>

                                <div class="form-group mt-4">
                                    <label class="form-label" for="payment">Payment Mode</label>
                                    <select class="form-control" id="payment">
                                        <option>--Select--</option>
                                        <option>Cash On Dlivery</option>
                                    </select>
                                </div>

                                <div class="mt-4 text-center">
                                    <a href="<%=url%>/index.jsp" class="btn btn-warning" style="margin-right: 5rem">Continue Shopping</a>
                                    <a class="btn btn-success">Order Now</a>

                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
