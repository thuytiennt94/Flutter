package com.example.exam.dtos;

import com.example.exam.entity.Tours;
import lombok.*;
import org.springframework.beans.BeanUtils;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TourDto {
    private long id;
    private String thumbnail;
    private String name;
    private Integer star;
    private String address;
    private String description;
    private Float price;

    public TourDto(Tours tours) {
        BeanUtils.copyProperties(tours, this);
    }
}
