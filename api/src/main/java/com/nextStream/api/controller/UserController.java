package com.nextStream.api.controller;

import com.nextStream.api.dto.response.UsersResponseDto;
import com.nextStream.api.service.UsersService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {
    private final UsersService usersService;

    @PostMapping("")
    public ResponseEntity<String> users(UsersResponseDto users) {
        return ResponseEntity.ok("user created");
    }

    @GetMapping("")
    public ResponseEntity<List<UsersResponseDto>> users() {
        List<UsersResponseDto> usersResponseDtos = usersService.findAll();
        return ResponseEntity.ok(usersResponseDtos);
    }

    @GetMapping("/{id}")
    public ResponseEntity<UsersResponseDto> user(@PathVariable Long id) {
        UsersResponseDto usersResponseDto = usersService.findById(id);
        return ResponseEntity.ok(usersResponseDto);
    }
}
