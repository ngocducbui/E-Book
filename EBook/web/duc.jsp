<%-- 
    Document   : duc
    Created on : Aug 25, 2023, 8:47:25 PM
    Author     : ADMIN
--%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.ArrayList"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page import="java.util.List"%>
<%@ page import="org.json.JSONArray" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            function sendRequestToServlet() {
                return new Promise((resolve, reject) => {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "duc2", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4) {
                            if (xhr.status === 200) {
                                var response = JSON.parse(xhr.responseText);
                                resolve(response);
                            } else {
                                reject();
                            }
                        }
                    };

                    xhr.send(); // Gửi yêu cầu
                });
            }

// Trong sự kiện click của nút
            document.getElementById("submitButton").addEventListener("click", function (event) {
                event.preventDefault(); // Ngăn chặn hành vi mặc định của nút submit

                swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover this imaginary file!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                }).then((willDelete) => {
                    if (willDelete) {
                        sendRequestToServlet()
                                .then(response => {
                                    if (response.success) {
                                        swal("Success! Your operation was successful.", {
                                            icon: "success",
                                        });
                                    } else {
                                        swal("Oops! Something went wrong.", {
                                            icon: "error",
                                        });
                                    }
                                })
                                .catch(() => {
                                    swal("An error occurred while communicating with the server.", {
                                        icon: "error",
                                    });
                                });
                    } else {
                        swal("Your imaginary file is safe!");
                    }
                });
            });

        </script>
    </head>
    <body>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Action</th>
            </tr>
            <%
                for (int i = 0; i < 5; i++) {
            %>
            <tr>
                <td><%=i%></td>
                <td><%=i%></td>
                <td><button onclick="showInfoAndFillForm(this)">Show Info and Fill Form</button></td>
            </tr>
            <%
                }
            %>

            <!-- Thêm các dòng khác tương tự -->
        </table>

        <!-- Biểu mẫu để điền dữ liệu -->
        <form>
            ID: <input type="text" id="idInput" name="id"><br>
            Name: <input type="text" id="nameInput" name="name"><br>
            <!-- Các trường khác tương tự -->
        </form>
    </body>
</html>
