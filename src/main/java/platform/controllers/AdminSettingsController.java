package platform.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import platform.dtos.SettingsDto;
import platform.dtos.StudentActivityDto;
import platform.services.SettingService;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class AdminSettingsController {
    private final SettingService settingService;

    @PostMapping("admin/get-settings")
    public List<SettingsDto> getSettings() {
        return settingService.getSettings();
    }
    @PostMapping("admin/update-settings")
    public SettingsDto updateSettings(@RequestBody SettingsDto settingsDto) {
        settingsDto = settingService.updateSettings(settingsDto);
        return settingsDto;
    }
}
