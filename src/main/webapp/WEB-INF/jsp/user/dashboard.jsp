<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Sweet Pan</title>
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <style>
        .dashboard-header {
            background: linear-gradient(135deg, hsl(var(--clr-primary)) 0%, #4a1538 100%);
            color: white;
            padding: 8rem 0 4rem;
            text-align: center;
            border-radius: 0 0 50px 50px;
            margin-bottom: 4rem;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 5rem;
        }

        .dashboard-card {
            background: hsl(var(--clr-surface));
            padding: 2rem;
            border-radius: 16px;
            box-shadow: var(--shadow-sm);
            text-align: center;
            transition: transform var(--transition-fast), box-shadow var(--transition-fast);
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-md);
        }

        .dashboard-icon {
            font-size: 3rem;
            color: hsl(var(--clr-primary));
            margin-bottom: 1.5rem;
        }

        .dashboard-card h3 {
            font-family: var(--font-serif);
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .dashboard-card p {
            color: hsl(var(--clr-text-dark) / 0.7);
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:styles />
<t:header />
<body>

    <!-- Fixed Navbar -->

    <header class="dashboard-header">
        <div class="container">
            <h1>Welcome to Your Dashboard</h1>
            <p id="welcome-msg" style="font-size: 1.2rem; opacity: 0.9; margin-top: 1rem;">Hello Venuka, we're glad to see you back!</p>
        </div>
    </header>

    <main class="container">
        <div id="employee-stats" style="margin-bottom: 3rem;">
            <div style="background: hsl(var(--clr-surface)); padding: 2rem; border-radius: 16px; box-shadow: var(--shadow-sm); border: 1px solid rgba(0, 0, 0, 0.05); text-align: center; margin-bottom: 2rem;">
                <h3 style="font-family: var(--font-serif); font-size: 1.8rem; margin-bottom: 1rem; color: hsl(var(--clr-primary));">Total Sales</h3>
                <p style="font-size: 3rem; font-weight: 700; color: #166534;">LKR 250,500.00</p>
                <p style="color: hsl(var(--clr-text-dark) / 0.7); margin-top: 0.5rem;">Total value of orders you placed</p>
            </div>

            <div style="background: hsl(var(--clr-surface)); padding: 2rem; border-radius: 16px; box-shadow: var(--shadow-sm); border: 1px solid rgba(0, 0, 0, 0.05);">
                <h3 style="font-family: var(--font-serif); font-size: 1.5rem; margin-bottom: 1.5rem;">Recent Orders</h3>
                <div style="overflow-x: auto;">
                    <table style="width: 100%; border-collapse: collapse; text-align: left;">
                        <thead>
                            <tr style="border-bottom: 2px solid rgba(0,0,0,0.05);">
                                <th style="padding: 1rem; font-weight: 600;">Order ID</th>
                                <th style="padding: 1rem; font-weight: 600;">Date</th>
                                <th style="padding: 1rem; font-weight: 600;">Customer</th>
                                <th style="padding: 1rem; font-weight: 600;">Amount</th>
                                <th style="padding: 1rem; font-weight: 600;">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                                <c:forEach var="order" items="${orders}">
                                    <tr style="border-bottom: 1px solid rgba(0,0,0,0.05);">
                                        <td style="padding: 1rem;">{order.id}</td>
                                        <td style="padding: 1rem;">{order.date_of_order}</td>
                                        <td style="padding: 1rem;"></td>
                                        <td style="padding: 1rem; font-weight: 600;">LKR 12,500</td>
                                        <td style="padding: 1rem;">
                                            <select style="padding: 0.3rem 0.8rem; border-radius: 50px; font-size: 0.8rem; font-weight: 600; border: 1px solid #e5e7eb; cursor: pointer; outline: none; background: #fdf6b2; color: #723b13;" onchange="this.style.background = this.value === 'Processing' ? '#fdf6b2' : '#dcfce7'; this.style.color = this.value === 'Processing' ? '#723b13' : '#166534';">
                                                <option value="Processing" selected>Processing</option>
                                                <option value="Delivered">Delivered</option>
                                            </select>
                                        </td>
                                    </tr>
                                </c:forEach>
                            <tr style="border-bottom: 1px solid rgba(0,0,0,0.05);">
                                <td style="padding: 1rem;">#ORD-08933</td>
                                <td style="padding: 1rem;">Oct 23, 2026</td>
                                <td style="padding: 1rem;">Nimal Silva</td>
                                <td style="padding: 1rem; font-weight: 600;">LKR 8,000</td>
                                <td style="padding: 1rem;">
                                    <select style="padding: 0.3rem 0.8rem; border-radius: 50px; font-size: 0.8rem; font-weight: 600; border: 1px solid #e5e7eb; cursor: pointer; outline: none; background: #dcfce7; color: #166534;" onchange="this.style.background = this.value === 'Processing' ? '#fdf6b2' : '#dcfce7'; this.style.color = this.value === 'Processing' ? '#723b13' : '#166534';">
                                        <option value="Processing">Processing</option>
                                        <option value="Delivered" selected>Delivered</option>
                                    </select>
                                </td>
                            </tr>
                            <tr style="border-bottom: 1px solid rgba(0,0,0,0.05);">
                                <td style="padding: 1rem;">#ORD-08931</td>
                                <td style="padding: 1rem;">Oct 21, 2026</td>
                                <td style="padding: 1rem;">Sunil Fernando</td>
                                <td style="padding: 1rem; font-weight: 600;">LKR 25,000</td>
                                <td style="padding: 1rem;">
                                    <select style="padding: 0.3rem 0.8rem; border-radius: 50px; font-size: 0.8rem; font-weight: 600; border: 1px solid #e5e7eb; cursor: pointer; outline: none; background: #dcfce7; color: #166534;" onchange="this.style.background = this.value === 'Processing' ? '#fdf6b2' : '#dcfce7'; this.style.color = this.value === 'Processing' ? '#723b13' : '#166534';">
                                        <option value="Processing">Processing</option>
                                        <option value="Delivered" selected>Delivered</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <h3>Sweet Pan.</h3>
                    <p>Baking happiness and premium quality treats for every special occasion.</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 Sweet Pan. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="/js/main.js"></script>
    <script src="/js/search.js"></script>

</body>

</html>
