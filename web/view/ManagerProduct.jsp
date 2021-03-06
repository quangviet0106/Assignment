<%-- 
    Document   : ManagerProduct
    Created on : Mar 6, 2022, 12:01:46 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Socks</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
        <%
            Integer totalpage = (Integer)request.getAttribute("totalpage");
            Integer pageindex = (Integer)request.getAttribute("pageindex");
        %>
        <script src="js/paggerManagerProduct.js" type="text/javascript"></script>
        <script>
            function deleteProduct(id)
            {
                var result = confirm("Are you sure?");
                if (result)
                {
                    window.location.href = "deleteproduct?pid=" + id;
                }
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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Trang Ch???</a></li>
                        <c:if test="${sessionScope.account !=null}">
                        <li class="nav-item"><a class="nav-link" href="#!">Xin Ch??o ${sessionScope.account.displayname}! </a></li>
                        </c:if>
                        <c:if test="${sessionScope.account ==null}">
                        <li class="nav-item"><a class="nav-link" href="#!">Xin Ch??o! </a></li>
                        </c:if>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Th????ng hi???u</a>
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
                            <input type="text" placeholder="T??m ki???m.." name="search" value="${searchName}">
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
                        <button class="btn btn-outline-dark ms-1" style="padding:  0px" type="submit">
                            <i class="fa fa-heart-o me-1"style="padding: 0" ></i>
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${requestScope.wishlist.size()}</span>
                        </button>
                        </form>
                        <c:if test="${sessionScope.account !=null}">
                            <form action="logout" method="GET">
                                    <button class="btn btn-outline-primary ms-lg-2">????ng Xu???t</button>
                            </form>
                        </c:if>
                        <c:if test="${sessionScope.account ==null}">
                            <form action="login" method="GET">
                                    <button class="btn btn-outline-primary ms-lg-2">????ng Nh???p</button>
                            </form>
                            <form action="signup" method="GET">
                                    <button class="btn btn-outline-primary ms-lg-2">????ng K??</button>
                            </form>
                        </c:if>
  
                </div>
            </div>
        </nav>
        <div class="container mt-5">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-md-6">
                            <h2>Qu???n l?? s???n ph???m</h2>
                        </div>
                        <div class="col-md-6">
                            <a href="addproduct"  class="btn btn-success" data-toggle="modal"><span>Add New Product</span></a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${product}" var="p">
                            <tr>
                                <td>${p.pid}</td>
                                <td>${p.pname}</td>
                                <td>
                                    <img src="${p.pimage}">
                                </td>
                                <td>${p.price}???</td>
                                <td>${p.pcolor}</td>
                                <td>${p.size}</td>
                                <td>
                                    <a href="editproduct?pid=${p.pid}"  class="edit" data-toggle="modal">Edit</a>
                                    <a href="#" onclick="deleteProduct(${p.pid});" class="delete" data-toggle="modal">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="pagger" class="container-pagging" style="text-align:center"> </div>
                <script>
                    paggerManager('pagger',<%=pageindex%>,<%=totalpage%>,1);
                </script>
            </div>
            <a href="home"><button type="button" class="btn btn-primary mb-2">Back to home</button>
            </a>
        </div>
           
        <footer class="py-5 bg-dark">
            <div class="contact text-white">
                <h4>Contacts:</h4>
                <p>Phone: 0902234406</p>
                <p>Address: S??? 15 - La Ph?? - Ho??i ?????c - H?? N???i</p>
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
