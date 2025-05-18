<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <style>
        .avatar-sm {
            width: 40px;
            height: 40px;
            object-fit: cover;
            border-radius: 50%;
        }
        .status-badge {
            font-size: 0.8rem;
            padding: 0.35em 0.65em;
        }
    </style>
</head>
<body>
    <div class="container-fluid px-4 mt-4">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="mb-0"><i class="bi bi-people-fill me-2"></i>Quản lý Người dùng</h1>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">
                <i class="bi bi-plus-lg"></i> Thêm người dùng
            </button>
        </div>

        <!-- Stats Cards -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card bg-primary text-white">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div>
                                <h6 class="card-title">Tổng người dùng</h6>
                                <h2 class="mb-0">152</h2>
                            </div>
                            <i class="bi bi-people fs-1 opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-success text-white">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div>
                                <h6 class="card-title">Đang hoạt động</h6>
                                <h2 class="mb-0">138</h2>
                            </div>
                            <i class="bi bi-check-circle fs-1 opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-warning text-white">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div>
                                <h6 class="card-title">Bác sĩ</h6>
                                <h2 class="mb-0">32</h2>
                            </div>
                            <i class="bi bi-heart-pulse fs-1 opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-danger text-white">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div>
                                <h6 class="card-title">Đã khóa</h6>
                                <h2 class="mb-0">14</h2>
                            </div>
                            <i class="bi bi-lock fs-1 opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Toolbar -->
        <div class="card mb-4">
            <div class="card-body">
                <div class="d-flex justify-content-between">
                    <div class="d-flex">
                        <select class="form-select form-select-sm me-2" style="width: 120px;">
                            <option>Lọc theo vai trò</option>
                            <option>Admin</option>
                            <option>Bác sĩ</option>
                            <option>Nhân viên</option>
                        </select>
                        <select class="form-select form-select-sm me-2" style="width: 120px;">
                            <option>Lọc trạng thái</option>
                            <option>Hoạt động</option>
                            <option>Đã khóa</option>
                        </select>
                    </div>
                    <div>
                        <button class="btn btn-sm btn-outline-secondary me-2">
                            <i class="bi bi-download"></i> Xuất Excel
                        </button>
                        <button class="btn btn-sm btn-outline-secondary">
                            <i class="bi bi-upload"></i> Import
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Table -->
        <div class="card">
            <div class="card-body">
                <table id="usersTable" class="table table-striped table-hover" style="width:100%">
                    <thead>
                        <tr>
                            <th width="50px">STT</th>
                            <th width="70px">Ảnh</th>
                            <th>Họ tên</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Vai trò</th>
                            <th>Trạng thái</th>
                            <th>Ngày tạo</th>
                            <th width="120px">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample Data - Replace with JSTL loop in real app -->
                        <tr>
                            <td>1</td>
                            <td><img src="https://via.placeholder.com/40" class="avatar-sm" alt="User Avatar"></td>
                            <td>Nguyễn Văn A</td>
                            <td>nva@example.com</td>
                            <td>0987654321</td>
                            <td><span class="badge bg-primary">Admin</span></td>
                            <td><span class="badge bg-success status-badge">Hoạt động</span></td>
                            <td>15/07/2023</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil"></i></button>
                                <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><img src="https://via.placeholder.com/40" class="avatar-sm" alt="User Avatar"></td>
                            <td>Trần Thị B</td>
                            <td>ttb@example.com</td>
                            <td>0912345678</td>
                            <td><span class="badge bg-info">Bác sĩ</span></td>
                            <td><span class="badge bg-success status-badge">Hoạt động</span></td>
                            <td>20/08/2023</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil"></i></button>
                                <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><img src="https://via.placeholder.com/40" class="avatar-sm" alt="User Avatar"></td>
                            <td>Lê Văn C</td>
                            <td>lvc@example.com</td>
                            <td>0978123456</td>
                            <td><span class="badge bg-secondary">Nhân viên</span></td>
                            <td><span class="badge bg-danger status-badge">Đã khóa</span></td>
                            <td>05/09/2023</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil"></i></button>
                                <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm người dùng mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Họ và tên <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email <span class="text-danger">*</span></label>
                                <input type="email" class="form-control" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Số điện thoại</label>
                                <input type="tel" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Vai trò <span class="text-danger">*</span></label>
                                <select class="form-select" required>
                                    <option value="">Chọn vai trò</option>
                                    <option value="admin">Admin</option>
                                    <option value="doctor">Bác sĩ</option>
                                    <option value="staff">Nhân viên</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Mật khẩu <span class="text-danger">*</span></label>
                                <input type="password" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Xác nhận mật khẩu <span class="text-danger">*</span></label>
                                <input type="password" class="form-control" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ảnh đại diện</label>
                            <input type="file" class="form-control">
                        </div>
                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" id="activeAccount" checked>
                            <label class="form-check-label" for="activeAccount">
                                Kích hoạt tài khoản
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary">Lưu thông tin</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#usersTable').DataTable({
                language: {
                    url: 'https://cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json'
                }
            });
        });
    </script>
</body>
</html>