package com.example.exam.restapi.admin;

import com.example.exam.dtos.TourDto;
import com.example.exam.entity.Tours;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/admin/api/tour")
@RequiredArgsConstructor
public class AdminTourApi {
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

    @PostMapping()
    public TourDto create(@RequestBody TourDto tourDto) {
        return new TourDto(tourService.create(tourDto));
    }

    @PutMapping()
    public String update(@RequestBody TourDto tourDto) {
        tourService.update(tourDto);
        return "Update success";
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable("id") long id) {
        Optional<Tours> optionalTours = tourService.findById(id);
        if (!optionalTours.isPresent()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Not found");
        }
        tourService.deleteById(id);
        return new ResponseEntity<>("Delete success", HttpStatus.OK);
    }
}
