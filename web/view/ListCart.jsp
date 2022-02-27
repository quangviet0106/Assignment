<%-- 
    Document   : ListCart
    Created on : Feb 25, 2022, 9:44:17 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Socks</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/cart.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <%
            Order order = (Order)session.getAttribute("shoppingcart");
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
                            
                        </button>
                    </form>
                          <button class="btn btn-outline-primary ms-lg-2">Login</button>
                </div>
            </div>
        </nav>
        </header>
        <div class="cart_section">
        <div class="container-fluid">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
                <div class="cart_container">
                    <div class="cart_title">Shopping Cart</div>
                    <div class="cart_items">
                        <% if(order ==null){ %>
                                <h1>Quý khách chưa có sản phẩm nào trong giỏ hàng !</h1> <br/>
                        <%}else {%>
                        <ul class="cart_list">
                            <% for (OrderDetail od : order.getDetails()) {
                            %>
                            <li class="cart_item clearfix">
                                <div class="cart_item_image"><img id="image"src="<%=od.getProduct().getPimage()%>" alt=""></div>
                                <div class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
                                    <div class="cart_item_name cart_info_col">
                                        <div class="cart_item_title">Name</div>
                                        <div class="cart_item_text"><%=od.getProduct().getPname() %></div>
                                    </div>
                                    <div class="cart_item_color cart_info_col">
                                        <div class="cart_item_title">Color</div>
                                        <div class="cart_item_text"><%=od.getProduct().getPcolor()%></div>
                                    </div>
                                    <div class="cart_item_quantity cart_info_col">
                                        <div class="cart_item_title">Quantity</div>
                                        <div class="cart_item_text"><%=od.getOquantity()%></div>
                                    </div>
                                    <div class="cart_item_price cart_info_col">
                                        <div class="cart_item_title">Size</div>
                                        <div class="cart_item_text"><%=od.getProduct().getSize()%></div>
                                    </div>
                                    <div class="cart_item_price cart_info_col">
                                        <div class="cart_item_title">Price</div>
                                        <div class="cart_item_text"><%=od.getPrice() %></div>
                                    </div>
                                    
                                    <div class="cart_item_total cart_info_col">
                                        <div class="cart_item_title">Total</div>
                                        <div class="cart_item_text"><%=od.getTotal()%></div>
                                    </div>
                                </div>
                            </li>
                            <%}%>
                            <%}%>
                        </ul>
                    </div>
                                    
                    <div class="order_total">
                        <div class="order_total_content text-md-right">
                            <div class="order_total_title">Order Total:</div>
                            <div class="order_total_amount"><%=order.getTotal() %></div>
                        </div>
                    </div>
                    <div class="cart_buttons">
                        <div>
                            <form action="home" method="POST">
                            <button type="submit" class="button cart_button_clear">Continue Shopping</button> 
                            </form>
                        </div>
                        <div>
                            <button type="button" class="button cart_button_checkout">Add to Cart</button> </div>
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
        <script src="js/scripts.js"></script>
    </body>
</html>
