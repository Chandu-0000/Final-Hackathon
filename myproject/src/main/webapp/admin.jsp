<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/admin.css">
</head>
<body>
    <div class="dashboard-container">
        <aside class="sidebar">
            <h2>Admin Dashboard</h2>
            <ul class="menu">
                <li><a href="#" onclick="showSection('overview'); return false;">Overview</a></li>
                 <li><a href="FetchCustomers">Customers</a></li>
                <li><a href="FetchArtisans">Artisans</a></li>
                <li><a href="FetchCulturalConsultants">Cultural Consultants</a></li>
                <li><a href="FetchUnapprovedUsers">Approve Users</a></li>
                <li><a href="login.jsp">Logout</a></li>
            </ul>
        </aside>

        <main class="main-content">
            <header>
                <h1>Admin Dashboard</h1>
            </header>

            <!-- Overview Section -->
            <section id="overview" class="content-section">
                <h2>Site Overview</h2>
                <p>Total Artisans: <span id="artisanCount">Loading...</span></p>
                <p>Total Customers: <span id="customerCount">Loading...</span></p>
                <p>Total Cultural Consultants: <span id="consultantCount">Loading...</span></p>
            </section>

          


            <!-- Other sections for artisans, consultants, etc. -->
        </main>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            showSection('overview');
            loadOverview(); // Load the overview data on page load
        });

        // Show a specific section of the admin dashboard
        function showSection(sectionId) {
            const sections = document.querySelectorAll('.content-section');
            sections.forEach(section => {
                section.style.display = (section.id === sectionId) ? 'block' : 'none';
            });
        }

        // Load the site overview data (e.g., total users)
        function loadOverview() {
            fetch('AdminOverviewServlet') // Call the servlet to get the counts
                .then(response => response.json())
                .then(data => {
                    document.getElementById('artisanCount').innerText = data.artisans;
                    document.getElementById('customerCount').innerText = data.customers;
                    document.getElementById('consultantCount').innerText = data.consultants;
                })
                .catch(error => console.error('Error loading overview data:', error));
        }

       
    </script>
</body>
</html>
