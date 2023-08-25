<%-- 
    Document   : allBook
    Created on : Aug 24, 2023, 5:15:01 PM
    Author     : ADMIN
--%>
<%@page import="Model.Book"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BookDAOImpl"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Book</title>
        <link  type="text/css" rel="stylesheet" href="<%=url%>/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </head>
    <body style="background-color: #f0f2f2">

        <div class="overlay_all" id="overlay"></div>

        <%@include file= "navbar.jsp"%>
        <h3 class="text-center mt-2">All Book</h3>


        <table class="table table-striped ">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Categories</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>

                <%
                    BookDAOImpl dao = new BookDAOImpl();
                    List<Book> list_book = dao.getAllBook();
                    for (Book b : list_book) {
                %>
                <tr>
                    <th scope="row"> <%=b.getBookId()%></th>
                    <td><img src="<%=url%>/book/<%=b.getPhotoName()%>" style="width: 50px;height: 50px"></td>
                    <td><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getBookCategory()%></td>
                    <td><%=b.getStatus()%></td>
                    <td>
                        <a value="hi" id="edit" href="#" class="btn btn-sm btn-primary">Edit</a>
                        <a id="close" href="#" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>


        <!--            ///////////-->



        <!--        <div class="container p-2 popup">
                    <div class="row mt-3">
                        <div class="col-md-4 offset-md-4">
                            <div class="card">
                                <div class="card-body ">
                                    <h4 class="text-center">Login Page</h4>
                                    <c:if test="${not empty failedMsg}">
                                        <p class="text-center text-danger">${failedMsg}</p>
                                        <c:remove var="failedMsg" scope="session" />
        
                                    </c:if>
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
                                            <button type="submit" class="btn btn-primary mb-2">Login</button>
                                            <br>
                                            <a href="<%=url%>/View/register.jsp" style="text-decoration: none">Create Account</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->



        <div class="popup2">
            <div class="close-btn">&times;</div>
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
                <div class="form-group mb-3">
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
                        <option value="new">New Book</option>
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
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>




        <!--            ///////////-->






        <script src="../../JS/myjs.js" ></script>

    </body>
</html>
