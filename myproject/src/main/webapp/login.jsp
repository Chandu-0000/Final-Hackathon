<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Login</title>
    <style>
    /* General Body Styling */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-image: url('images/background.jpg');
        background-size: cover;
        background-position: center;
    }

    /* Header Styling */
   /* Header Styling */
header {
    text-align: center;
    margin-bottom: 20px;
    color: black;
    z-index: 1;
    position: absolute; /* Position at the top */
    top: 10px; /* Add spacing from the top */
    left: 50%;
    transform: translateX(-50%); /* Center align horizontally */
    width: 100%;
}

header h1 {
    font-size: 3rem; /* Enhance font size */
    font-weight: bold;
    color: white; /* White color for text */
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7); /* Add subtle shadow for better readability */
    margin: 0; /* Remove extra margin */
}



   nav a {
    text-decoration: none;
    color: black; /* Change text color to black */
    font-size: 1.1rem;
    margin: 0 15px;
    text-transform: uppercase;
}
nav a:hover {
    color: #555; /* Slightly lighter black on hover */
}


    /* Main Container Styling */
    /* Main Container Styling */
main {
    padding: 30px 40px;
    border-radius: 10px;
    width: 100%;
    max-width: 500px;
    text-align: center;
    background: transparent; /* Keep background transparent */
    box-shadow: none; /* Remove shadow */
    position: absolute; /* Position relative to the page */
    top: 50%; /* Center vertically */
    left: 50%; /* Center horizontally */
    transform: translate(-50%, -50%); /* Adjust position to perfectly center */
}

    h2 {
        font-size: 1.8rem;
        margin-bottom: 20px;
        color: #fff; /* Adjust text color to contrast with background */
    }

    /* Login Buttons List Styling */
    ul {
        list-style: none;
        padding: 0;
    }

    ul li {
        margin: 15px 0;
    }

   /* Login Buttons List Styling */
ul li a {
    text-decoration: none;
    font-size: 18px;
    background: linear-gradient(135deg, #4CAF50, #2E7D32); /* Gradient background */
    color: white;
    padding: 15px 20px;
    border-radius: 5px;
    display: block;
    transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Add subtle shadow */
}

ul li a:hover {
    background: linear-gradient(135deg, #66BB6A, #388E3C); /* Lighter gradient on hover */
    transform: translateY(-3px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3); /* Enhance shadow on hover */
}

ul li a i {
    margin-right: 10px;
}

    /* Footer Styling */
    footer {
        text-align: center;
        margin-top: 20px;
        color: #fff; /* Footer text color adjustment */
        font-size: 0.9rem;
    }

    footer p {
        margin: 0;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        main {
            width: 90%;
        }

        header h1 {
            font-size: 2rem;
        }

        ul li a {
            font-size: 16px;
        }
    }
</style>

</head>
<body>
    <header>
        <h1>Select Your Role for Login</h1>
        <nav>
            <a href="index.html">Home</a>
        </nav>
    </header>

    <main>
        <h2>Choose Login Type</h2>
        <ul>
            <li><a href="customerLogin.jsp"><i class="fas fa-user"></i> Customer Login</a></li>
            <li><a href="adminLogin.jsp"><i class="fas fa-user-shield"></i> Admin Login</a></li>
            <li><a href="artisanLogin.jsp"><i class="fas fa-paint-brush"></i> Artisan Login</a></li>
            <li><a href="culturalConsultantLogin.jsp"><i class="fas fa-globe"></i> Cultural Consultant Login</a></li>
        </ul>
    </main>

    <footer>
        <p>&copy; 2024 Handicrafts Platform</p>
    </footer>
</body>
</html>
