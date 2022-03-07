<%-- 
    Document   : UpdateProduct
    Created on : Mar 6, 2022, 3:07:41 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Socks</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link href="css/styles.css" rel="stylesheet" />
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
                        <li class="nav-item"><a class="nav-link" href="#!">Manager</a></li>
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
        <div class="container mt-5">
            <div class="table-title">
                <h2>Update <b>Product</b></h2>
            </div>
            <form action="editproduct" method="POST">
                <div class="modal-body" style="width: 500px">
                    <div class="form-group">
                        <label>ID</label>
                        <input value="${updateproduct.pid}"name="pid" type="hidden" class="form-control" readonly required>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input value="${updateproduct.pname}"name="name" type="text" class="form-control" required>
                    </div>
                   <div class="form-group">
                        <label>Image</label>
                        <input value="${updateproduct.pimage}"name="image" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input value="${updateproduct.price}"name="price" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Color</label>
                        <input value="${updateproduct.pcolor}"name="color" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Size</label>
                        <input value="${updateproduct.size}"name="size" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input value="${updateproduct.quantity}"name="quantity" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea name="description" class="form-control" required>${updateproduct.pdescription}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                            <select name="cid" class="form-select" aria-label="Default select example">
                                <c:forEach items="${category}"var="c">
                                    <option ${requestScope.updateproduct.cate.cid eq c.cid?"selected=\"selected\"":""}
                                        value="${c.cid}">${c.cname}</option>
                                </c:forEach>
                            </select>
                        </div>    
                </div>
                <div class="modal-footer" style="width: 500px">
                    <input type="submit" class="btn btn-success" value="Update">
                </div>
            </form>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>                    
    </body>
</html>
