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
        System.out.println("TeacherController(teacher/get-student-activities)");
        List<StudentActivityDto> activitityList = studentService.getStudentsActivitiesForTeacher();
        System.out.println("TeacherController(teacher/get-student-activities): return activitityList=" + activitityList);
        return activitityList;
    }
    @PostMapping("teacher/get-student-units")// by teacher
    public List<StudentUnitDto> getStudents(ParamIdDto studentActivityId) {
        System.out.println("TeacherController(teacher/get-students-units), studentActivityId="+studentActivityId);
        List<StudentUnitDto> studentUnitDtoList = studentService.getStudentsForTeacher(studentActivityId.getId());
        System.out.println("TeacherController(teacher/get-students-units): return studentUnitDtoList=" + studentUnitDtoList);
        return studentUnitDtoList;
    }
}
