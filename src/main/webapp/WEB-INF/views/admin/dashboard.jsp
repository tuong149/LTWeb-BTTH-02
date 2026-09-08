<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/admin/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp" />

<div class="container-fluid">
    <h2 class="mb-4 fw-bold" style="color: #0a192f;">Dashboard</h2>
    
    <div class="row">
        <!-- Danh mục Shape -->
        <div class="col-md-6 mb-4">
            <div class="card bg-primary text-white h-100 shadow-sm rounded-4 border-0">
                <div class="card-body py-5 text-center">
                    <h5 class="card-title fs-4 fw-light mb-3">Tổng Số Danh Mục</h5>
                    <h1 class="display-3 fw-bold mb-0">${categoryCount}</h1>
                </div>
                <div class="card-footer bg-transparent border-0 text-center pb-4">
                    <a href="/admin/category/list" class="text-white text-decoration-none fw-semibold">Xem chi tiết <i class="bi bi-arrow-right-circle ms-1"></i></a>
                </div>
            </div>
        </div>

        <!-- Người dùng Shape -->
        <div class="col-md-6 mb-4">
            <div class="card text-white h-100 shadow-sm rounded-4 border-0" style="background-color: #20c997;">
                <div class="card-body py-5 text-center">
                    <h5 class="card-title fs-4 fw-light mb-3">Tổng Số Người Dùng</h5>
                    <h1 class="display-3 fw-bold mb-0">${userCount}</h1>
                </div>
                <div class="card-footer bg-transparent border-0 text-center pb-4">
                    <a href="/admin/user/list" class="text-white text-decoration-none fw-semibold">Xem chi tiết <i class="bi bi-arrow-right-circle ms-1"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />