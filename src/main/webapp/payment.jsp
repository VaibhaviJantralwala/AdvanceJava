<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment - FoodMart</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #FDF6EE; min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .card { background: white; border-radius: 20px; padding: 40px; width: 380px; box-shadow: 0 8px 32px rgba(0,0,0,0.1); text-align: center; }
        .spinner { width: 56px; height: 56px; border: 4px solid #F5F0EB; border-top: 4px solid #C96A2B; border-radius: 50%; animation: spin 1s linear infinite; margin: 0 auto 20px; }
        @keyframes spin { to { transform: rotate(360deg); } }
        .title { font-size: 18px; font-weight: 600; color: #2C1810; margin-bottom: 8px; }
        .sub { font-size: 13px; color: #999; }
        .amount { font-size: 28px; font-weight: 700; color: #C96A2B; margin: 20px 0; }
        .tick { font-size: 56px; display: none; margin-bottom: 16px; }
    </style>
</head>
<body>
<div class="card">
    <div class="spinner" id="spinner"></div>
    <div class="tick" id="tick">✅</div>
    <div class="title" id="title">Processing Payment...</div>
    <div class="amount">₹${param.amount}</div>
    <div class="sub" id="sub">Please wait, do not close this window.</div>
</div>
<script>
    setTimeout(() => {
        document.getElementById('spinner').style.display = 'none';
        document.getElementById('tick').style.display = 'block';
        document.getElementById('title').textContent = 'Payment Successful!';
        document.getElementById('sub').textContent = 'Redirecting you back...';
    }, 2500);

    setTimeout(() => {
        window.location.href = 'checkoutServlet?action=success';
    }, 4000);
</script>
</body>
</html>