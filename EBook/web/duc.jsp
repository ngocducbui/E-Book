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

        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }

            .sidebar {
                width: 250px;
                height: 100%;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #333;
                color: #fff;
            }

            .sidebar-item {
                display: block;
                padding: 15px;
                cursor: pointer;
                border: none;
                background: none;
                color: inherit;
            }

            .content {
                margin-left: 260px; /* Để chừa không gian cho sidebar */
                padding: 20px;
                background-color: #f9f9f9;
                border-left: 1px solid #ddd;
            }


        </style>
        <script>
            const sidebarItems = document.querySelectorAll('.sidebar-item');
            const contents = document.querySelectorAll('.content');

            sidebarItems.forEach(item => {
                item.addEventListener('click', () => {
                    const targetContentId = item.getAttribute('data-target');
                    contents.forEach(content => {
                        content.style.display = 'none';
                    });
                    document.getElementById(targetContentId).style.display = 'block';
                });
            });

        </script>
    </head>
    <body>

        <div class="sidebar">
            <button class="sidebar-item" data-target="content1">Mục 1</button>
            <button class="sidebar-item" data-target="content2">Mục 2</button>
            <button class="sidebar-item" data-target="content3">Mục 3</button>
        </div>

        <div class="content" id="content1">
            Nội dung mục 1
        </div>

        <div class="content" id="content2">
            Nội dung mục 2
        </div>

        <div class="content" id="content3">
            Nội dung mục 3
        </div>



    </body>
</html>
