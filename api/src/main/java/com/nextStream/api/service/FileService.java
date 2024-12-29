package com.nextStream.api.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class FileService {
    @Value("${video.path}")
    private String storagePath;

    public MediaType getMediaType(String fileName) {
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        return switch (fileExtension) {
            case ".mp4" -> MediaType.valueOf("video/mp4");
            case ".jpg" -> MediaType.valueOf("image/jpeg");
            case ".png" -> MediaType.valueOf("image/png");
            default -> MediaType.APPLICATION_OCTET_STREAM;
        };
    }

    public Resource getFileAsResource(String fileName) {
        Path targetLocation = Paths.get(storagePath + fileName);
        return new FileSystemResource(targetLocation.toFile());
    }
}
