package com.nextStream.api.service;

import com.nextStream.api.dto.request.VideoUploadRequestDto;
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
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class VideoService {
    private final VideoRepository videoRepository;

    @Value("${video.path}")
    private String storagePath;

    public VideoResponseDto saveVideo(VideoUploadRequestDto videoRequest) {
        String savedFileName = uploadVideoToStorage(videoRequest.getFile());

        Video video = Video.builder()
                .title(videoRequest.getTitle())
                .description(videoRequest.getDescription())
                .fileName(savedFileName)
                .build();

        Video savedVideo = videoRepository.save(video);

        return new VideoResponseDto(savedVideo);
    }

    public String uploadVideoToStorage(MultipartFile file) {
        if (file.isEmpty()) {
            throw new RuntimeException("The file is empty");
        }

        UUID uuid = UUID.randomUUID();
        String fileExtension = StringUtils.getFilenameExtension(Objects.requireNonNull(file.getOriginalFilename()));
        String fileName = String.format("%s.%s", uuid, fileExtension);

        try {
            Path targetLocation = Paths.get(storagePath + fileName);
            Files.createDirectories(targetLocation.getParent());
            file.transferTo(targetLocation);
            return fileName;
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
