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
        <script>
            function showInfoAndFillForm(row) {
                var rowData = $(row).closest('tr').find('td').map(function () {
                    return $(this).text();
                }).get();

                // Hiển thị danh sách dữ liệu trong console (để kiểm tra)
                console.log(rowData);

                // Điền dữ liệu từ rowData vào các trường của biểu mẫu
                $('#idInput').val(rowData[0]);
                $('#nameInput').val(rowData[1]);
            }

           
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
