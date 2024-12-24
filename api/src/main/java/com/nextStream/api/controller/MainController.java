package com.nextStream.api.controller;

import com.nextStream.api.dto.response.UsersResponseDto;
import com.nextStream.api.dto.response.VideoResponseDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class MainController {
    @GetMapping("/videos/{id}")
    public ResponseEntity<VideoResponseDto> video(@PathVariable Long id) {
        //todo get video by id
        return ResponseEntity.ok(new VideoResponseDto());
    }

    @GetMapping("/videos")
    public ResponseEntity<List<VideoResponseDto>> videos() {
        //todo get all videos
        return ResponseEntity.ok(List.of(new VideoResponseDto()));
    }

    // return video wrt, search bar query in mobile app

    @PostMapping("/video")
    public ResponseEntity<VideoResponseDto> videoPost() {
        return ResponseEntity.ok(new VideoResponseDto());
    }

    @PostMapping("/users")
    public ResponseEntity<String> users(UsersResponseDto users) {
        return ResponseEntity.ok("user created");
    }

    @GetMapping("/users")
    public ResponseEntity<List<UsersResponseDto>> users() {
        return ResponseEntity.ok(List.of(new UsersResponseDto()));
    }

    @GetMapping("/users/{id}")
    public ResponseEntity<UsersResponseDto> user(@PathVariable Long id) {
        return ResponseEntity.ok(new UsersResponseDto());
    }

}
