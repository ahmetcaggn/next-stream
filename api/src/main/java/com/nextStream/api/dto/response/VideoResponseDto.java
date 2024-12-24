package com.nextStream.api.dto.response;

import com.nextStream.api.entity.Playlist;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VideoResponseDto {
    private Long id;
    private String title;
    private String description;
    private String filePath;
    private Timestamp creationDate;
    private List<Playlist> playlists;
    private Long userId;
}
