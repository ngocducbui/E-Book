<%-- 
    Document   : profile
    Created on : Aug 29, 2023, 11:06:30 PM
    Author     : ADMIN
--%>

<%@page import="DAO.UserDAOImpl"%>
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
        <title>EBook: Profile</title>
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/profile.css">
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#avatar').click(function () {
                    $('#file-input').click();
                });

                $('#file-input').change(function (event) {
                    const selectedImage = event.target.files[0];
                    if (selectedImage) {
                        console.log(selectedImage);
                        $('#avatar').attr('src', URL.createObjectURL(selectedImage));
                    }
                });
            });
            function goBack() {
                window.history.back();
            }
        </script>
    </head>
    <body style="background-color: #f0f1f2">

        <%@include file= "navbar.jsp"%>

        <%            UserDAOImpl dao = new UserDAOImpl();
            User user_edit = dao.getUserById(user.getId());
        %>
        <div class="container mt-5">
            <div class="row gutters">
                <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="account-settings">
                                <div class="user-profile">
                                    <div class="user-avatar mt-5">
                                        <img id="avatar" src="../book/129846837_1513137549074595_6888598932010542259_o.jpg" alt="Maxwell Admin" style="cursor: pointer;">    
                                        <input type="file" id="file-input" accept="image/*" style="display: none;">

                                    </div>
                                    <h5 class="user-name"><%=user_edit.getName()%></h5>
                                    <h6 class="user-email"><%=user_edit.getEmail()%></h6>
                                </div>
                                <div class="about mt-5">
                                    <h5>About</h5>
                                    <p>I'm Yuki. Full Stack Designer I enjoy creating user-centric, delightful and human experiences.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body ">
                            <form action="/EBook/UpdateProfile" action="post">
                                <div class="row gutters mt-1">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mt-3">
                                        <h6 class="mb-2 text-primary">Personal Details</h6>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group mb-3">
                                            <label for="fullName" class="form-label">Full Name</label>
                                            <input type="text" class="form-control" id="fullName" placeholder="Enter full name" value="<%=user_edit.getName()%>">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="eMail" class="form-label">Email</label>
                                            <input type="email" class="form-control" id="eMail" placeholder="Enter email ID" value="<%=user_edit.getEmail()%>">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group mb-3">
                                            <label for="phone" class="form-label">Phone</label>
                                            <input type="text" class="form-control" id="phone" placeholder="Enter phone number" value="<%=user_edit.getPhno()%>">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group mb-3">
                                            <label for="website" class="form-label">Website URL</label>
                                            <input type="url" class="form-control" id="website" placeholder="Website url">
                                        </div>
                                    </div>
                                </div>
                                <div class="row gutters mt-1">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                        <h6 class="mt-3 mb-2 text-primary">Address</h6>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group mb-3">
                                            <label for="Street" class="form-label">Street</label>
                                            <input type="name" class="form-control" id="Street" placeholder="Enter Street" value="<%=user_edit.getLandmark()%>">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group mb-3">
                                            <label for="ciTy" class="form-label">City</label>
                                            <input type="name" class="form-control" id="ciTy" placeholder="Enter City" value="<%=user_edit.getCity()%>">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group mb-3">
                                            <label for="sTate" class="form-label">State</label>
                                            <input type="text" class="form-control" id="sTate" placeholder="Enter State" value="<%=user_edit.getState()%>">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group mb-3">
                                            <label for="zIp" class="form-label">Zip Code</label>
                                            <input type="text" class="form-control" id="zIp" placeholder="Zip Code" value="<%=user_edit.getPinc()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row gutters mt-4">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-end">
                                            <a class="btn btn-secondary" onclick="goBack()">Cancel</a>
                                            <button type="submit" id="submit" name="submit" class="btn btn-primary">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
