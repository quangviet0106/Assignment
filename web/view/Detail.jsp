<%-- 
    Document   : Detail
    Created on : Feb 20, 2022, 4:51:06 PM
    Author     : DELL
--%>

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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Thương hiệu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <%for (Category c : categorys) {%>
                                    <li><a class="dropdown-item" href="#"><%=c.getCname()%></a></li>
                                    <li><hr class="dropdown-divider" /></li> 
                               <%}%>  
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#!">Log out</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Log in</a></li>
                    </ul>
                    <div class="search-container">
                        <form action="/action_page.php">
                          <input type="text" placeholder="Tìm kiếm.." name="search">
                          <button type="submit">Search</button>
                        </form>
                      </div>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
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
                            <span>${detail.price}</span><br>
                            <span>Màu: ${detail.pcolor}</span><br>
                            <span>Size: </span>

                        </div>
                        <h6 class="fw-bolder">Mô tả:</h6>
                        <p class="lead">${detail.pdescription}</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i>Mua Ngay</i>
                                
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <% for (Product p : products) {%>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="<%=p.getPimage()%>" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a href="#" title="View Product"><%=p.getPname()%></a></h5>
                                    <!-- Product price-->
                                    <%=p.getPrice()%>00₫
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a id="cart" class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
                                    <a id = "details"class="btn btn-outline-dark mt-auto" href="details?pid=<%=p.getPid()%>">Details</a></div>
                            </div>
                        </div>
                    </div>
                    <%}%>
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
        <script src="js/scripts.js"></script>
    </body>     
</html>
