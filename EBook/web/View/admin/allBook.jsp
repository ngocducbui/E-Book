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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            function showInfoAndFillForm(row) {
                var rowData = $(row).closest('tr').find('td').map(function () {
                    return $(this).text();
                }).get();

                // Hiển thị danh sách dữ liệu trong console (để kiểm tra)
                console.log(rowData);

                // Điền dữ liệu từ rowData vào các trường của biểu mẫu
                $('#id').val(rowData[0]);
                $('#exampleInputName').val(rowData[2]);
                $('#exampleInputAuthor').val(rowData[3]);
                $('#exampleInputPrice').val(rowData[4]);
                $('#inputState').val(rowData[5]);
                $('#inputStatus').val(rowData[6]);
                var currentUrl = window.location.href;
                var fourthData = rowData[7];
                var imageUrl = "../../book/" + fourthData;
                // var imageContainer = document.getElementById('imageContainer');

//                if (!imageContainer.querySelector('img')) {
//
//                    var imgElement = document.createElement('img');
////                imgElement.onload = function () {
////                    var width = 50px;
////                    var height =50px;
////
////                };
//                    imgElement.src = imageUrl;
//                    imgElement.style.width = "50px";
//                    imgElement.style.height = "50px";
//                    var imageContainer = document.getElementById('imageContainer');
//                    imageContainer.appendChild(imgElement);
//
//
//
//                    var resetButton = document.getElementById('resetButton');
//                    resetButton.addEventListener('click', function () {
//                        imgElement.src = ""; // Khôi phục lại hình ảnh ban đầu
//
//                    });
//                }
                var anh = document.getElementById('anh');
                anh.src = imageUrl;

            }


        </script>
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
                    <td scope="row"> <%=b.getBookId()%></td>
                    <td><img src="<%=url%>/book/<%=b.getPhotoName()%>" style="width: 50px;height: 50px"></td>
                    <td><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getBookCategory()%></td>
                    <td><%=b.getStatus()%></td>
                    <td style="display: none;"><%=b.getPhotoName()%></td>

                    <td>
                        <a  href="#" class="btn btn-sm btn-primary edit" onclick="showInfoAndFillForm(this);"> Edit </a>
                        <a id="resetButton" href="#" class="btn btn-sm btn-danger">Delete</a>
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
            <h4 class="text-center">Edit Book</h4>
            <c:if test="${not empty successMsg}">
                <p class="text-center text-success">${successMsg}</p>
                <c:remove var="successMsg" scope="session" />
            </c:if>
            <c:if test="${not empty failedMsg}">
                <p class="text-center text-danger">${failedMsg}</p>
                <c:remove var="failedMsg" scope="session" />

            </c:if>
            <form action="/EBook/AddBook" id="editform" method="post" enctype="multipart/form-data">
                <input type="hidden" name="formType" value="editform">

                <div class="form-group mb-3 " >
                    <label for="id" class="form-label">IDDD<span class="red-star">*</span></label>
                    <input name="idbook" type="text" class="form-control" id="id" aria-describedby="">
                </div>
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
                s

                <div class="form-group mb-3">
                    <label for="inputStatus" class="form-label">Book Status<span class="red-star">*</span></label>
                    <select name="bstatus" class="form-control form-select" id="inputStatus">
                        <option selected>--select--</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <div class="d-flex form-group mb-3">
                    <div class="mr-3" style="margin-right: 1rem">
                        <img id="anh" style="width: 120px; height: 150px">
                    </div>
                    <div class="form-group mb-3 ml-4 mt-auto justify-content-center">
                        <%
                            String path = getServletContext().getRealPath("") + "book";
                            String path_new = path.replace(String.valueOf("\\build"), "");
                        %>
                        <label  for="exampleInputImg" class="form-label">Upload Photo</label>
                        <input  name="img" type="file" class="form-control-file " id="exampleInputImg">
                    </div>
                </div>


                <div class="text-center form-group mb-1 mt-2 ">
                    <button type="submit" class="btn btn-primary w-50">Change</button>
                </div>
            </form>
        </div>




        <!--            ///////////-->

        <script>
            const overlay = document.getElementById('overlay');
            document.addEventListener('click', function (event)


            {
                if (event.target.classList.contains('edit')) {
                    event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

                    // Xử lý sự kiện click cho thẻ <a> có class "edit" ở đây
                    document.querySelector(".popup2").classList.add("active");
                    overlay.style.display = 'block';
                    popup = document.querySelector(".popup2");
                    popup.style.zIndex = "1001";
                    // Thực hiện các hành động cần thiết khi thẻ được click
                }
            }
            );

            overlay.addEventListener('click', () =>
            {
                overlay.style.display = 'none';
                document.querySelector(".popup2").classList.remove("active");

            });

            document.querySelector(".popup2 .close-btn").addEventListener("click", function ()


            {
                document.querySelector(".popup2").classList.remove("active");
                overlay.style.display = 'none';

            }
            );
        </script>
        <!--    <script src="../../JS/myjs.js" ></script>-->

    </body>
</html>
