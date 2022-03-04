<%-- 
    Document   : ListCart
    Created on : Feb 25, 2022, 9:44:17 PM
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
        <link href="css/cart.css" rel="stylesheet" />
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
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.details.size()}</span>
                        </button>
                    </form>
                          <button class="btn btn-outline-primary ms-lg-2">Login</button>
                </div>
            </div>
        </nav>
        
        <div class="cart_section">
        <div class="container-fluid">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
                <div class="cart_container" style="min-height: 1000px">
                    <div class="cart_title">Shopping Cart</div>
                    <%if(cart == null){%>
                    <h1>ListCart is empty !</h1>
                    <%}else{%>
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
                                <th scope="col"></th>
                              </tr>
                            </thead>
                            <tbody>
                                <%for (CartDetail detail : cart.getDetails()) {%>

                            <form action="update-cart">
                              <tr>
                              <input type="hidden" name="id" value="<%=detail.getProduct().getPid()%>"/>
                              <td><img src="<%=detail.getProduct().getPimage()%>" width="150" style="height:150px"/></td>
                                <th scope="row"><%=detail.getProduct().getPname()%></th>
                                <td><%=detail.getProduct().getPcolor()%></td>
                                <td><%=detail.getProduct().getSize()%></td>
                                <td><%=detail.getProduct().getPrice()%>00₫</td>
                                <td><input onchange="this.form.submit()" type="number" name="quantity" value="<%=detail.getQuantity()%>"/></td>
                                <td><%=detail.getTotal()%>00₫</td>
                                <td><a href="delete-cart?id=<%=detail.getProduct().getPid()%>" class="btn btn-outline-danger"><i class="bi bi-trash3"></i>Delete</a></td>
                              </tr>
                            </form>
                             <%}%>
                            </tbody>
                        </table>
                         
                    </div>
                        
                    <div class="order_total">
                        <div class="order_total_content text-md-right">
                            <div class="order_total_title">Order Total:</div>
                            <div class="order_total_amount"><%=cart.getTotal() %>00₫</div>
                        </div>
                    </div>
                    <div class="cart_buttons">
                            <form action="home" method="POST">
                            <button type="submit" class="button cart_button_clear">Continue Shopping</button> 
                            </form>
                            <form action="checkout" method="GET">
                                    <button type="submit" class="button cart_button_checkout mt-5">Check Out</button> 
                            </form>
                            
                    </div>
                  
                </div>
            </div>
        </div>
    </div>
</div>
<%}%>  
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
