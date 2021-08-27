<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<form method="post" action='register.jsp'>

                    <hr>

                    <label for="username"> Email </label>
                    <div>
                        <input type="text" name="email" id="username" value="" placeholder="Email ">
                    </div>

                    <label for="password">Password</label>
                    <div>
                        <input type="password" name="password" id="password" value="" class="form-control"
                            placeholder="Password">
                    </div>

                    <input type="submit" value="Register">

                   
                </form>

</body>
</html>