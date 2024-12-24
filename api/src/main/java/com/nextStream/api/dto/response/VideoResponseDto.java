package com.nextStream.api.dto.response;

import com.nextStream.api.entity.Playlist;
import com.nextStream.api.entity.Video;
import lombok.*;

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

    public VideoResponseDto(Video video) {
        this.id = video.getId();
        this.title = video.getTitle();
        this.description = video.getDescription();
        this.filePath = video.getFilePath();
        this.creationDate = video.getCreationDate();
        this.playlists = video.getPlaylist();
        this.userId = video.getUser().getId();
    }
}
