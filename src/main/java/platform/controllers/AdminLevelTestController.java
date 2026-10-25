package platform.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import platform.dtos.LevelTestDto;
import platform.services.LevelTestService;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class AdminLevelTestController {
    private final LevelTestService levelTestService;

    @PostMapping("admin/get-level-tests")
    public List<LevelTestDto> getLevelTests() {
        return levelTestService.getLevelTestsDto();
    }
    @PostMapping("admin/create-level-test")
    public List<LevelTestDto> createLevelTest(@RequestBody LevelTestDto testDto) {
        return levelTestService.createLevelTest(testDto);
    }

    @PostMapping("admin/update-level-test")
    public LevelTestDto saveLevelTest(@RequestBody LevelTestDto testDto) {
        return levelTestService.updateTest(testDto);
    }
    @PostMapping("admin/change-order-level-test")
    public ResponseEntity<?> changeOrderForLevelTests(@RequestBody LevelTestDto testDto) {
        return levelTestService.changeOrderLevelTest(testDto);
    }
    @PostMapping("admin/delete-level-test")
    public List<LevelTestDto> deleteLevelTest(@RequestBody LevelTestDto testDto) {
        return levelTestService.deleteTest(testDto);
    }
}
