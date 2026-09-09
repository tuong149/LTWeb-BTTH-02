<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="sidebar">
    <div class="logo">
        <img src="/images/UTEMall_border.png" alt="UTEMall Logo" style="max-width: 150px; margin-bottom: 15px;">
        <h5 style="color: #ffffff; font-weight: 700;">ADMIN DASHBOARD</h5>
    </div>
    <ul class="nav flex-column mt-4">
        <li class="nav-item">
            <a class="nav-link ${pageContext.request.requestURI.contains('dashboard.jsp') ? 'active' : ''}" href="/admin">Dashboard</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${pageContext.request.requestURI.contains('/category/') ? 'active' : ''}" href="/admin/category/list">Quản lý danh mục</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${pageContext.request.requestURI.contains('/user/') ? 'active' : ''}" href="/admin/user/list">Quản lý người dùng</a>
        </li>
    </ul>
</div>
<div id="main-content" class="flex-grow-1">