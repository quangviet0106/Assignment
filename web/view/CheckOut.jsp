<%-- 
    Document   : CheckOut
    Created on : Mar 3, 2022, 9:13:05 PM
    Author     : Admin
--%>
<%@page import="model.CartDetail"%>
<%@page import="model.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Socks</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
       
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <%
            Cart cart = (Cart)session.getAttribute("carts");
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
        <section class="py-5"> 
            <div class="container" style="min-height: 1000px">
                <h1>Thủ tục thanh toán</h1>
                <div class="row">
                    <div class="col-md-9" style="border: 1px solid #ccc ; border-radius: 5px;padding: 1rem;">
                        <div class="cart_items">
                        <table class="table caption-top">
                            <thead>
                              <tr>
                                <th scope="col">Image</th>
                                <th scope="col">Product</th>
                                <th scope="col">Color</th>
                                <th scope="col">Size</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                                
                              </tr>
                            </thead>
                            <tbody>
                                <%for (CartDetail detail : cart.getDetails()) {%>

                            
                              <tr>
                              <input type="hidden" name="id" value="<%=detail.getProduct().getPid()%>"/>
                              <td><img src="<%=detail.getProduct().getPimage()%>" width="150" style="height:150px"/></td>
                                <th scope="row"><%=detail.getProduct().getPname()%></th>
                                <td><%=detail.getProduct().getPcolor()%></td>
                                <td><%=detail.getProduct().getSize()%></td>
                                <td><%=detail.getProduct().getPrice()%>₫</td>
                                <td><%=detail.getQuantity()%></td>
                                <td><%=detail.getTotal()%>₫</td>
                                
                              </tr>
                            
                             <%}%>
                            </tbody>
                        </table>
                         
                    </div>
                        
                    <div class="order_total">
                        <div class="order_total_content text-md-right">
                            <div class="order_total_title">Order Total:</div>
                            <div class="order_total_amount"><%=cart.getTotal() %>₫</div>
                        </div>
                    </div>
                    </div>
                    <div class="col-md-3" style="border: 1px solid #ccc ; border-radius: 5px;padding: 1rem;">
                        <form action="checkout" method="POST">
                        <div class="mb-3">
                          <label for="name" class="form-label">Họ Tên</label>
                          <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                          <label for="phone" class="form-label">Số điện thoại</label>
                          <input type="text" class="form-control" id="phone" name="phone" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                          <label for="address" class="form-label">Địa chỉ</label>
                          <input type="text" class="form-control" id="address" name="address" aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label for="note">Ghi chú</label>
                            <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                      </div>
                        <button type="submit" class="btn btn-primary w-100 mt-5">Đặt Hàng</button>
                      </form>
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
