package platform.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import platform.dtos.*;
import platform.services.ContentService;

@RestController
@RequiredArgsConstructor
public class AdminContentController {
    private final ContentService contentService;

    @PostMapping("admin/get-contents")
    public UnitContentsDto getLessonContents(@RequestBody UnitMenuDto unitMenuDto) {
        return contentService.getLessonContents(unitMenuDto, null, true);
    }
    @PostMapping("admin/create-content")
    public ContentDto createCourse(@RequestBody ContentDto contentDto) {
        return contentService.createContent(contentDto);
    }

    @PostMapping("admin/update-content")
    public ContentDto updateContent(@RequestBody ContentDto contentDto) {
        return contentService.updateContent(contentDto);
    }
    @PostMapping("admin/delete-content")
    public ResponseEntity<?> deleteContent(@RequestBody ContentDto contentDto) {
        return contentService.deleteContent(contentDto);
    }
}
