<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp" />

<div class="container-fluid bg-white p-4 rounded shadow-sm">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold m-0" style="color: #0a192f;">Quản Lý Người Dùng</h2>
                <form action="/admin/user/list" method="get" class="d-flex gap-2">
            <input type="text" name="keyword" value="$"{keyword}"" class="form-control" placeholder="Tìm kiếm..." style="width: 250px;">
            <button type="submit" class="btn btn-outline-primary">Tìm</button>
        </form>
        <a href="/admin/user/add" class="btn btn-primary px-4">+ Thêm User</a>
    </div>
    
    <table class="table table-hover table-bordered align-middle">
        <thead class="table-light">
        <tr>
            <th>ID</th>
            <th>Avatar</th>
            <th>Thông tin cơ bản</th>
            <th class="text-center">Quyền hạn</th>
            <th class="text-center">Trạng thái</th>
            <th class="text-center">Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="u" items="${users}">
            <tr>
                <td>${u.id}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty u.images}">
                            <img src="/uploads/${u.images}" class="rounded-circle shadow-sm" width="50" height="50" style="object-fit: cover;" alt="avatar"/>
                        </c:when>
                        <c:otherwise>
                            <div class="rounded-circle bg-secondary text-white d-flex align-items-center justify-content-center" style="width:50px; height:50px;">
                                ${u.fullname.substring(0,1).toUpperCase()}
                            </div>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <div class="fw-semibold">${u.fullname}</div>
                    <div class="text-muted small">${u.email}</div>
                    <div class="text-muted small">${u.phone}</div>
                </td>
                <td class="text-center">
                    <span class="badge ${u.role == 1 ? 'bg-danger' : 'bg-info'} px-3 py-2">
                        ${u.role == 1 ? 'Administrator' : 'User'}
                    </span>
                </td>
                <td class="text-center">
                    <span class="badge ${u.status == 1 ? 'bg-success' : 'bg-secondary'} px-3 py-2">
                        ${u.status == 1 ? 'Hoạt động' : 'Khóa'}
                    </span>
                </td>
                <td class="text-center">
                    <a href="/admin/user/edit/${u.id}" class="btn btn-sm btn-outline-primary me-2">Sửa</a>
                    <a href="/admin/user/delete/${u.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('Bạn có chắc muốn xóa người dùng này?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />