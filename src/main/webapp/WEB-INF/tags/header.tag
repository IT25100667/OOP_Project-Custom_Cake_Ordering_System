<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Fixed Navbar -->
<nav class="navbar">
    <div class="container nav-container">
        <a href="index.html" class="nav-logo">FAB Cakes.</a>

        <ul class="nav-links">
            <li><a href="index.html" class="nav-link active">Home</a></li>
            <li class="nav-item-dropdown">
                <a href="#" class="nav-link">Categories <i class="fa-solid fa-chevron-down" style="font-size: 0.8rem; margin-left: 4px;"></i></a>
                <div class="dropdown-menu">
                    <c:forEach var="category" items="${categories}">
                           <a href="#" class="dropdown-item" data-category="birthday">
                               ${category.name}
                           </a>
                    </c:forEach>

                </div>
            </li>
            <li><a href="custom-cakes.html" class="nav-link">Custom Cakes</a></li>
            <li><a href="/about" class="nav-link">About</a></li>
            <li><a href="contact.html" class="nav-link">Contact</a></li>
            <li><a href="PRO.html" class="nav-link">Login</a></li>
        </ul>

        <div class="nav-actions">
            <a href="#" class="icon-btn" title="Profile">
                <i class="fa-regular fa-user"></i>
            </a>
            <a href="cart.html" class="icon-btn" title="Cart">
                <i class="fa-solid fa-bag-shopping"></i>
                <span class="cart-badge" style="display: none;">0</span>
            </a>
        </div>

        <!-- Mobile Menu Toggle -->
        <button class="mobile-toggle">
            <i class="fa-solid fa-bars"></i>
        </button>
    </div>
</nav>