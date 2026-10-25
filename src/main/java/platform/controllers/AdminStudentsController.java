package platform.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import platform.dtos.*;
import platform.services.StudentService;

@RestController
@RequiredArgsConstructor
public class AdminStudentsController {
    private final StudentService studentService;

    @PostMapping("admin/get-students-activity") // by manager
    public ActivitiesListDto getStudentsActivity() {
        return studentService.getStudentsActivity();
    }

    @PostMapping("admin/create-student-activity")
    public StudentDto createStudentActivity(@RequestBody StudentActivityDto studentActivityDto) {
        return studentService.createStudentActivity(studentActivityDto);
    }
}
