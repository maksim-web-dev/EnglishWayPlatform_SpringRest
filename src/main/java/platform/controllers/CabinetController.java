package platform.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import platform.dtos.*;
import platform.services.CabinetService;
import platform.services.ContentService;
import platform.services.ResultService;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class CabinetController {
    private final CabinetService cabinetService;
    private final ResultService resultService;
    private final ContentService contentService;

    @PostMapping("/inner-page")
    public CabinetDto cabinet() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return cabinetService.getCabinet(username);
    }

    @PostMapping("/get-courses")
    public List<CourseDto> getCourses() {
        return cabinetService.getCoursesForStudentAndTeachers();
    }

    @PostMapping("/get-units")
    public CourseDto getUnits(@RequestBody CourseDto courseDto) {
        return cabinetService.getUnitsForUser(courseDto.getId());
    }

    @PostMapping("/get-contents")
    public UnitContentsDto getContents(@RequestBody UnitMenuDto unitMenuDto) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return contentService.getLessonContents(unitMenuDto, username, false);
    }
    @PostMapping("/cabinet/save-results")
    public ResponseEntity<?> saveResults(@RequestBody ResultDto resultsDto) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return resultService.saveResult(username, resultsDto);
    }

}
