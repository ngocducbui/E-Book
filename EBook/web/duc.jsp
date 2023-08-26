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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".delete-button").click(function () {
                    var productDiv = $(this).closest(".product");
                    var productName = productDiv.find(".product-name").text();

                    if (confirm("Do you want to delete the product: " + productName + "?")) {
                        var productId = $(this).data("product-id");

                        $.ajax({
                            type: "POST",
                            url: "duc2",
                            data: {productId: productId},
                            success: function (response) {
                                if (response.success) {
                                    // Xóa sản phẩm khỏi giao diện
                                    productDiv.remove();
                                    alert("Delete successful");
                                } else {
                                    alert("Delete failed");
                                }
                            },
                            error: function () {
                                alert("An error occurred while communicating with the server.");
                            }
                        });
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="product">
            <span class="product-name">Product 1</span>
            <span class="product-price">$100</span>
            <button class="delete-button" data-product-id="1">Delete</button>
        </div>
        <div class="product">
            <span class="product-name">Product 2</span>
            <span class="product-price">$150</span>
            <button class="delete-button" data-product-id="2">Delete</button>
        </div>

        <!-- Nút để mở cửa sổ modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
            Open Modal
        </button>

        <!-- Cửa sổ modal -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal Title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Do You Want To Logout?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Logout</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
