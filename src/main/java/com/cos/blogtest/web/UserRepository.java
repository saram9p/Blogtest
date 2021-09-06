package com.cos.blogtest.web;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.blogtest.domain.user.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	@Query(value = "Select * From user Where username = :username And password = :password", nativeQuery = true)
	User mLogin(String username, String password);
}
