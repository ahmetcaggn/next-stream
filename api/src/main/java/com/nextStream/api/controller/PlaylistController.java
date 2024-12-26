package com.nextStream.api.controller;

import com.nextStream.api.dto.response.PlaylistResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/playlists")
@RequiredArgsConstructor
public class PlaylistController {
    @GetMapping("/{id}")
    public ResponseEntity<PlaylistResponseDto> playlist(@PathVariable Long id) {
        //todo get playlist by id
        return ResponseEntity.ok(new PlaylistResponseDto());
    }

    @GetMapping()
    public ResponseEntity<List<PlaylistResponseDto>> playlists() {
        //todo get all playlists
        return ResponseEntity.ok(List.of(new PlaylistResponseDto()));
    }

    @PostMapping()
    public ResponseEntity<PlaylistResponseDto> playlistPost() {
        return ResponseEntity.ok(new PlaylistResponseDto());
    }
}
