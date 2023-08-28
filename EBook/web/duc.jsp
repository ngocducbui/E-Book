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
        <link rel="icon" type="image/png" sizes="32x32"  class="rotate-icon" href="book/132332687_1877481222429292_8982841910306197256_o.jpg">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            .rotate-icon {
                animation: spin 2s linear infinite;
            }
        </style>
        <script>


            const iconLink = document.querySelector('link[rel="icon"]');

// Thêm class rotate-icon để bắt đầu hoạt hình
            iconLink.classList.add('rotate-icon');

// Đợi một khoảng thời gian sau đó xoá class để dừng hoạt hình
            setTimeout(() => {
                iconLink.classList.remove('rotate-icon');
            }, 5000); // Thời gian hoạt hình (ms)


        </script>

    </head>
    <body>




        <table id="myTable">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td>Người 1</td>
                    <td><button onclick="deleteRow(this)">Xoá</button></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Người 2</td>
                    <td><button onclick="deleteRow(this)">Xoá</button></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Người 3</td>
                    <td><button onclick="deleteRow(this)">Xoá</button></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Người 3</td>
                    <td><button onclick="deleteRow(this)">Xoá</button></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Người 3</td>
                    <td><button onclick="deleteRow(this)">Xoá</button></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Người 3</td>
                    <td><button onclick="deleteRow(this)">Xoá</button></td>
                </tr>

            </tbody>
        </table>




    </body>
</html>
