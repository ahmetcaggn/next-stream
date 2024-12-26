package com.nextStream.api.controller;

import com.nextStream.api.dto.response.VideoResponseDto;
import com.nextStream.api.service.VideoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/videos")
@RequiredArgsConstructor
public class VideoController {
    private final VideoService videoService;

    @GetMapping("/{id}")
    public ResponseEntity<VideoResponseDto> video(@PathVariable Long id) {
        return ResponseEntity.ok(videoService.getVideoById(id));
    }

    @GetMapping()
    public ResponseEntity<List<VideoResponseDto>> videos() {
        return ResponseEntity.ok(videoService.getAllVideos());
    }

    @PostMapping()
    public ResponseEntity<String> videoPost(@RequestBody MultipartFile file) {
        videoService.uploadVideo(file);
        return ResponseEntity.ok("video uploaded");
    }
}
