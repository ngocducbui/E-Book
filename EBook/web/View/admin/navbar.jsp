<div class="container-fluid" style="height: 10px; background-color: #303f9f">
    
</div>



<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3 text-center text-success">
            <h3> <i class="fa-solid fa-book" style=" margin-right: 2%"></i>Ebooks</h3>
        </div>
        <div class="col-md-6">
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>     
        </div>
        <div class="col-md-3 text-center">
            <a href="<%=url%>/View/login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket" style="margin-right: 0.3rem"></i>Login</a>
            <a href="<%=url%>/View/register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus" style="margin-right: 0.3rem"></i>Register</a>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom ">
    <div class="container-fluid ">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-house" style="font-size: 16px; align-items: center;"></i></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="<%=url%>/View/admin/home.jsp">Home</a>
                </li>
               
        </div>
    </div>
</nav>