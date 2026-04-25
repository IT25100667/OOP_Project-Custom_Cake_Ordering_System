/**
 * Main JavaScript File
 * Handles global interactions like Navbar styling on scroll, mobile menu, and cart state initialization.
 */

document.addEventListener('DOMContentLoaded', () => {
    initNavbar();
    initCartState();
    updateCartBadge();
    initCarousels();
});

// --- Navbar Interactions ---
function initNavbar() {
    const navbar = document.querySelector('.navbar');
    const mobileToggle = document.querySelector('.mobile-toggle');
    const navLinks = document.querySelector('.nav-links');

    // Scroll effect
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // Mobile menu toggle
    if (mobileToggle) {
        mobileToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            // Toggle icon between bars and times
            const icon = mobileToggle.querySelector('i');
            if(icon) {
                if(navLinks.classList.contains('active')){
                    icon.classList.remove('fa-bars');
                    icon.classList.add('fa-times');
                } else {
                    icon.classList.remove('fa-times');
                    icon.classList.add('fa-bars');
                }
            }
        });
    }

    // Handle Dropdown links (redirect to search.html with category)
    const dropdownItems = document.querySelectorAll('.dropdown-item');
    dropdownItems.forEach(item => {
        item.addEventListener('click', (e) => {
            const category = e.target.getAttribute('data-category');
            if (category) {
                // We're navigating, no need to preventDefault if it's an anchor, 
                // but just in case we use JS navigation:
                window.location.href = `search.html?category=${category}`;
            }
        });
    });
}

// --- Cart State Management ---
function initCartState() {
    if (!localStorage.getItem('cake_cart')) {
        localStorage.setItem('cake_cart', JSON.stringify([]));
    }
}

function getCartItems() {
    return JSON.parse(localStorage.getItem('cake_cart') || '[]');
}

function updateCartBadge() {
    const cartBadge = document.querySelector('.cart-badge');
    if (cartBadge) {
        const items = getCartItems();
        // Calculate total quantity
        const total = items.reduce((sum, item) => sum + (item.quantity || 1), 0);
        cartBadge.textContent = total;
        
        if (total === 0) {
            cartBadge.style.display = 'none';
        } else {
            cartBadge.style.display = 'flex';
        }
    }
}

window.addToCart = function(product) {
    const items = getCartItems();
    // Check if item already exists (assuming id is unique, for custom cakes we might use a timestamp id)
    const existingIndex = items.findIndex(item => item.id === product.id);
    
    if (existingIndex > -1 && !product.isCustom) {
        items[existingIndex].quantity += 1;
    } else {
        items.push({
            ...product,
            quantity: 1,
            addedAt: Date.now()
        });
    }
    
    localStorage.setItem('cake_cart', JSON.stringify(items));
    updateCartBadge();
    
    // Optional: show a toast notification here
    showToast(`Added ${product.title} to cart`);
}

function showToast(message) {
    const existingToast = document.querySelector('.toast');
    if(existingToast) existingToast.remove();

    const toast = document.createElement('div');
    toast.className = 'toast';
    toast.style.cssText = `
        position: fixed;
        bottom: 2rem;
        right: 2rem;
        background: hsl(var(--clr-primary));
        color: white;
        padding: 1rem 2rem;
        border-radius: 50px;
        box-shadow: var(--shadow-lg);
        z-index: 9999;
        transform: translateY(100px);
        opacity: 0;
        transition: all var(--transition-fast);
    `;
    toast.innerHTML = `<i class="fa-solid fa-check-circle" style="margin-right: 10px;"></i> ${message}`;
    
    document.body.appendChild(toast);
    
    // Animate in
    setTimeout(() => {
        toast.style.transform = 'translateY(0)';
        toast.style.opacity = '1';
    }, 100);
    
    // Animate out
    setTimeout(() => {
        toast.style.transform = 'translateY(100px)';
        toast.style.opacity = '0';
        setTimeout(() => toast.remove(), 300);
    }, 3000);
}

// --- Carousel Implementation ---
function initCarousels() {
    const carousels = document.querySelectorAll('.carousel-wrapper');
    
    carousels.forEach(wrapper => {
        const container = wrapper.querySelector('.carousel-container');
        const btnPrev = wrapper.querySelector('.btn-prev');
        const btnNext = wrapper.querySelector('.btn-next');
        
        if(container && btnPrev && btnNext) {
            btnPrev.addEventListener('click', () => {
                const cardWidth = container.querySelector('.product-card').offsetWidth;
                container.scrollBy({ left: -(cardWidth + 32), behavior: 'smooth' }); // 32 is gap
            });
            
            btnNext.addEventListener('click', () => {
                const cardWidth = container.querySelector('.product-card').offsetWidth;
                container.scrollBy({ left: (cardWidth + 32), behavior: 'smooth' });
            });
        }
    });
}
