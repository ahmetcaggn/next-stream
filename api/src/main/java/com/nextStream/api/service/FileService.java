package com.nextStream.api.service;

import org.springframework.beans.factory.annotation.Value;
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

    public byte[] getFile(String fileName) {
        Path targetLocation = Paths.get(storagePath + fileName);
        try {
            return Files.readAllBytes(targetLocation);
        } catch (Exception ex) {
            throw new RuntimeException("Error while reading file");
        }
    }
}
