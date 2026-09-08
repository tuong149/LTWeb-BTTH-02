<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp" />

<div class="container-fluid bg-white p-4 rounded shadow-sm" style="max-width: 800px; margin: 0 auto;">
    <h3 class="mb-4 fw-bold" style="color: #0a192f;">Cập Nhật Thông Tin Người Dùng</h3>
    <form:form action="/admin/user/edit" method="post" modelAttribute="user" enctype="multipart/form-data">
        <form:hidden path="id" />
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
                <label class="form-label fw-semibold">Mật khẩu (Nhập nếu muốn đổi)</label>
                <form:password path="password" cssClass="form-control" />
                <form:errors path="password" cssClass="text-danger small mt-1 d-block" />
            </div>
        </div>
        <div class="row align-items-center mb-3">
            <div class="col-md-3">
                <label class="form-label fw-semibold d-block">Ảnh hiện tại</label>
                <c:choose>
                    <c:when test="${not empty user.images}">
                        <img src="/uploads/${user.images}" class="rounded-circle shadow-sm" width="80" height="80" style="object-fit: cover;" />
                    </c:when>
                    <c:otherwise>
                        <span class="text-muted fst-italic">Chưa có</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-md-9">
                <label class="form-label fw-semibold">Thay đổi Avatar</label>
                <input type="file" name="file" class="form-control" accept="image/*" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-4">
                <label class="form-label fw-semibold">Vai trò (Role)</label>
                <form:select path="role" cssClass="form-select">
                    <form:option value="2" label="User" />
                    <form:option value="1" label="Admin" />
                </form:select>
            </div>
            <div class="col-md-6 mb-4">
                <label class="form-label fw-semibold">Trạng thái</label>
                <form:select path="status" cssClass="form-select">
                    <form:option value="1" label="Hoạt động" />
                    <form:option value="0" label="Khóa" />
                </form:select>
            </div>
        </div>
        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary px-4">Cập nhật</button>
            <a href="/admin/user/list" class="btn btn-light px-4">Hủy</a>
        </div>
    </form:form>
</div>

<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />