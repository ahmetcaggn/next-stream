package com.nextStream.api.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Data
@Table(name = "users")
public class Users {
    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String password;
    private String email;

    // one to many relationship with playlist
    @OneToMany(mappedBy = "user")
    private List<Playlist> playlists;

}
