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
        <link rel="icon" type="image/png" sizes="32x32" href="book/132332687_1877481222429292_8982841910306197256_o.jpg">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


    </head>
    <body>

        <button id="addToCartBtn">Thêm vào giỏ hàng</button>
        <div id="cartItemCount">Số lượng trong giỏ hàng: 0</div>

        <script>
            $(document).ready(function () {
                $("#addToCartBtn").click(function () {
                    // Gửi yêu cầu POST tới servlet khi người dùng nhấn nút
                    $.ajax({
                        type: "POST",
                        url: "duc2",
                        data: {
                            productId: "product123" // Thay thế bằng mã sản phẩm thực tế
                        },
                        dataType: "json",
                        success: function (response) {
                            if (response.success) {
                                alert("Thêm sản phẩm thành công!");
                                // Cập nhật số lượng sản phẩm trong giỏ hàng
                                updateCartItemCount();
                            } else {
                                alert("Thêm sản phẩm thất bại.");
                            }
                        },
                        error: function () {
                            alert("Lỗi trong quá trình xử lý yêu cầu.");
                        }
                    });
                });
                function updateCartItemCount() {
                    // Cập nhật số lượng sản phẩm trong giỏ hàng
                    // Lấy dữ liệu từ session hoặc cơ sở dữ liệu và cập nhật số lượng
                    var itemCount = 10; // Thay thế bằng số lượng thực tế
                    $("#cartItemCount").text("Số lượng trong giỏ hàng: " + itemCount);
                }
            });
        </script>
    </body>
</html>
