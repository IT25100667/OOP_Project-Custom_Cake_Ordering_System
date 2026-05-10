<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | Sweet Pan</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <style>
        .page-header {
            background: linear-gradient(135deg, hsl(var(--clr-primary)) 0%, #4a1538 100%);
            color: white;
            padding: 8rem 0 4rem;
            text-align: center;
            border-radius: 0 0 50px 50px;
            margin-bottom: 4rem;
        }

        .profile-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 3rem;
            margin-bottom: 5rem;
        }

        .profile-sidebar {
            background: hsl(var(--clr-surface));
            border-radius: 16px;
            padding: 2rem;
            box-shadow: var(--shadow-sm);
            height: fit-content;
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: hsl(var(--clr-primary) / 0.1);
            color: hsl(var(--clr-primary));
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            margin: 0 auto 1.5rem;
        }

        .profile-name {
            text-align: center;
            font-family: var(--font-serif);
            font-size: 1.5rem;
            margin-bottom: 2rem;
        }

        .profile-nav {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .profile-nav-btn {
            padding: 0.8rem 1rem;
            border-radius: 8px;
            text-align: left;
            transition: all var(--transition-fast);
            color: hsl(var(--clr-text-dark) / 0.8);
            font-weight: 500;
        }

        .profile-nav-btn:hover,
        .profile-nav-btn.active {
            background: hsl(var(--clr-primary) / 0.05);
            color: hsl(var(--clr-primary));
        }

        .profile-content {
            background: hsl(var(--clr-surface));
            border-radius: 16px;
            padding: 3rem;
            box-shadow: var(--shadow-sm);
        }

        .order-history-item {
            border: 1px solid rgba(0, 0, 0, 0.05);
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .order-status {
            padding: 0.3rem 0.8rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .status-completed {
            background: #dcfce7;
            color: #166534;
        }

        .status-processing {
            background: #fdf6b2;
            color: #723b13;
        }

        @media (max-width: 768px) {
            .profile-layout {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

    <!-- Fixed Navbar -->
    <nav class="navbar">
        <div class="container nav-container">
            <a href="/home" class="nav-logo">Sweet Pan.</a>
            <ul class="nav-links">
                <li><a href="/home" class="nav-link">Home</a></li>
                <li class="nav-item-dropdown">
                    <a href="#" class="nav-link">Categories <i class="fa-solid fa-chevron-down"
                            style="font-size: 0.8rem; margin-left: 4px;"></i></a>
                    <div class="dropdown-menu">
                        <a href="/search?category=birthday" class="dropdown-item">Birthday Cakes</a>
                        <a href="/search?category=wedding" class="dropdown-item">Wedding Cakes</a>
                        <a href="/search?category=anniversary" class="dropdown-item">Anniversary</a>
                        <a href="/search?category=sweets" class="dropdown-item">Sweets & Treats</a>
                    </div>
                </li>
                <li><a href="/products/custom-cakes" class="nav-link">Custom Cakes</a></li>
                <li><a href="/about" class="nav-link">About</a></li>
                <li><a href="/contact" class="nav-link">Contact</a></li>
                <li><a href="/user/login" class="nav-link">Login</a></li>
            </ul>
            <div class="nav-actions">
                <a href="/user/profile" class="icon-btn active" title="Profile">
                    <i class="fa-solid fa-user"></i>
                </a>
                <a href="/cart" class="icon-btn" title="Cart">
                    <i class="fa-solid fa-bag-shopping"></i>
                    <span class="cart-badge" style="display: none;">0</span>
                </a>
            </div>
            <button class="mobile-toggle"><i class="fa-solid fa-bars"></i></button>
        </div>
    </nav>

    <header class="page-header">
        <div class="container">
            <h1>My Account</h1>
        </div>
    </header>

    <main class="container">

        <div class="profile-layout">
            <div class="profile-sidebar">
                <div class="profile-avatar">
                    <i class="fa-solid fa-user"></i>
                </div>
                <h3 class="profile-name">Venuka</h3>

                <div class="profile-nav">
                    <button class="btn profile-nav-btn active"><i class="fa-solid fa-box"
                            style="margin-right:10px; width:20px;"></i> Orders</button>
                    <button class="btn profile-nav-btn"><i class="fa-solid fa-gear"
                            style="margin-right:10px; width:20px;"></i> Settings</button>
                    <button class="btn profile-nav-btn"><i class="fa-solid fa-heart"
                            style="margin-right:10px; width:20px;"></i> Wishlist</button>
                    <button class="btn profile-nav-btn" style="color: #ef4444;"
                        onclick="window.location.href='/logout'"><i class="fa-solid fa-arrow-right-from-bracket"
                            style="margin-right:10px; width:20px;"></i> Logout</button>
                </div>
            </div>

            <div class="profile-content">
                <h2 style="font-family: var(--font-serif); font-size: 2rem; margin-bottom: 2rem;">Order History</h2>

                <div class="order-history-item">
                    <div>
                        <h4 style="font-family: var(--font-sans); margin-bottom: 0.3rem;">Order #ORD-10492</h4>
                        <p style="color: hsl(var(--clr-text-dark) / 0.6); font-size: 0.9rem;">Placed on Oct 24, 2026</p>
                    </div>
                    <div>
                        <p style="font-weight: 600; text-align: right; margin-bottom: 0.3rem;">$105.00</p>
                        <span class="order-status status-processing">Processing</span>
                    </div>
                </div>

                <div class="order-history-item">
                    <div>
                        <h4 style="font-family: var(--font-sans); margin-bottom: 0.3rem;">Order #ORD-08933</h4>
                        <p style="color: hsl(var(--clr-text-dark) / 0.6); font-size: 0.9rem;">Placed on Aug 12, 2026</p>
                    </div>
                    <div>
                        <p style="font-weight: 600; text-align: right; margin-bottom: 0.3rem;">$55.00</p>
                        <span class="order-status status-completed">Delivered</span>
                    </div>
                </div>

                <div style="text-align: center; margin-top: 3rem;">
                    <a href="/home" class="btn btn-outline">Continue Shopping</a>
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
</body>

</html>