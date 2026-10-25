package platform.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import platform.dtos.ActivitiesListDto;
import platform.dtos.ParamIdDto;
import platform.dtos.StudentActivityDto;
import platform.dtos.StudentUnitDto;
import platform.services.StudentService;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class TeacherController {
    private final StudentService studentService;

    @PostMapping("teacher/get-student-activities")// by teacher
    public List<StudentActivityDto> getStudentsActivities() {
        return studentService.getStudentsActivitiesForTeacher();
    }
    @PostMapping("teacher/get-student-units")// by teacher
    public List<StudentUnitDto> getStudents(ParamIdDto studentActivityId) {
        return studentService.getStudentsForTeacher(studentActivityId.getId());
    }
}
