package platform.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import platform.dtos.MenuItemDto;
import platform.dtos.ParamIdDto;
import platform.services.MenuItemService;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class AdminMenuItemController {
    private final MenuItemService menuItemService;

    @PostMapping("admin/get-menu-items-by-unit")
    public List<MenuItemDto> createMenuItemByUnit(@RequestBody ParamIdDto paramId) {
        return menuItemService.getMenuItemsByLesson(paramId.getId());
    }

    @PostMapping("admin/create-menu-item-for-unit")
    public MenuItemDto createForLesson(@RequestBody MenuItemDto menuItemDto) {
        return menuItemService.createMenuItemsForLesson(menuItemDto);
    }

    @PostMapping("admin/update-menu-items-for-unit")
    public List<MenuItemDto> updateMenuItemForUnit(@RequestBody List<MenuItemDto> menuItemDtoList) {
        return menuItemService.updateMenuItemForLesson(menuItemDtoList);
    }
    @PostMapping("admin/delete-menu-item")
    public ResponseEntity<?> deleteMenuItem(@RequestBody MenuItemDto menuItemDto) {
        return menuItemService.deleteMenuItem(menuItemDto.getId());
    }
}
