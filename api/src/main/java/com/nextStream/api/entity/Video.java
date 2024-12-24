package com.nextStream.api.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Entity
@Data
@Table(name = "video")
public class Video {
    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;
    private String filePath;
    private Timestamp creationDate;

    // one to many relationship with users
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private Users user;

    // many to many with playlist
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "videos")
    private List<Playlist> playlist;
}
