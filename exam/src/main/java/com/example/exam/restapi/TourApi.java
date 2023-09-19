package com.example.exam.restapi;

import com.example.exam.dtos.TourDto;
import com.example.exam.entity.Tours;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/tour")
@RequiredArgsConstructor
public class TourApi {
    final TourService tourService;

    @GetMapping()
    public ResponseEntity<List<Tours>> getList() {
        return ResponseEntity.ok(tourService.findAll());
    }

    @GetMapping("/{id}")
    public TourDto getDetail(@PathVariable("id") long id) {
        Optional<Tours> optionalTours = tourService.findById(id);
        if (!optionalTours.isPresent()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Not found");
        }
        return new TourDto(optionalTours.get());
    }
}
