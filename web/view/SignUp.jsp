<%-- 
    Document   : SignUp
    Created on : Mar 5, 2022, 3:34:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/login.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
    <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5">Đăng Ký</h5>
            
            <form action="signup" method="POST">
                <p class="text-danger">${usernameexist}</p>
              <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="floatingInput" placeholder="UserName" name="username">
                <label for="floatingInput">UserName</label>
              </div>
              <div class="form-floating mb-3">
                  <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                <label for="floatingPassword">Password</label>
              </div>
              <p class="text-danger">${checkRepeatpassword}</p>
              <div class="form-floating mb-3">
                  <input type="password" class="form-control" id="floatingRepeatPassword" placeholder="Repeat Password" name="repeatpassword">
                <label for="floatingRepeatPassword">Repeat Password</label>
              </div>
              <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="floatingDisplay" placeholder="Display Name" name="displayname">
                <label for="floatingDisplay">Display Name</label>
              </div>
              <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="floatingEmail" placeholder="Email" name="email">
                <label for="floatingEmail">Email</label>
              </div>
              <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="floatingAddress" placeholder="Address" name="address">
                <label for="floatingAddress">Address</label>
              </div>
              <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="floatingPhone" placeholder="Phone" name="phone">
                <label for="floatingPhone">Phone</label>
              </div>
              <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Đăng Ký</button>
              </div>
              <hr class="my-4">
            </form>
          </div>
        </div>
      </div>
    </div>
    </div>
    </body>
</html>
