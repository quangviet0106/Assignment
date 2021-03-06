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
        <link href="css/Rate.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <% 
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("product");
            ArrayList<Category> categorys = (ArrayList<Category>) request.getAttribute("category");
            
        %>
         <script>
            function submitForm2()
            {
                alert('Cảm ơn bạn đã đánh giá sản phẩm của chúng tôi!');
                document.getElementById("ratestar").submit();
                
            }
             
        </script>
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
                        <c:if test="${sessionScope.account.gid==1}">
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Manager</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li class="nav-item"><a class="nav-link" href="manager">Product</a></li>
                                <li class="nav-item"><a class="nav-link" href="managercategory">Category</a></li>
                                <li class="nav-item"><a class="nav-link" href="managerorderdetails">OrderDetail</a></li>
                                <li class="nav-item"><a class="nav-link" href="managerorder">Order</a></li>
                                <li class="nav-item"><a class="nav-link" href="managershipping">Shipping</a></li>
                            </ul>
                        </li>
                        </c:if>
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
        <!-- Header-->
        <header class="bg-info py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <div class="breadcrumb-overlay"></div>
                    <h1 class="display-4 fw-bolder">Quang Việt Store</h1>
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
                            <span>${detail.price}₫</span><br>
                            <span>Màu: ${detail.pcolor}</span><br>
                            <span>Size: ${detail.size} </span>

                        </div>
                        <h6 class="fw-bolder">Mô tả:</h6>
                        <p class="lead">${detail.pdescription}</p>
                        <div class="d-flex">
                            <form action="addcart" method="POST"> 
                             <input type="hidden" name="id" value="${detail.pid}" /> 
                            <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                Thêm vào giỏ hàng
                            </button>
                            </form>
                            <form action="addwishlist" method="POST"> 
                             <input type="hidden" name="id" value="${detail.pid}" /> 
                             <button class="btn btn-outline-dark flex-shrink-0 ms-1" style="height: 38px" type="submit">
                                <i class="fa fa-heart-o me-1" style="padding:0"></i>
                            </button>
                            </form>  
                        </div>
                    </div>
                </div>
            </div>
            <div class="container px-4 px-lg-5 mt-5">                 
                <div class="rating-css">
               <h2>Đánh giá sản phẩm</h2> 
               <div class="rate-items">
                   <div style="width: 130px ; height: 32px;font-size: 20px;border:1px solid;padding: 0 10px;margin-right: 8px;">5 sao(${rate5})</div>
                   <div style="width: 130px ; height: 32px;font-size: 20px;border:1px solid;padding: 0 10px;margin-right: 8px;">4 sao(${rate4})</div>
                   <div style="width: 130px ; height: 32px;font-size: 20px;border:1px solid;padding: 0 10px;margin-right: 8px;">3 sao(${rate3})</div>
                   <div style="width: 130px ; height: 32px;font-size: 20px;border:1px solid;padding: 0 10px;margin-right: 8px;">2 sao(${rate2})</div>
                   <div style="width: 130px ; height: 32px;font-size: 20px;border:1px solid;padding: 0 10px;margin-right: 8px;">1 sao(${rate1})</div>
               </div> 
               <form id="ratestar" action="rate" method="POST">
                <div class="star-icon">
                  <input type="hidden" name="pid" value="${detail.pid}"/>
                  <input onchange="submitForm2()" type="radio" name="rating5" value="1" id="rating5">
                  <label for="rating5" class="fa fa-star" ></label>
                  <input onchange="submitForm2()" type="radio" name="rating4" value="1" id="rating4">
                  <label for="rating4" class="fa fa-star"></label>
                  <input onchange="submitForm2()"type="radio" name="rating3" value="1" id="rating3">
                  <label for="rating3" class="fa fa-star"></label>
                  <input onchange="submitForm2()"type="radio" name="rating2"value="1" id="rating2">
                  <label for="rating2" class="fa fa-star"></label>
                  <input onchange="submitForm2()"type="radio" name="rating1" value="1" id="rating1">
                  <label for="rating1" class="fa fa-star"></label>
                </div>
                </form>                
            </div>
            </div>
            <div class="container px-4 px-lg-5 mt-5">
                <h2>Những sản phẩm mới nhất</h2>  
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${newproducts}" var="p">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="${p.pimage}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a href="details?pid=${p.pid}" title="View Product">${p.pname}</a></h5>
                                    <!-- Product price-->
                                    ${p.price}₫
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    
                                    <form action="addcart" method="POST"> 
                                        <input type="hidden" name="id" value="${p.pid}" /> 
                                        <input id = "cart" type="submit" value="Thêm vào giỏ hàng"/> 
                                    </form>
                                    <form action="addwishlist" method="POST"> 
                                        <input type="hidden" name="id" value="${p.pid}" /> 
                                        <button class="btn btn-outline-dark flex-shrink-0 ms-1 mt-2" style="height: 38px" type="submit">
                                           <i class="fa fa-heart-o me-1" style="padding:0"></i>
                                       </button>
                                    </form>  
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
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
