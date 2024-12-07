<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - TribalCrafts</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Header */
        header {
            background-color: #34495e;
            padding: 20px 0;
            color: white;
            text-align: center;
        }

        header h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }

        header p {
            font-size: 18px;
        }

        /* About Section */
        .about-section {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .about-section h2 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .about-section p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .about-section ul {
            list-style: none;
            padding: 0;
        }

        .about-section ul li {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .stakeholders {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .stakeholder {
            padding: 20px;
            background-color: #ecf0f1;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .stakeholder h3 {
            font-size: 22px;
            color: #3498db;
            margin-bottom: 10px;
        }

        .stakeholder p {
            font-size: 16px;
        }
        .stakeholder:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
        .go-back-button {
            background-color: #3498db;
            color: white;
            padding: 12px 30px;
            border: none;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            
            transition: background-color 0.3s ease;
        }

        .go-back-button:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
        .go-back-button {
    display: block;
    margin: 0 auto; /* This will center the button horizontally */
}

        /* Footer */
        footer {
            background-color: #34495e;
            padding: 10px;
            color: white;
            text-align: center;
            margin-top: 30px;
        }

        /* Button */
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 30px;
            background-color: #3498db;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
    </style>
</head>

<body>

    <header>
        <h1>TribalCrafts</h1>
       
    </header>

    <section class="about-section">
        <h2>Our Mission: Empowering Tribal Artisans</h2>
        <p>At TribalCrafts, we believe in the power of craftsmanship to tell stories, preserve cultures, and connect communities. Our platform serves as a bridge between tribal artisans and global customers, enabling these talented individuals to share their culture through beautifully crafted products.</p>

        <h2>What We Do: Crafting a Global Marketplace for Traditional Art</h2>
        <p>We provide a platform for artisans to list their unique handcrafted products, interact with customers, and sell globally, while preserving the authenticity of their traditional crafts. Our goal is to ensure that each artisan’s work is celebrated and preserved for future generations.</p>

        <h2>Our Stakeholders: A Collaborative Effort</h2>
        <div class="stakeholders">
           
            <div class="stakeholder">
                <h3>Artisans</h3>
                <p>Tribal artisans are the creators behind every handcrafted item. They can list their products, fulfill orders, and engage directly with customers.</p>
            </div>
            <div class="stakeholder">
                <h3>Customers</h3>
                <p>Customers explore and purchase unique handcrafted items, provide reviews, and participate in special promotions, helping to support artisans.</p>
            </div>
            <div class="stakeholder">
                <h3>Cultural Consultants</h3>
                <p>Cultural consultants ensure that the content accurately represents the traditional crafts and heritage, maintaining authenticity.</p>
            </div>
        </div>

        <h2>Why Choose Us?</h2>
        <ul>
            <li><strong>Authenticity:</strong> We ensure each product maintains its cultural integrity.</li>
            <li><strong>Fair Trade:</strong> Artisans receive fair compensation for their work.</li>
            <li><strong>Global Reach:</strong> We connect local artisans to a global audience.</li>
            <li><strong>Cultural Preservation:</strong> Every product is backed by its cultural heritage and history.</li>
        </ul>

        <h2>Join Us on Our Journey</h2>
        <p>When you support TribalCrafts, you are not just buying a product : you are helping preserve an ancient culture and supporting talented artisans. Join us and become part of this meaningful journey to preserve the past, enrich the present, and craft a sustainable future.</p>

       
    </section>
            <button class="go-back-button" onclick="window.location.href='index.html';">Go Back to Homepage</button>
    

    <footer>
        <p>&copy; 2024 TribalCrafts. All rights reserved.</p>
    </footer>

</body>

</html>
