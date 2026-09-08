<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/admin/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp" />

<div class="container-fluid bg-white p-4 rounded shadow-sm" style="max-width: 800px; margin: 0 auto;">
    <h3 class="mb-4 fw-bold" style="color: #0a192f;">Thêm Người Dùng Mới</h3>
    <form:form action="/admin/user/add" method="post" modelAttribute="user" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label fw-semibold">Họ và Tên</label>
                <form:input path="fullname" cssClass="form-control" />
                <form:errors path="fullname" cssClass="text-danger small mt-1 d-block" />
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label fw-semibold">Email</label>
                <form:input path="email" cssClass="form-control" />
                <form:errors path="email" cssClass="text-danger small mt-1 d-block" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label fw-semibold">Số điện thoại</label>
                <form:input path="phone" cssClass="form-control" />
                <form:errors path="phone" cssClass="text-danger small mt-1 d-block" />
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label fw-semibold">Mật khẩu</label>
                <form:password path="password" cssClass="form-control" />
                <form:errors path="password" cssClass="text-danger small mt-1 d-block" />
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Ảnh đại diện</label>
            <input type="file" name="file" class="form-control" accept="image/*" />
        </div>
        <div class="row">
            <div class="col-md-6 mb-4">
                <label class="form-label fw-semibold">Vai trò (Role)</label>
                <form:select path="role" cssClass="form-select">
                    <form:option value="2" label="User" />
                    <form:option value="1" label="Admin" />
                </form:select>
            </div>
        </div>
        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary px-4">Lưu</button>
            <a href="/admin/user/list" class="btn btn-light px-4">Hủy</a>
        </div>
    </form:form>
</div>

<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />