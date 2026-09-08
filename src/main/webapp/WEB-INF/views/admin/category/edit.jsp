<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp" />

<div class="container-fluid bg-white p-4 rounded shadow-sm" style="max-width: 800px; margin: 0 auto;">
    <h3 class="mb-4 fw-bold" style="color: #0a192f;">Sửa Danh Mục</h3>
    <form:form action="/admin/categories/edit/${category.id}" method="post" modelAttribute="category" enctype="multipart/form-data">
        <form:hidden path="id" />
        <div class="mb-4">
            <label class="form-label fw-semibold">Tên danh mục</label>
            <form:input path="name" cssClass="form-control" />
            <form:errors path="name" cssClass="text-danger small mt-1 d-block" />
        </div>
        <div class="mb-4">
            <label class="form-label fw-semibold d-block">Ảnh hiện tại</label>
            <c:choose>
                <c:when test="${not empty category.images}">
                    <img src="/uploads/${category.images}" class="rounded border" width="120" style="object-fit: cover;" />
                </c:when>
                <c:otherwise>
                    <span class="text-muted fst-italic">Chưa có ảnh</span>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="mb-4">
            <label class="form-label fw-semibold">Thay đổi ảnh (Để trống nếu giữ nguyên)</label>
            <input type="file" name="file" class="form-control" accept="image/*" />
        </div>
        <div class="mb-4">
            <label class="form-label fw-semibold">Trạng thái</label>
            <form:select path="status" cssClass="form-select">
                <form:option value="1" label="Hoạt động" />
                <form:option value="0" label="Khóa" />
            </form:select>
        </div>
        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary px-4">Cập nhật</button>
            <a href="/admin/categories" class="btn btn-light px-4">Hủy</a>
        </div>
    </form:form>
</div>

<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />
