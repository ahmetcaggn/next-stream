package com.nextStream.api.service;

import com.nextStream.api.dto.response.VideoResponseDto;
import com.nextStream.api.entity.Video;
import com.nextStream.api.repository.VideoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class VideoService {
    private final VideoRepository videoRepository;

    @Value("${video.path}")
    private static final String VIDEO_UPLOAD_PATH = "/home/ubuntu/Desktop/videos/";

    public void uploadVideo(MultipartFile file) {
        if (file.isEmpty()) {
            throw new RuntimeException("The file is empty");
        }
        String fileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));

        try {
            Path targetLocation = Paths.get(VIDEO_UPLOAD_PATH + fileName);
            Files.createDirectories(targetLocation.getParent());
            file.transferTo(targetLocation);

        } catch (IOException ex) {
            throw new RuntimeException("Error while uploading file");
        }
    }

    public List<VideoResponseDto> getAllVideos() {
        List<Video> videos = videoRepository.findAll();
        return videos.stream()
                .map(VideoResponseDto::new)
                .toList();
    }

    public VideoResponseDto getVideoById(Long id) {
        Video video = videoRepository.findById(id).orElseThrow(
                () -> new IllegalArgumentException("There is no such video with id=" + id)
        );
        return new VideoResponseDto(video);
    }
}
