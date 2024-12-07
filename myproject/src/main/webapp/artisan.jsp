<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Artisan Dashboard</title>
    <link rel="stylesheet" href="css/artisian.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
</head>
<body>
    <div class="dashboard-container">
        <aside class="sidebar">
            <h2>Dashboard</h2>
            <ul class="menu">
                <li><a href="#" onclick="showSection('createProduct'); return false;">Create Product</a></li>
                <li><a href="#" onclick="showSection('manageProducts'); loadManageProducts(); return false;">Manage Products</a></li>
                <li><a href="#" onclick="showSection('profile'); loadProfile(); return false;">Profile</a></li>
                <li><a href="login.jsp">Logout</a></li>
            </ul>
        </aside>

        <main class="main-content">
            <header>
                <h1>Artisan Dashboard</h1>
            </header>

            <!-- Create Product Section -->
            <section id="createProduct" class="content-section">
                <form class="product-form" action="addProduct" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <h2>Create New Product</h2>
    <div class="form-row">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required>
    </div>
    <div class="form-row">
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea>
    </div>
    <div class="form-row">
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" min="0" required>
    </div>
    <div class="form-row">
        <label for="stock">Stock:</label>
        <input type="number" id="stock" name="stock" min="0" required>
    </div>
    <div class="form-row">
        <label for="image">Image:</label>
        <input type="file" id="image" name="image" required>
    </div>
    <button type="submit">Create Product</button>
</form>

            </section>

            <!-- Manage Products Section -->
            <section id="manageProducts" class="content-section">
                <h2>Manage Your Products</h2>
                <div id="productList" class="product-list"></div>
            </section>

           <section id="profile" class="content-section">
    <h2>Your Profile</h2>
    <div class="profile-info">
        <div class="profile-card">
            <div class="profile-header">
               
            </div>
            <div id="profileData">
    <p><strong><i class="fa fa-envelope"></i> Email:</strong> <span id="emailDisplay"></span></p>
    <p><strong><i class="fa fa-phone"></i> Phone:</strong> <span id="phoneDisplay"></span></p>
    <p><strong><i class="fa fa-map-marker"></i> Address:</strong> <span id="addressDisplay"></span></p>
</div>

            <div id="errorMessage" class="error-message"></div>
            <div id="loadingMessage" class="loading-message">Loading profile details...</div>
        </div>
    </div>
</section>
<section id="notifications" class="content-section">
    <h2>Your Notifications</h2>
    <div id="notificationList"></div>
</section>






        </main>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            showSection('createProduct'); // Display Create Product section by default
        });

        function showSection(sectionId) {
            const sections = document.querySelectorAll('.content-section');
            sections.forEach(section => {
                section.style.display = (section.id === sectionId) ? 'block' : 'none';
            });
        }

        function loadManageProducts() {
            fetch('manageProducts')
                .then(response => response.text())
                .then(data => {
                    document.getElementById('productList').innerHTML = data;
                    loadNotifications();  // Load notifications after products are displayed
                })
                .catch(error => console.error('Error loading products:', error));
        }

        function loadNotifications() {
            fetch('getNotifications')  // Assume this endpoint returns notifications for the artisan
                .then(response => response.json())
                .then(data => {
                    let notificationList = '';
                    data.forEach(notification => {
                        notificationList += `<p class="notification">${notification.message}</p>`;
                    });
                    document.getElementById('notificationList').innerHTML = notificationList;
                })
                .catch(error => console.error('Error loading notifications:', error));
        }
        function loadProfile() {
            document.getElementById('loadingMessage').style.display = 'block'; // Show loading message
            document.getElementById('errorMessage').textContent = ''; // Clear any previous errors

            fetch('ProfileServlet')
                .then(response => {
                    if (!response.ok) throw new Error('Network response was not ok');
                    return response.json();
                })
                .then(data => {
                    document.getElementById('emailDisplay').textContent = data.email || "Not available";
                    document.getElementById('phoneDisplay').textContent = data.phone || "Not available";
                    document.getElementById('addressDisplay').textContent = data.address || "Not available";
                    document.getElementById('loadingMessage').style.display = 'none'; // Hide loading message
                })
                .catch(error => {
                    document.getElementById('errorMessage').textContent = "Error loading profile data.";
                    document.getElementById('loadingMessage').style.display = 'none'; // Hide loading message
                    console.error('Error loading profile data:', error);
                });
        }
        function validateForm() {
            const price = document.getElementById("price").value;
            const stock = document.getElementById("stock").value;

            if (price < 0) {
                alert("Price cannot be negative.");
                return false;
            }

            if (stock < 0) {
                alert("Stock cannot be negative.");
                return false;
            }

            return true; // Proceed with form submission
        }



        
    </script>
    
</body>
</html>
