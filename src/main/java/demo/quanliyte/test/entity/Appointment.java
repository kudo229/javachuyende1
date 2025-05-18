package demo.quanliyte.test.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "appointments")
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Tên bệnh nhân không được để trống")
    @Column(name = "patient_name", nullable = false)
    private String patientName;

    @NotNull(message = "Tuổi không được để trống")
    @Min(value = 0)
    @Max(value = 150)
    @Column(nullable = false)
    private Integer age;

    @NotNull(message = "Ngày sinh không được để trống")
    @Column(nullable = false)
    private LocalDate dob;

    @NotBlank(message = "Loại khám không được để trống")
    @Column(name = "appointment_type", nullable = false)
    private String appointmentType;

    @Column(name = "symptom_detail", columnDefinition = "TEXT")
    private String symptomDetail;

    @NotNull(message = "Ngày giờ khám không được để trống")
    @Column(name = "appointment_date", nullable = false)
    private LocalDateTime appointmentDate;

    @NotBlank(message = "Địa chỉ không được để trống")
    @Column(nullable = false)
    private String address;

    @NotBlank(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "\\d{9,15}", message = "Số điện thoại hợp lệ từ 9 đến 15 số")
    @Column(nullable = false)
    private String phone;

    @Column(nullable = false)
    private String status = "SCHEDULED"; // Mặc định "Đã đặt"

    // Getter & Setter

    // Constructor mặc định
    public Appointment() {}

    // Các getter/setter tự động hoặc generate bằng IDE

    // Ví dụ
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public Integer getAge() { return age; }
    public void setAge(Integer age) { this.age = age; }

    public LocalDate getDob() { return dob; }
    public void setDob(LocalDate dob) { this.dob = dob; }

    public String getAppointmentType() { return appointmentType; }
    public void setAppointmentType(String appointmentType) { this.appointmentType = appointmentType; }

    public String getSymptomDetail() { return symptomDetail; }
    public void setSymptomDetail(String symptomDetail) { this.symptomDetail = symptomDetail; }

    public LocalDateTime getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(LocalDateTime appointmentDate) { this.appointmentDate = appointmentDate; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
