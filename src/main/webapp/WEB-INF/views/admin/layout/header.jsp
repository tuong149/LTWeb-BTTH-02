<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        #sidebar {
            width: 280px;
            background-color: #0a192f;
            min-height: 100vh;
            color: #ffffff;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        #sidebar .logo {
            text-align: center;
            padding: 30px 20px;
            border-bottom: 1px solid #1a2a42;
        }
        #sidebar .logo img {
            max-width: 150px;
            margin-bottom: 15px;
        }
        #sidebar .logo h5 {
            font-weight: 700;
            letter-spacing: 1.5px;
            margin: 0;
            color: #ffffff;
            font-size: 1.1rem;
        }
        #sidebar .nav-link {
            color: #a0aec0;
            padding: 16px 25px;
            transition: all 0.3s;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
        }
        #sidebar .nav-link:hover, #sidebar .nav-link.active {
            color: #ffffff;
            background-color: #1a2a42;
            border-left: 5px solid #64ffda;
        }
        #main-content {
            margin-left: 280px;
            padding: 40px;
            min-height: 100vh;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>
<div class="d-flex w-100">
