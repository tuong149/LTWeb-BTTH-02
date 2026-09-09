<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp" />

<div class="container-fluid bg-white p-4 rounded shadow-sm">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold m-0" style="color: #0a192f;">Quản lý danh mục</h2>
                <form action="/admin/category/list" method="get" class="d-flex gap-2">
            <input type="text" name="keyword" value="$"{keyword}"" class="form-control" placeholder="Tìm kiếm..." style="width: 250px;">
            <button type="submit" class="btn btn-outline-primary">Tìm</button>
        </form>
        <a href="/admin/category/add" class="btn btn-primary px-4">+ Thêm Mới</a>
    </div>
    
    <table class="table table-hover table-bordered align-middle">
        <thead class="table-light">
        <tr>
            <th>ID</th>
            <th>Tên danh mục</th>
            <th class="text-center">Ảnh</th>
            <th class="text-center">Trạng thái</th>
            <th class="text-center">Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cat" items="${categories}">
            <tr>
                <td>${cat.id}</td>
                <td class="fw-semibold">${cat.name}</td>
                <td class="text-center">
                    <c:if test="${not empty cat.images}">
                        <img src="/uploads/${cat.images}" class="rounded" width="60" height="60" style="object-fit: cover;" alt="img"/>
                    </c:if>
                </td>
                <td class="text-center">
                    <span class="badge ${cat.status == 1 ? 'bg-success' : 'bg-danger'} px-3 py-2">
                        ${cat.status == 1 ? 'Hoạt động' : 'Khóa'}
                    </span>
                </td>
                <td class="text-center">
                    <a href="/admin/category/edit/${cat.id}" class="btn btn-sm btn-outline-primary me-2">Sửa</a>
                    <a href="/admin/category/delete/${cat.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />