<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: #333;
            line-height: 1.6;
            background: #f4f7fa;
        }

        /* Container for the page */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('./images/background.jpg') no-repeat center center/cover;
        }

        /* Form Container */
        .contact-form {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 30px 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .contact-form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 28px;
        }

        /* Input Fields */
        .form-input {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 15px;
            border: 2px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            background-color: #f9f9f9;
        }

        .form-input:focus {
            border-color: #3498db;
            background-color: #eaf6ff;
        }

        /* Submit Button */
        .submit-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(45deg, #3498db, #2ecc71);
            border: none;
            color: white;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: linear-gradient(45deg, #2980b9, #27ae60);
            transform: translateY(-3px);
        }

        .go-back-button {
            display: block;
            background-color: #3498db;
            color: white;
            padding: 12px 30px;
            border: none;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            margin: 20px auto;
            text-align: center;
        }

        .go-back-button:hover {
            background-color: #2980b9;
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 10px;
            font-size: 14px;
            background: linear-gradient(to right, #2c3e50, #3498db);
            color: white;
        }

        .footer a {
            color: #f1c40f;
            text-decoration: none;
            font-weight: bold;
        }

        .footer a:hover {
            color: #e74c3c;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="contact-form">
            <h2>Contact Us</h2>
            <form action="http://localhost/myproject/send_mail.php" method="POST">
                <label for="name">Name</label>
                <input type="text" id="name" class="form-input" name="name" placeholder="Your Name" aria-label="Your Name" required>
                
                <label for="email">Email</label>
                <input type="email" id="email" class="form-input" name="email" placeholder="Your Email" aria-label="Your Email" required>
                
                <label for="phone">Phone</label>
                <input type="tel" id="phone" class="form-input" name="phone" placeholder="Your Phone Number" aria-label="Your Phone Number" required>
                
                <label for="message">Message</label>
                <textarea id="message" class="form-input" name="message" placeholder="Your Message" rows="4" aria-label="Your Message" required></textarea>
                
                <button type="submit" class="submit-btn">Send Message</button>
            </form>
        </div>
    </div>
    <button class="go-back-button" onclick="window.location.href='index.html';">Go Back to Homepage</button>

    <div class="footer">
        <p>Made by <a href="https://www.example.com" target="_blank">Tribal Handicrafts</a></p>
    </div>
</body>
</html>
