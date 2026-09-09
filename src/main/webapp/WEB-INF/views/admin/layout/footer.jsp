<%@ page contentType="text/html;charset=UTF-8" language="java" %>
</div> <!-- End main-content -->
</div> <!-- End d-flex wrapper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const path = window.location.pathname;
        const navLinks = document.querySelectorAll('#sidebar .nav-link');
        navLinks.forEach(link => {
            link.classList.remove('active');
            const href = link.getAttribute('href');
            if (href === '/admin' && (path === '/admin' || path === '/admin/')) {
                link.classList.add('active');
            } else if (href !== '/admin' && path.includes(href.split('/list')[0])) {
                link.classList.add('active');
            }
        });
    });
</script>
</body>
</html>