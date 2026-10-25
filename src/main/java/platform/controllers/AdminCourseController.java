package platform.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import platform.dtos.CourseDto;
import platform.services.CourseService;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class AdminCourseController {
    private final CourseService courseService;

    @PostMapping("admin/get-courses")
    public List<CourseDto> getCourses() {
        return courseService.getCoursesDto();
    }
    @PostMapping("admin/create-course")
    public List<CourseDto> createCourse(@RequestBody CourseDto courseDto) {
        return courseService.createCourse(courseDto);
    }

    @PostMapping("admin/update-course")
    public CourseDto saveCourse(@RequestBody CourseDto courseDto) {
        return courseService.updateCourse(courseDto);
    }
    @PostMapping("admin/delete-course")
    public ResponseEntity<?> deleteCourse(@RequestBody CourseDto courseDto) {
        return courseService.deleteCourse(courseDto.getId());
    }
}
