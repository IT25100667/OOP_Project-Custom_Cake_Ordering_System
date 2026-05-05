<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Collection | Sweet Pan</title>
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

        .filter-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 3rem;
            flex-wrap: wrap;
            gap: 1.5rem;
        }

        .filter-tags {
            display: flex;
            gap: 0.8rem;
            overflow-x: auto;
            padding-bottom: 0.5rem;
        }

        .filter-tag {
            padding: 0.6rem 1.5rem;
            border-radius: 50px;
            background: hsl(var(--clr-surface));
            border: 1px solid rgba(0, 0, 0, 0.1);
            color: hsl(var(--clr-text-dark));
            cursor: pointer;
            white-space: nowrap;
            transition: all var(--transition-fast);
        }

        .filter-tag:hover,
        .filter-tag.active {
            background: hsl(var(--clr-primary));
            color: hsl(var(--clr-text-light));
            border-color: hsl(var(--clr-primary));
        }

        .search-results {
            min-height: 50vh;
        }

        .no-results {
            text-align: center;
            padding: 4rem 2rem;
            color: hsl(var(--clr-text-dark) / 0.6);
            grid-column: 1 / -1;
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
                    <a href="#" class="nav-link active">Categories <i class="fa-solid fa-chevron-down"
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
                <a href="/profile" class="icon-btn" title="Profile">
                    <i class="fa-regular fa-user"></i>
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
            <h1 id="page-title" style="color: white; font-size: clamp(2.5rem, 4vw, 4rem); margin-bottom: 0.5rem;">All
                Products</h1>
            <p style="font-size: 1.2rem; opacity: 0.9;">Discover the perfect treat for any occasion.</p>
        </div>
    </header>

    <main class="container search-results">

        <div class="filter-bar">
            <div class="filter-tags" id="filter-tags">
                <button class="filter-tag active" data-filter="all">All Items</button>
                <button class="filter-tag" data-filter="birthday">Birthday</button>
                <button class="filter-tag" data-filter="wedding">Wedding</button>
                <button class="filter-tag" data-filter="anniversary">Anniversary</button>
                <button class="filter-tag" data-filter="sweets">Sweets & Assortments</button>
            </div>

            <div>
                <select
                    style="padding: 0.6rem 1rem; border-radius: 8px; border: 1px solid rgba(0,0,0,0.1); background: hsl(var(--clr-surface)); font-family: var(--font-sans);">
                    <option value="popular">Sort by: Popular</option>
                    <option value="price-low">Price: Low to High</option>
                    <option value="price-high">Price: High to Low</option>
                </select>
            </div>
        </div>

        <div class="product-grid" id="search-grid">
            <!-- Populated via Javascript -->
        </div>

    </main>

    <!-- Footer -->
    <footer class="footer">
        <!-- Kept consistent footer -->
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