<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Checkout | Sweet Pan</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <style>
        .page-header {
            background: hsl(var(--clr-surface-dim));
            padding: 8rem 0 3rem;
            text-align: center;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            margin-bottom: 3rem;
        }

        .checkout-layout {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 3rem;
            align-items: start;
            margin-bottom: 5rem;
        }

        .checkout-form-container {
            background: hsl(var(--clr-surface));
            border-radius: 16px;
            box-shadow: var(--shadow-sm);
            padding: 3rem;
        }

        .section-title {
            font-family: var(--font-serif);
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            color: hsl(var(--clr-primary));
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.2rem;
            margin-bottom: 2rem;
        }

        .form-group.full {
            grid-column: 1 / -1;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: hsl(var(--clr-text-dark) / 0.8);
        }

        .form-input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            font-family: var(--font-sans);
            transition: all var(--transition-fast);
        }

        .form-input:focus {
            outline: none;
            border-color: hsl(var(--clr-primary));
            box-shadow: 0 0 0 3px hsl(var(--clr-primary) / 0.1);
        }

        /* Order Summary Sidebar */
        .order-summary {
            background: hsl(var(--clr-surface));
            border-radius: 16px;
            box-shadow: var(--shadow-md);
            padding: 2rem;
            position: sticky;
            top: 100px;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .summary-item-img {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            object-fit: cover;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            color: hsl(var(--clr-text-dark) / 0.8);
            font-size: 0.95rem;
        }

        .summary-total {
            font-size: 1.5rem;
            font-weight: 700;
            color: hsl(var(--clr-primary));
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
        }

        .btn-place-order {
            width: 100%;
            padding: 1.2rem;
            font-size: 1.1rem;
            margin-top: 2rem;
            justify-content: center;
        }

        /* Payment Methods */
        .payment-methods {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .payment-card {
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 1rem;
            text-align: center;
            cursor: pointer;
            transition: all var(--transition-fast);
        }

        .payment-card.selected {
            border-color: hsl(var(--clr-primary));
            background: hsl(var(--clr-primary) / 0.05);
        }

        @media (max-width: 992px) {
            .checkout-layout {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar">
        <div class="container nav-container">
            <a href="/home" class="nav-logo">Sweet Pan.</a>
            <div class="nav-actions">
                <a href="/cart" class="btn btn-outline" style="padding: 0.5rem 1rem;">Back to Cart</a>
            </div>
        </div>
    </nav>

    <header class="page-header">
        <div class="container">
            <h1 style="font-size: 2.5rem; margin-bottom: 0.5rem; font-family: var(--font-serif); color: hsl(var(--clr-primary));">
                Secure Checkout</h1>
            <p style="color: hsl(var(--clr-text-dark) / 0.7);">Almost there! Please enter your details below.</p>
        </div>
    </header>

    <main class="container">
        <form action="/order/place" method="POST" id="checkout-form">
            <div class="checkout-layout">
                
                <!-- Left: Forms -->
                <div class="checkout-form-container">
                    
                    <h3 class="section-title"><i class="fa-solid fa-truck"></i> Shipping Information</h3>
                    <div class="form-grid">
                        <div class="form-group">
                            <label class="form-label">First Name</label>
                            <input type="text" name="firstName" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Last Name</label>
                            <input type="text" name="lastName" class="form-input" required>
                        </div>
                        <div class="form-group full">
                            <label class="form-label">Address Line 1</label>
                            <input type="text" name="address1" class="form-input" required>
                        </div>
                        <div class="form-group full">
                            <label class="form-label">Address Line 2 (Optional)</label>
                            <input type="text" name="address2" class="form-input">
                        </div>
                        <div class="form-group">
                            <label class="form-label">City</label>
                            <input type="text" name="city" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Phone Number</label>
                            <input type="tel" name="phone" class="form-input" required>
                        </div>
                    </div>

                    <h3 class="section-title" style="margin-top: 3rem;"><i class="fa-solid fa-credit-card"></i> Payment Method</h3>
                    <div class="payment-methods">
                        <div class="payment-card selected">
                            <i class="fa-solid fa-money-bill" style="font-size: 2rem; color: #10b981; margin-bottom: 0.5rem;"></i>
                            <div style="font-weight: 500;">Cash on Delivery</div>
                        </div>
                        <div class="payment-card" style="opacity: 0.5;">
                            <i class="fa-brands fa-cc-visa" style="font-size: 2rem; color: #1a1f71; margin-bottom: 0.5rem;"></i>
                            <div style="font-weight: 500;">Credit Card</div>
                            <small>(Coming Soon)</small>
                        </div>
                        <div class="payment-card" style="opacity: 0.5;">
                            <i class="fa-brands fa-paypal" style="font-size: 2rem; color: #00457c; margin-bottom: 0.5rem;"></i>
                            <div style="font-weight: 500;">PayPal</div>
                            <small>(Coming Soon)</small>
                        </div>
                    </div>
                    
                    <input type="hidden" name="paymentMethod" value="cod">

                </div>

                <!-- Right: Summary -->
                <div class="order-summary">
                    <h3 style="font-family: var(--font-serif); font-size: 1.5rem; margin-bottom: 1.5rem;">Your Order</h3>
                    
                    <!-- Dynamic Items will be rendered here by server/JS, static fallback for UI -->
                    <div class="summary-item">
                        <div style="display: flex; gap: 1rem; align-items: center;">
                            <div style="width: 50px; height: 50px; background: #eee; border-radius: 8px;"></div>
                            <div>
                                <div style="font-weight: 600;">Classic Chocolate</div>
                                <div style="font-size: 0.85rem; color: #666;">Qty: 1</div>
                            </div>
                        </div>
                        <div style="font-weight: 600;">LKR 2500.00</div>
                    </div>

                    <div style="margin-top: 2rem;">
                        <div class="summary-row">
                            <span>Subtotal</span>
                            <span>LKR 2500.00</span>
                        </div>
                        <div class="summary-row">
                            <span>Shipping</span>
                            <span style="color: #10b981;">Free</span>
                        </div>
                        <div class="summary-total">
                            <span>Total</span>
                            <span>LKR 2500.00</span>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary btn-place-order">
                        <i class="fa-solid fa-lock" style="margin-right: 8px;"></i> Place Order
                    </button>
                    
                    <p style="text-align: center; font-size: 0.85rem; color: #888; margin-top: 1rem;">
                        Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy.
                    </p>
                </div>

            </div>
        </form>
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

</body>
</html>
