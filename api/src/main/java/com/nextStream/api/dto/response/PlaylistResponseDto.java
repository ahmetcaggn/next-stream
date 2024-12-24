package com.nextStream.api.dto.response;

import com.nextStream.api.entity.Video;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlaylistResponseDto {
    private Long id;
    private String title;
    private String description;
    private Long userId;
    private List<Video> videos;
}
