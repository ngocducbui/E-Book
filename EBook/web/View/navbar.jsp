
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<div class="container-fluid" style="height: 10px; background-color: #303f9f">

</div>



<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3 text-center text-success">
            <h3> <i class="fa-solid fa-book" style=" margin-right: 2%"></i>Ebooks</h3>
        </div>
        <div class="col-md-6">
            <form class="d-flex" role="search" style="max-width: 80%; margin:auto">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>     
        </div>
        <div class="col-md-3 text-center">

            <c:if test="${not empty userObj}">
                <a href="" class="btn btn-success"><i class="fa-solid fa-user" style="margin-right: 0.3rem"></i>${userObj.name}</a>
                <a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary"><i class="fa-solid fa-right-to-bracket" style="margin-right: 0.3rem"></i>Logout</a>

            </c:if>
            <c:if test="${empty userObj}"> 
                <a href="<%=url%>/View/login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket" style="margin-right: 0.3rem"></i>Login</a>

                <a href="<%=url%>/View/register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus" style="margin-right: 0.3rem"></i>Register</a>

            </c:if>


<!--            <a href="<%=url%>/View/login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket" style="margin-right: 0.3rem"></i>Login</a>
<a href="<%=url%>/View/register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus" style="margin-right: 0.3rem"></i>Register</a>-->
        </div>
    </div>
</div>


<!--logout-->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Logout</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h5>Are you sure you want to logout?</h5>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="/EBook/Logout" type="button" class="btn btn-primary">Logout</a>
            </div>
        </div>
    </div>
</div>

<!--logout-->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom ">
    <div class="container-fluid ">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-house" style="font-size: 16px; align-items: center;"></i></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="<%=url%>/index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#"> <i class="fa-solid fa-book-open " style="margin-right: 0.3rem" ></i>Recent Book</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#"> <i class="fa-solid fa-book-open" style="margin-right: 0.3rem"></i>New Book</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#"><i class="fas fa-book-open" style="margin-right: 0.3rem"></i>Old Book</a>
                </li>

            </ul>
            <form class="d-flex">
                <button class="btn btn-light" style="margin-right: 0.5rem" type="submit"><i class="fa-solid fa-gear" style="margin-right: 0.3rem"></i>Setting</button>
                <button class="btn btn-light" type="submit"><i class="fa-solid fa-phone" style="margin-right: 0.3rem"></i>Contact Us</button>
            </form>
            <a href="<%=url%>/duc.jsp">hiiiiiii</a>
        </div>
    </div>
</nav>