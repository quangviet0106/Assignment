<%-- 
    Document   : WishList
    Created on : Mar 16, 2022, 8:47:43 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Socks</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home">The Socks</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Trang Chủ</a></li>
                        <c:if test="${sessionScope.account !=null}">
                        <li class="nav-item"><a class="nav-link" href="#!">Xin Chào ${sessionScope.account.displayname}! </a></li>
                        </c:if>
                        <c:if test="${sessionScope.account ==null}">
                        <li class="nav-item"><a class="nav-link" href="#!">Xin Chào! </a></li>
                        </c:if>
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
                        <form action="search" method="POST">
                            <input type="text" placeholder="Tìm kiếm.." name="search" value="${searchName}">
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
                         <form class="d-flex" action="wishlist">
                        <button class="btn btn-outline-dark ms-1" type="submit">
                            <i class="fa fa-heart-o me-1"style="padding: 0" ></i>
                        </button>
                        </form>
                        <c:if test="${sessionScope.account !=null}">
                            <form action="logout" method="GET">
                                    <button class="btn btn-outline-primary ms-lg-2">Đăng Xuất</button>
                            </form>
                        </c:if>
                        <c:if test="${sessionScope.account ==null}">
                            <form action="login" method="GET">
                                    <button class="btn btn-outline-primary ms-lg-2">Đăng Nhập</button>
                            </form>
                            <form action="signup" method="GET">
                                    <button class="btn btn-outline-primary ms-lg-2">Đăng Ký</button>
                            </form>
                        </c:if>
                </div>
            </div>
        </nav>
        <div class="cart_section mt-5">
        <div class="container-fluid">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
                <div class="cart_container">
                    <div class="cart_items" style="min-height: 1000px">
                        <h1>WishList</h1>
                        <c:if test="${wishlist.size() == 0}">
                            <p class="text-center" style="min-height: 500px">Quý khách không có sản phẩm yêu thích nào !</p>
                        </c:if>
                        <c:if test="${wishlist.size() != 0}">
                            <table class="table caption-top">
                            <thead>
                              <tr>
                                <th scope="col">Image</th>
                                <th scope="col">Product</th>
                                <th scope="col">Color</th>
                                <th scope="col">Size</th>
                                <th scope="col">Price</th>
                                <th scope="col"></th>
                              </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${wishlist}" var="wl">
                              <tr>
                                <td><img src="${wl.wimage}" width="150" style="height:150px"/></td>
                                <th scope="row"><a href="details?pid=${wl.product.pid}" style="color: black">${wl.wname}</a></th>
                                <td>${wl.color}</td>
                                <td>${wl.size}</td>
                                <td>${wl.price}₫</td>
                                <td><a href="deletewishlist?pid=${wl.product.pid}" class="btn btn-outline-danger"><i class="bi bi-trash3"></i>Delete</a></td>
                              </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        </c:if>
                    </div>   
                </div>
            </div>
        </div>
    </div>
    </div>
 
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
