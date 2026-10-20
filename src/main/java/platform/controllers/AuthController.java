package platform.controllers;

import org.springframework.web.bind.annotation.*;
import platform.dtos.JwtRequest;
import platform.dtos.RegistrationUserDto;
import platform.dtos.RememberPasswordDto;
import platform.dtos.UserDto;
import platform.services.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;


@RestController
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;

    @PostMapping("/auth/login")
    public ResponseEntity<?> createAuthToken(@RequestBody JwtRequest authRequest) {
        return authService.createAuthToken(authRequest);
    }
    @PostMapping("/auth/reg")
    public ResponseEntity<?> createNewUser(@RequestBody RegistrationUserDto registrationUserDto) {
        return authService.createNewUser(registrationUserDto);
    }
    @GetMapping("/auth/activate")
    public ResponseEntity<?> activateCode(@RequestParam("code") String activateCode) {
        return authService.activateCode(activateCode);
    }
    @PostMapping("/auth/remember")
    public ResponseEntity<?> remember(@RequestBody UserDto userDto) {
        String email = userDto.getEmail();
        return authService.rememberPassword(email);
    }
    @PostMapping("/auth/change-password")
    public ResponseEntity<?> changePassword(@RequestBody RememberPasswordDto rememberPasswordDto) {
        return authService.changePassword(rememberPasswordDto);
    }
    @PostMapping("/auth/quick-reg")
    public ResponseEntity<?> quickCreateNewUser(@RequestBody RegistrationUserDto registrationUserDto) {
        return authService.quickCreateUserAfterLevelTest(registrationUserDto);
    }
}