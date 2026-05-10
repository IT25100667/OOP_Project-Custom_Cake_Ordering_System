<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product | Admin Dashboard</title>
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

        .form-container {
            background: hsl(var(--clr-surface));
            border-radius: 16px;
            padding: 3rem;
            box-shadow: var(--shadow-sm);
            max-width: 800px;
            margin: 0 auto 5rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: hsl(var(--clr-text-dark) / 0.8);
        }

        .form-input, .form-select, .form-textarea {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            font-family: var(--font-sans);
            font-size: 1rem;
            transition: all var(--transition-fast);
        }

        .form-input:focus, .form-select:focus, .form-textarea:focus {
            outline: none;
            border-color: hsl(var(--clr-primary));
            box-shadow: 0 0 0 3px hsl(var(--clr-primary) / 0.1);
        }

        .form-textarea {
            resize: vertical;
            min-height: 120px;
        }

        .image-preview-area {
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            padding: 1rem;
            display: flex;
            align-items: center;
            gap: 2rem;
            background: hsl(var(--clr-surface-dim));
        }

        .current-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
            background: #fff;
        }

        .btn-submit {
            width: 100%;
            padding: 1rem;
            font-size: 1.1rem;
            margin-top: 1rem;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            .image-preview-area {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar">
        <div class="container nav-container">
            <a href="/home" class="nav-logo">Sweet Pan. <span style="font-size:0.9rem; color:#888;">Admin</span></a>
            <ul class="nav-links">
                <li><a href="/admin/dashboard" class="nav-link">Dashboard</a></li>
                <li><a href="/admin/products" class="nav-link active">Products</a></li>
                <li><a href="/admin/orders" class="nav-link">Orders</a></li>
            </ul>
            <div class="nav-actions">
                <a href="/user/profile" class="icon-btn" title="Admin Profile">
                    <i class="fa-solid fa-user"></i>
                </a>
            </div>
        </div>
    </nav>

    <header class="page-header">
        <div class="container">
            <h1>Edit Product</h1>
            <p style="font-size: 1.1rem; opacity: 0.9; margin-top: 0.5rem;">Update details for \${product.name}</p>
        </div>
    </header>

    <main class="container">
        <div class="form-container">
            <form action="/admin/product/edit" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="productId" value="\${product.id}">
                
                <div class="form-group full-width" style="margin-bottom: 2rem;">
                    <label class="form-label">Product Image</label>
                    <div class="image-preview-area">
                        <img src="\${product.imageUrl}" alt="Current Image" class="current-image" onerror="this.src='https://placehold.co/100x100?text=No+Image'">
                        <div>
                            <p style="font-weight: 500; margin-bottom: 0.5rem;">Update Image (Optional)</p>
                            <input type="file" name="image" id="image" accept="image/*" class="form-input" style="padding: 0.5rem; background: #fff;">
                        </div>
                    </div>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label class="form-label" for="name">Product Name</label>
                        <input type="text" id="name" name="name" class="form-input" value="\${product.name}" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="category">Category</label>
                        <select id="category" name="category" class="form-select" required>
                            <option value="birthday" \${product.category == 'birthday' ? 'selected' : ''}>Birthday Cakes</option>
                            <option value="wedding" \${product.category == 'wedding' ? 'selected' : ''}>Wedding Cakes</option>
                            <option value="anniversary" \${product.category == 'anniversary' ? 'selected' : ''}>Anniversary</option>
                            <option value="sweets" \${product.category == 'sweets' ? 'selected' : ''}>Sweets & Treats</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="price">Price (LKR)</label>
                        <input type="number" id="price" name="price" class="form-input" value="\${product.price}" min="0" step="0.01" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="stock">Stock Quantity</label>
                        <input type="number" id="stock" name="stock" class="form-input" value="\${product.stock}" min="0" required>
                    </div>

                    <div class="form-group full-width">
                        <label class="form-label" for="description">Product Description</label>
                        <textarea id="description" name="description" class="form-textarea" required>\${product.description}</textarea>
                    </div>
                </div>

                <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                    <button type="button" class="btn btn-outline" style="width: 30%; justify-content: center;" onclick="window.history.back()">Cancel</button>
                    <button type="submit" class="btn btn-primary btn-submit" style="width: 70%; margin-top: 0; justify-content: center;">
                        <i class="fa-solid fa-save" style="margin-right: 8px;"></i> Save Changes
                    </button>
                </div>
            </form>
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

</body>
</html>
