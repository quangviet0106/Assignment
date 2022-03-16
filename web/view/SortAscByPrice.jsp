<%-- 
    Document   : SortAscByPrice
    Created on : Mar 15, 2022, 12:12:31 AM
    Author     : Admin
--%>
<%@page import="model.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Socks</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <% 
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("product");
            Integer totalpage = (Integer)request.getAttribute("totalpage");
            Integer pageindex = (Integer)request.getAttribute("pageindex");
            
        %>
        <script src="js/paggerSortAsc.js" type="text/javascript"></script>
        <script>
            function submitForm()
            {
                document.getElementById("searchForm").submit();
            }
        </script>
    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-light bg-light ">
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
            <div class="row">
            <div class="col-md-2 mt-5">
            <div class="mb-4 ms-5">
                <h5><i class="bi bi-filter"><b></i>Lọc & Sắp xếp</b></h5>
                <div class="mt-4">
                    <form id="searchForm" action="searchprice" method="POST">
                        <b>Mức giá</b><br>
                        <input onchange="submitForm()" type="checkbox" name="price1" value="10000"/> Từ 10- 20 nghìn <br>
                        <input onchange="submitForm()" type="checkbox" name="price2" value="20000"/> Từ 20- 30 nghìn <br>
                        <input onchange="submitForm()" type="checkbox" name="price3" value="30000"/> Từ 30- 40 nghìn <br>
                        <input onchange="submitForm()"  type="checkbox" name="price4" value="40000"/> Trên 40 nghìn 
                    </form>
                    <a href="sortasc" style="color:black"><i class="bi bi-sort-down"></i> Giá(thấp-cao)</a><br>
                    <a href="sortdesc"style="color:black"><i class="bi bi-sort-up"></i> Giá(cao-thấp)</a> 
                </div>
                <div class="mt-5">
                     <form id="searchColor" action="colorproduct" method="POST">
                        <b>Màu sắc</b><br>
                        <input onchange="submitForm1()" type="checkbox" name="color" value="đen"/> Đen <br>
                        <input onchange="submitForm1()" type="checkbox" name="color" value="trắng"/> Trắng <br>
                        <input onchange="submitForm1()" type="checkbox" name="color" value="xám"/> Xám <br>
                        <input onchange="submitForm1()"  type="checkbox" name="color" value="xanh lam"/> Xanh Lam<br>
                        <input onchange="submitForm1()"  type="checkbox" name="color" value="xanh lá"/> Xanh Lá<br>
                        <input onchange="submitForm1()"  type="checkbox" name="color" value="vàng"/> Vàng<br>
                        <input onchange="submitForm1()"  type="checkbox" name="color" value="đỏ"/> Đỏ<br>
                        <input onchange="submitForm1()"  type="checkbox" name="color" value="nâu"/> Nâu<br>
                    </form>
                </div>
            </div>
                
            </div>
            <div class="container px-4 px-lg-5 mt-5 col-md-10">
                <h1>All Products<span style="font-size: 25px ; color: #bcbebf">(${requestScope.count} sản phẩm)</span></h1>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <% for (Product p : products) {%>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="<%=p.getPimage()%>" alt="..." />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder"><a href="details?pid=<%=p.getPid()%>" title="View Product"><%=p.getPname()%></a></h5>
                                    <%=p.getPrice()%>₫
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <form action="addcart" method="POST"> 
                                        <input type="hidden" name="id" value="<%=p.getPid()%>" /> 
                                        <input id = "cart" type="submit" value="Thêm vào giỏ hàng"/> 
                                    </form>
                                    <form action="wishlist/add" method="POST"> 
                                        <input type="hidden" name="id" value="<%=p.getPid()%>" /> 
                                        <button class="btn btn-outline-dark flex-shrink-0 ms-1 mt-2" style="height: 38px" type="submit">
                                           <i class="fa fa-heart-o me-1" style="padding:0"></i>
                                       </button>
                                    </form>  
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
            </div>
            <div id="paggerbot" class="container-pagging" style="text-align:center"> </div>
        <script>
            paggersortasc('paggerbot',<%=pageindex%>,<%=totalpage%>,1);
        </script>     
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
