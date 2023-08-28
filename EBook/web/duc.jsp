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
                    var productPrice = parseFloat(productDiv.find(".product-price").text().substring(1));
                    var currentTotalPrice = parseFloat($("#total-price").text().substring(1));

                    var newTotalPrice = currentTotalPrice - productPrice;
                    $("#total-price").text("$" + newTotalPrice.toFixed(2));

                    productDiv.remove();

                    swal("Delete Successful", {
                        icon: "success",
                    });

                    // ... AJAX request to delete product ...
                });
            });

        </script>
    </head>
    <body>
        <table>
            <tr class="product">
                <td class="product-name">Product A</td>
                <td class="product-price">$25.99</td>
                <td><button class="delete-button" data-product-id="1">Delete</button></td>
            </tr>
            <tr class="product">
                <td class="product-name">Product A</td>
                <td class="product-price">$25.99</td>
                <td><button class="delete-button" data-product-id="1">Delete</button></td>
            </tr>
            <tr class="product">
                <td class="product-name">Product A</td>
                <td class="product-price">$25.99</td>
                <td><button class="delete-button" data-product-id="1">Delete</button></td>
            </tr>
            <tr class="product">
                <td class="product-name">Product A</td>
                <td class="product-price">$25.99</td>
                <td><button class="delete-button" data-product-id="1">Delete</button></td>
            </tr>
            <!-- ... other products ... -->
            <tr>
                <td>Total Price:<span style="margin-left: 1rem" id="total-price">$100.00</span></td>
            </tr>
        </table>
    </body>
</html>
