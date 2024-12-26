package com.nextStream.api.dto.response;

import com.nextStream.api.entity.Users;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UsersResponseDto {
    private Long id;
    private String username;
    private String email;

    public UsersResponseDto(Users users) {
        this.id = users.getId();
        this.username = users.getUsername();
        this.email = users.getEmail();
    }
}
