package com.example.exam.service;

import com.example.exam.dtos.TourDto;
import com.example.exam.entity.Tours;
import com.example.exam.repository.ToursRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TourService {
    final ToursRepository toursRepository;

    public List<Tours> findAll() {
        return toursRepository.findAll();
    }

    public Optional<Tours> findById(long id) {
        return toursRepository.findById(id);
    }

    public Tours create(TourDto tourDto) {
        Tours tours = new Tours(tourDto);
        BeanUtils.copyProperties(tourDto, tours);
        return toursRepository.save(tours);
    }

    public void update(TourDto tourDto) {
        Optional<Tours> optionalTours = toursRepository.findById(tourDto.getId());
        if (!optionalTours.isPresent()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Not found");
        }
        Tours tours = optionalTours.get();

        BeanUtils.copyProperties(tourDto, tours);
        toursRepository.save(tours);
    }

    public void deleteById(long id) {
        toursRepository.deleteById(id);
    }
}
