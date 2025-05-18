package demo.quanliyte.test.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import demo.quanliyte.test.entity.Appointment;
import demo.quanliyte.test.service.AppointmentService;

@Controller
@RequestMapping("/admin/clinicschedule")
public class AppointmentController {

    @Autowired
    private AppointmentService service;

    // Hiển thị danh sách
    @GetMapping("/list")
    public String listAppointments(Model model) {
        List<Appointment> appointments = service.findAll();
        model.addAttribute("appointments", appointments);
        return "admin/clinicschedule/quanlylichkham"; // Đường dẫn JSP
    }

    // Lưu lịch khám (thêm/sửa)
    @PostMapping("/save")
    public String saveAppointment(@ModelAttribute Appointment appointment) {
        service.save(appointment);
        return "redirect:/admin/clinicschedule/list";
    }

    // Xóa lịch khám
    @GetMapping("/delete/{id}")
    public String deleteAppointment(@PathVariable Long id) {
        service.deleteById(id);
        return "redirect:/admin/clinicschedule/list";
    }
}
