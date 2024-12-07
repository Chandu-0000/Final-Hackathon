<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Artisan Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        main {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        h1 {
            color: #8E44AD;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            text-align: left;
        }
        input[type="text"], input[type="password"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
        }
        input[type="submit"] {
            padding: 10px;
            background-color: #8E44AD;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #7D3C98;
        }
        .forgot-password {
            margin-top: 10px;
            display: block;
            color: #888;
        }
        .forgot-password:hover {
            color: #8E44AD;
        }
    </style>
</head>
<body>
    <main>
        <h1><i class="fas fa-paint-brush"></i> Artisan Login</h1>
        <form action="LoginServlet" method="post"> <!-- Added form tag -->
            <input type="hidden" name="loginType" value="artisan"> <!-- Indicating this is an artisan login -->
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Login">
            
            <p>If you don't have an account, <a href="signup.jsp">Sign Up</a></p>
            
            <c:if test="${not empty error}">
                <div style="color: red;">${error}</div>
            </c:if>
        </form> <!-- Closed form tag -->
    </main>
</body>
</html>
