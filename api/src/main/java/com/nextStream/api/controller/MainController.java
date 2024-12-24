package com.nextStream.api.controller;

import com.nextStream.api.dto.response.PlaylistResponseDto;
import com.nextStream.api.dto.response.UsersResponseDto;
import com.nextStream.api.dto.response.VideoResponseDto;
import com.nextStream.api.service.UsersService;
import com.nextStream.api.service.VideoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class MainController {
    private final UsersService usersService;
    private final VideoService videoService;

    @GetMapping("/videos/{id}")
    public ResponseEntity<VideoResponseDto> video(@PathVariable Long id) {
        return ResponseEntity.ok(videoService.getVideoById(id));
    }

    @GetMapping("/videos")
    public ResponseEntity<List<VideoResponseDto>> videos() {
        return ResponseEntity.ok(videoService.getAllVideos());
    }

    @PostMapping("/videos")
    public ResponseEntity<String> videoPost(@RequestParam("file") MultipartFile file) {
        videoService.uploadVideo(file);
        return ResponseEntity.ok("video uploaded");
    }

    // return video wrt, search bar query in mobile app

    @GetMapping("/playlists/{id}")
    public ResponseEntity<PlaylistResponseDto> playlist(@PathVariable Long id) {
        //todo get playlist by id
        return ResponseEntity.ok(new PlaylistResponseDto());
    }

    @GetMapping("/playlists")
    public ResponseEntity<List<PlaylistResponseDto>> playlists() {
        //todo get all playlists
        return ResponseEntity.ok(List.of(new PlaylistResponseDto()));
    }

    @PostMapping("/playlist")
    public ResponseEntity<PlaylistResponseDto> playlistPost() {
        return ResponseEntity.ok(new PlaylistResponseDto());
    }

    @PostMapping("/users")
    public ResponseEntity<String> users(UsersResponseDto users) {
        return ResponseEntity.ok("user created");
    }

    @GetMapping("/users")
    public ResponseEntity<List<UsersResponseDto>> users() {
        List<UsersResponseDto> usersResponseDtos = usersService.findAll();
        return ResponseEntity.ok(usersResponseDtos);
    }

    @GetMapping("/users/{id}")
    public ResponseEntity<UsersResponseDto> user(@PathVariable Long id) {
        UsersResponseDto usersResponseDto = usersService.findById(id);
        return ResponseEntity.ok(usersResponseDto);
    }

}
