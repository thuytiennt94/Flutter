package com.example.exam.repository;

import com.example.exam.entity.Tours;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ToursRepository extends JpaRepository<Tours, Long> {
}
