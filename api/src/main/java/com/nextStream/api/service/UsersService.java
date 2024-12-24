package com.nextStream.api.service;

import com.nextStream.api.dto.response.UsersResponseDto;
import com.nextStream.api.entity.Users;
import com.nextStream.api.repository.UsersRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UsersService {
    private final UsersRepository usersRepository;

    public List<UsersResponseDto> findAll() {
        List<Users> users = usersRepository.findAll();

        return users.stream()
                .map(UsersResponseDto::new)
                .collect(Collectors.toList());
    }

    public UsersResponseDto findById(Long id) {
        Users users = usersRepository.findById(id).orElseThrow(
                () -> new IllegalArgumentException("There is no such user with id=" + id)
        );

        return new UsersResponseDto(users);
    }
}
