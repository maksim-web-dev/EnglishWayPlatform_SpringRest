package platform.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import platform.dtos.CourseDto;
import platform.services.CourseService;


@RestController
@RequiredArgsConstructor
public class AdminUnitController {
    private final CourseService courseService;
    //private final LessonService lessonService;

    @PostMapping("admin/get-units")
    public CourseDto getUnits(@RequestBody CourseDto courseDto) {
        return courseService.getCourseByIdAndUsername(courseDto.getId(), null);
    }

    @PostMapping("admin/update-units")
    public CourseDto updateUnits(@RequestBody CourseDto courseDto) {
        return courseService.updateCourse(courseDto);
    }
}
