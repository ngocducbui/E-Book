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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            window.onload = function () {
                // Kiểm tra xem có thuộc tính thành công hay không
                var success = null;
                var success = <%= request.getAttribute("success")%>;

                if (success) {
                    // Hiển thị pop-up thông báo thành công
                    swal("Congratulations. You have successfully updated the book", {
                        icon: "success",
                    });
                }
            };
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
                var anh = document.getElementById('anh');
                anh.src = imageUrl;

            }

            $(document).ready(function () {
                $(".delete-button").click(function () {
                    var productDiv = $(this).closest(".product");
                    var productName = productDiv.find(".product-name").text();

                    swal({
                        title: "Are you sure?",
                        text: "Do you want to delete the book: " + productName + "?",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,
                    }).then((willDelete) => {
                        if (willDelete) {
                            var productId = $(this).data("product-id");

                            $.ajax({
                                type: "POST",
                                url: "http://localhost:8080/EBook/DeleteProduct",
                                data: {productId: productId},
                                success: function (response) {
                                    if (response.success) {
                                        // Xóa sản phẩm khỏi giao diện
                                        productDiv.remove();
                                        var successMessage = swal("Delete Successful", {
                                            icon: "success",
                                        });
                                        setTimeout(function () {
                                            successMessage.close();
                                        }, 2000);
                                    } else {
                                        swal("Delete failed. Please try again later!");
                                    }
                                },
                                error: function () {
                                    swal("An error occurred while communicating with the server.");
                                }
                            });
                        } else {
                            swal("The book not deleted.");
                        }
                    });
                });
            });
        </script>
    </head>
    <body style="background-color: #f0f2f2">


        <div class="overlay_all" id="overlay"></div>

        <%@include file= "navbar.jsp"%>



        <c:if test="${empty adminObj}">
            <c:if test="${empty userObj}">
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

                <script>
            swal("Delete Successful", {
                icon: "success",
            });
            // $('#accessDeniedModal').modal('show');
            window.location.href = '../login.jsp';

                </script>
            </c:if>
            <c:if test="${not empty userObj}">
                <script>
                    //   $('#permissionDeniedModal').modal('show');
                    window.location.href = '<%=url%>/index.jsp';
                </script>
            </c:if>
        </c:if>



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
                <tr class="product">
                    <td scope="row" > <%=b.getBookId()%></td>
                    <td><img src="<%=url%>/book/<%=b.getPhotoName()%>" style="width: 50px;height: 50px"></td>
                    <td class="product-name" style="font-weight: bold;"><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td class="product-price"><%=b.getPrice()%></td>
                    <td><%=b.getBookCategory()%></td>
                    <%
                        String status = b.getStatus();
                        if (status.equals("Active")) {
                    %>
                    <td style="color: #22bf76"><%=b.getStatus()%></td>

                    <%
                    } else {
                    %>
                    <td style="color: red"><%=b.getStatus()%></td>
                    <%
                        }
                    %>
                    <td style="display: none;"><%=b.getPhotoName()%></td>

                    <td>
                        <a  href="#" class="btn btn-sm btn-primary edit" onclick="showInfoAndFillForm(this);"> <i class="fa-solid fa-pen-to-square" style="margin-right: 0.3rem"></i>Edit </a>
                        <a  href="#" class="btn btn-sm btn-danger delete-button" data-product-id="<%=b.getBookId()%>"><i class="fa-solid fa-trash-can" style="margin-right: 0.3rem"></i>Delete</a>
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

                <div class="form-group mb-3" style="display:none" >
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
                        <option value="New">New Book</option>
                        <option value="Old">New Book</option>
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
                    <button type="button" class="btn btn-primary w-50" id="submitButton">Change</button>
                </div>
            </form>
        </div>



        <!-- Bootstrap Modals -->
        <div class="modal fade" id="accessDeniedModal" tabindex="-1" aria-labelledby="accessDeniedLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="accessDeniedLabel">Access Denied</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        You are not authorized to access this page. Please log in.
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="permissionDeniedModal" tabindex="-1" aria-labelledby="permissionDeniedLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="permissionDeniedLabel">Permission Denied</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        You do not have permission to access this page.
                    </div>
                </div>
            </div>
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
            document.addEventListener('keydown', function (event) {
                if (event.key === 'Escape') {
                    // Xử lý khi người dùng nhấn phím Esc ở đây
                    overlay.style.display = 'none';
                    document.querySelector(".popup2").classList.remove("active");
                }
            });
            document.getElementById("submitButton").addEventListener("click", function (event) {
                openPopupEdit(event); // Gọi hàm openPopupEdit và truyền sự kiện vào
            });
            function openPopupEdit(event) {
                event.preventDefault();
                swal({
                    title: "Are you sure?",
                    text: "After editing, the original data of the file will be lost!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                document.getElementById("editform").submit();
                                setTimeout(function () {
                                    swal("Poof! Your imaginary file has been deleted!", {
                                        icon: "success",
                                    });
                                }, 1000);
                            } else {
                                swal("You have exited book editing!");
                                document.querySelector(".popup2").classList.remove("active");
                                overlay.style.display = 'none';
                            }
                        });
            }
            function openPopupDelete() {
                swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover this imaginary file!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                swal("Poof! Your imaginary file has been deleted!", {
                                    icon: "success",
                                });
                            } else {
                                swal("Your imaginary file is safe!");
                            }
                        });
            }
        </script>
        <!--    <script src="../../JS/myjs.js" ></script>-->
    </body>
</html>
