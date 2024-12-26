package com.nextStream.api.dto.request;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Data
@RequiredArgsConstructor
public class VideoUploadRequestDto {
    private final String title;
    private final String description;
    private final MultipartFile file;
}
