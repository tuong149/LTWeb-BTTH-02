<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/admin/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp" />

<div class="container-fluid bg-white p-4 rounded shadow-sm" style="max-width: 800px; margin: 0 auto;">
    <h3 class="mb-4 fw-bold" style="color: #0a192f;">Thêm Danh Mục Mới</h3>
    <form:form action="/admin/category/add" method="post" modelAttribute="category" enctype="multipart/form-data">
        <div class="mb-4">
            <label class="form-label fw-semibold">Tên danh mục</label>
            <form:input path="name" cssClass="form-control" placeholder="Nhập tên danh mục..." />
            <form:errors path="name" cssClass="text-danger small mt-1 d-block" />
        </div>
        <div class="mb-4">
            <label class="form-label fw-semibold">Ảnh đại diện</label>
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
            <button type="submit" class="btn btn-primary px-4">Lưu danh mục</button>
            <a href="/admin/category/list" class="btn btn-light px-4">Hủy</a>
        </div>
    </form:form>
</div>

<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />