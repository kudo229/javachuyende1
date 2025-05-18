<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<title>Quản lý Lịch khám</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background-color: #f8f9fa;
}
h2 {
	margin-top: 20px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<div class="container-fluid mt-4 px-5">
		<h2>Quản lý Lịch khám</h2>

		<!-- Nút thêm lịch khám mới -->
		<button class="btn btn-primary mb-4" id="btnAddAppointment"
			data-bs-toggle="modal" data-bs-target="#appointmentModal">
			Thêm lịch khám mới</button>

		<!-- Bảng danh sách lịch khám -->
		<div class="table-responsive">
			<table class="table table-bordered table-hover align-middle"
				id="appointmentTable">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Bệnh nhân</th>
						<th>Tuổi</th>
						<th>Ngày sinh</th>
						<th>Thông tin khám</th>
						<th>Chi tiết bệnh tình</th>
						<th>Ngày giờ khám</th>
						<th>Địa chỉ</th>
						<th>Số điện thoại</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${appointments}">
						<tr data-id="${item.id}" data-patientname="${item.patientName}"
							data-age="${item.age}" data-dob="${item.dob}"
							data-appointmenttype="${item.appointmentType}"
							data-symptomdetail="${item.symptomDetail}"
							data-appointmentdate="${item.appointmentDate?.toString().replace(' ', 'T')}"
							data-address="${item.address}" data-phone="${item.phone}">
							<td>${item.id}</td>
							<td>${item.patientName}</td>
							<td>${item.age}</td>
							<td>${item.dob}</td>
							<td>${item.appointmentType}</td>
							<td>${item.symptomDetail}</td>
							<td>${item.appointmentDate}</td>
							<td>${item.address}</td>
							<td>${item.phone}</td>
							<td>
								<button class="btn btn-sm btn-warning btn-edit"
									data-bs-toggle="modal" data-bs-target="#appointmentModal">Sửa</button>
								<a
								href="${pageContext.request.contextPath}/admin/clinicschedule/delete/${item.id}"
								class="btn btn-sm btn-danger"
								onclick="return confirm('Bạn có chắc muốn xóa?')">Xoá</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Modal Thêm/Sửa lịch khám -->
	<div class="modal fade" id="appointmentModal" tabindex="-1"
		aria-labelledby="appointmentModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<form class="needs-validation" novalidate method="post"
				action="${pageContext.request.contextPath}/admin/clinicschedule/save">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="appointmentModalLabel">Thêm / Sửa
							lịch khám</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Đóng"></button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="appointmentId" name="id" />

						<div class="row mb-3">
							<div class="col-md-6">
								<label for="patientName" class="form-label">Họ và Tên <span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="patientName" name="patientName"
									placeholder="Nhập họ và tên bệnh nhân" required>
								<div class="invalid-feedback">Vui lòng nhập họ và tên.</div>
							</div>
							<div class="col-md-3">
								<label for="age" class="form-label">Tuổi <span
									class="text-danger">*</span></label> <input type="number"
									class="form-control" id="age" name="age" min="0" max="150"
									required>
								<div class="invalid-feedback">Vui lòng nhập tuổi hợp lệ.</div>
							</div>
							<div class="col-md-3">
								<label for="dob" class="form-label">Ngày sinh <span
									class="text-danger">*</span></label> <input type="date"
									class="form-control" id="dob" name="dob" required>
								<div class="invalid-feedback">Vui lòng chọn ngày sinh.</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="appointmentType" class="form-label">Thông tin
								khám <span class="text-danger">*</span>
							</label> <select class="form-select" id="appointmentType"
								name="appointmentType" required>
								<option value="" selected disabled>Chọn loại khám</option>
								<option value="Khám tổng quát">Khám tổng quát</option>
								<option value="Khám chuyên khoa">Khám chuyên khoa</option>
								<option value="Khám tai mũi họng">Khám tai mũi họng</option>
								<option value="Khám sản phụ khoa">Khám sản phụ khoa</option>
								<option value="Khám nhi khoa">Khám nhi khoa</option>
							</select>
							<div class="invalid-feedback">Vui lòng chọn loại khám.</div>
						</div>

						<div class="mb-3">
							<label for="symptomDetail" class="form-label">Chi tiết
								bệnh tình <span class="text-danger">*</span>
							</label>
							<textarea class="form-control" id="symptomDetail"
								name="symptomDetail" rows="3"
								placeholder="Mô tả triệu chứng hoặc tình trạng bệnh" required></textarea>
							<div class="invalid-feedback">Vui lòng nhập chi tiết bệnh
								tình.</div>
						</div>

						<div class="mb-3">
							<label for="appointmentDate" class="form-label">Thời gian
								khám <span class="text-danger">*</span>
							</label> <input type="datetime-local" class="form-control"
								id="appointmentDate" name="appointmentDate" required>
							<div class="invalid-feedback">Vui lòng chọn thời gian khám.</div>
						</div>

						<div class="mb-3">
							<label for="address" class="form-label">Địa chỉ <span
								class="text-danger">*</span></label> <input type="text"
								class="form-control" id="address" name="address"
								placeholder="Nhập địa chỉ liên hệ" required>
							<div class="invalid-feedback">Vui lòng nhập địa chỉ.</div>
						</div>

						<div class="mb-3">
							<label for="phone" class="form-label">Số điện thoại <span
								class="text-danger">*</span></label> <input type="tel"
								class="form-control" id="phone" name="phone"
								pattern="[0-9]{9,15}" placeholder="Nhập số điện thoại liên hệ"
								required>
							<div class="invalid-feedback">Vui lòng nhập số điện thoại
								hợp lệ (9-15 số).</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Hủy</button>
						<button type="submit" class="btn btn-primary">Lưu lịch
							khám</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
(() => {
  'use strict';
  const form = document.querySelector('.needs-validation');

  form.addEventListener('submit', event => {
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
    }
    form.classList.add('was-validated');
  }, false);

  const editButtons = document.querySelectorAll('.btn-edit');
  const appointmentId = document.getElementById('appointmentId');
  const patientName = document.getElementById('patientName');
  const age = document.getElementById('age');
  const dob = document.getElementById('dob');
  const appointmentType = document.getElementById('appointmentType');
  const symptomDetail = document.getElementById('symptomDetail');
  const appointmentDate = document.getElementById('appointmentDate');
  const address = document.getElementById('address');
  const phone = document.getElementById('phone');

  editButtons.forEach(button => {
    button.addEventListener('click', () => {
      const tr = button.closest('tr');
      appointmentId.value = tr.dataset.id || '';
      patientName.value = tr.dataset.patientname || '';
      age.value = tr.dataset.age || '';
      dob.value = tr.dataset.dob || '';
      appointmentType.value = tr.dataset.appointmenttype || '';
      symptomDetail.value = tr.dataset.symptomdetail || '';
      appointmentDate.value = tr.dataset.appointmentdate || '';
      address.value = tr.dataset.address || '';
      phone.value = tr.dataset.phone || '';

      patientName.focus();
      form.classList.remove('was-validated');
    });
  });

  document.getElementById('btnAddAppointment').addEventListener('click', () => {
    appointmentId.value = '';
    patientName.value = '';
    age.value = '';
    dob.value = '';
    appointmentType.value = '';
    symptomDetail.value = '';
    appointmentDate.value = '';
    address.value = '';
    phone.value = '';

    form.classList.remove('was-validated');
  });
})();
</script>

</body>
</html>
