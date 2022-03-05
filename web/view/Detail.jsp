<%-- 
    Document   : Detail
    Created on : Feb 20, 2022, 4:51:06 PM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Socks</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/detail.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <% 
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("product");
            ArrayList<Category> categorys = (ArrayList<Category>) request.getAttribute("category");
            
        %>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home">The Socks</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Trang Chủ</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Xin Chào</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Thương hiệu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <c:forEach items="${category}" var="c">
                                    <li><a class="dropdown-item ${tag==c.cid ? "active":""}" href="category?cid=${c.cid}">${c.cname}</a></li>
                                    <li><hr class="dropdown-divider" /></li> 
                                </c:forEach>
                            </ul>
                        </li>
                       
                    </ul>
                    <div class="search-container">
                        <form action="/action_page.php">
                          <input type="text" placeholder="Tìm kiếm.." name="search">
                          <button type="submit">Search</button>
                        </form>
                      </div>
                    <form class="d-flex" action="listcart">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.details.size()}</span>
                        </button>
                    </form>
                        <button class="btn btn-outline-primary ms-lg-2">Đăng Nhập</button>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <div class="breadcrumb-overlay"></div>
                    <h1 class="display-4 fw-bolder">Shop Quang Việt</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Uy tín - Chất lượng cao</p>
                </div>

            </div>
        </header>
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${detail.pimage}" alt="..." /></div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${detail.pname}</h1>
                        <div class="fs-5 mb-5">
                            <span>${detail.price}00₫</span><br>
                            <span>Màu: ${detail.pcolor}</span><br>
                            <span>Size: ${detail.size} </span>

                        </div>
                        <h6 class="fw-bolder">Mô tả:</h6>
                        <p class="lead">${detail.pdescription}</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <form action="addcart" method="POST"> 
                             <input type="hidden" name="id" value="${detail.pid}" /> 
                            <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                Thêm vào giỏ hàng
                            </button>
                            </form>
                            <button class="btn btn-outline-dark flex-shrink-0 ms-2" type="button">
                                <i>Mua Ngay</i>
                                
                            </button>
                        </div>
                    </div>
                </div>
            </div>
             
        </section>            
                 <footer class="py-5 bg-dark">
            <div class="contact text-white">
                <h4>Contacts:</h4>
                <p>Phone: 0902234406</p>
                <p>Address: Số 15 - La Phù - Hoài Đức - Hà Nội</p>
                <div class="icons-social-media">
                    <a href="#" class="fa fa-facebook"></a>
                    <a href="#" class="fa fa-instagram"> </a> 
                    <a href="#" class="fa fa-twitter"> </a>  
                </div>
                    
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        
    </body>     
</html>
