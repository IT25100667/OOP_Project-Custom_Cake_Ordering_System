<!DOCTYPE html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:styles />
<t:header />
<!--Simply importing all the tags(templates) stored in the tags folder into the main jsp file--!>


<section class="hero">
    <div class="hero-bg"></div>
    <div class="container hero-grid">
        <div class="hero-content">
            <h1>Crafting Sweet Memories</h1>
            <p>Indulge in our exquisite collection of premium cakes, or design your own masterpiece tailored for your perfect moment.</p>
            <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                <a href="#popular" class="btn btn-primary">
                    Shop Signature Cakes <i class="fa-solid fa-arrow-right"></i>
                </a>
                <a href="custom-cakes.html" class="btn btn-outline">
                    Design a Custom Cake
                </a>
            </div>
        </div>
        <div class="hero-image-wrapper">
            <!-- Fallback to a nice unsplash image since we don't have local assets yet -->
            <img src="https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-4.0.3&auto=format&fit=crop&w=1089&q=80" alt="Exquisite Chocolate Layer Cake" class="hero-image">
            <div class="hero-decoration"></div>
        </div>
    </div>
</section>

<!-- Popular Items Section (Top 5 Best Selling) -->
<section id="popular" class="container">
    <div class="text-center">
        <h2 class="section-title">Most Loved Creations</h2>
        <p class="section-subtitle">Our top 5 best-selling signature cakes.</p>
    </div>

    <div class="product-grid" id="popular-grid">
        <c:forEach var="product" items="${products}">
            <div class="product-card">
                <div class="product-img-wrap">
                    <span class="product-badge">Best Seller</span>
                    <img src="${product.image}" alt="${product.name}" class="product-img">
                </div>
                <div class="product-info">
                    <span class="product-category">PLACEHOLDER-CAKES</span>
                    <h3 class="product-title"> ${product.name} </h3>
                    <p class="product-price">$${product.price}</p>
                    <div class="product-actions">
                    <button
                        class="btn btn-outline"
                        style="flex: 1;"
                        data-id="${product.id}"
                        data-name="${product.name}"
                        data-price="${product.price}"
                        onclick="addToCart(this)">
                        Add to Cart
                    </button>
                                        </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>

<!-- Cakes Carousel -->
<section class="container">
    <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 2rem;">
        <div>
            <h2 class="section-title">Signature Cakes</h2>
            <p class="section-subtitle" style="margin-bottom: 0;">Explore our classic and modern cake flavors.</p>
        </div>
        <div class="carousel-controls" style="margin-bottom: 0;">
            <button class="carousel-btn btn-prev" aria-label="Previous"><i class="fa-solid fa-arrow-left"></i></button>
            <button class="carousel-btn btn-next" aria-label="Next"><i class="fa-solid fa-arrow-right"></i></button>
        </div>
    </div>

    <div class="carousel-wrapper" id="cakes-carousel">
        <div class="carousel-container">
            <!-- Populated via JS -->
        </div>
    </div>
</section>

<!-- Sweets Carousel -->
<section class="container" style="background-color: hsl(var(--clr-surface)); padding: 6rem 2rem; border-radius: 40px; margin-bottom: 4rem;">
    <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 2rem;">
        <div>
            <h2 class="section-title">Sweets & Assortments</h2>
            <p class="section-subtitle" style="margin-bottom: 0;">Macarons, cupcakes, and delightful treats.</p>
        </div>
        <div class="carousel-controls" style="margin-bottom: 0;">
            <button class="carousel-btn btn-prev" aria-label="Previous"><i class="fa-solid fa-arrow-left"></i></button>
            <button class="carousel-btn btn-next" aria-label="Next"><i class="fa-solid fa-arrow-right"></i></button>
        </div>
    </div>

    <div class="carousel-wrapper" id="sweets-carousel">
        <div class="carousel-container">
            <!-- Populated via JS -->
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="footer-grid">
            <div class="footer-brand">
                <h3>FAB Cakes.</h3>
                <p>Baking happiness and premium quality treats for every special occasion. Design your own, or choose from our signature collections.</p>
                <div style="display: flex; gap: 1rem; margin-top: 1.5rem;">
                    <a href="#" style="color: white; font-size: 1.5rem;"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#" style="color: white; font-size: 1.5rem;"><i class="fa-brands fa-facebook"></i></a>
                    <a href="#" style="color: white; font-size: 1.5rem;"><i class="fa-brands fa-pinterest"></i></a>
                </div>
            </div>
            <div>
                <h4 class="footer-title">Shop</h4>
                <div class="footer-links">
                    <a href="search.html?category=all">All Products</a>
                    <a href="custom-cakes.html">Custom Cakes</a>
                    <a href="search.html?category=wedding">Wedding Collection</a>
                    <a href="search.html?category=sweets">Sweets</a>
                </div>
            </div>
            <div>
                <h4 class="footer-title">Company</h4>
                <div class="footer-links">
                    <a href="about.html">About Us</a>
                    <a href="contact.html">Contact</a>
                    <a href="#">FAQ</a>
                    <a href="#">Terms of Service</a>
                </div>
            </div>
            <div>
                <h4 class="footer-title">Newsletter</h4>
                <p style="color: hsl(var(--clr-text-light) / 0.8); margin-bottom: 1rem; font-size: 0.9rem;">Subscribe for updates and sweet offers.</p>
                <div style="display: flex;">
                    <input type="email" placeholder="Your email" style="padding: 0.8rem; border: none; border-radius: 5px 0 0 5px; outline: none; width: 100%;">
                    <button class="btn btn-accent" style="border-radius: 0 5px 5px 0; padding: 0.8rem 1.2rem;">Subscribe</button>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2026 FAB Cakes. All rights reserved.</p>
        </div>
    </div>
</footer>

<script src="/static/js/main.js"></script>

</body>
</html>
