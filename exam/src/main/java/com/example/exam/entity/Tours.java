package com.example.exam.entity;

import com.example.exam.dtos.TourDto;
import lombok.*;
import org.springframework.beans.BeanUtils;

import javax.persistence.*;

@Entity
@Getter
@ToString
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tours")
public class Tours {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String thumbnail;
    private String name;
    private Integer star;
    @Lob
    private String description;
    private String address;
    private Float price;

    public Tours(TourDto tourDto) {
        BeanUtils.copyProperties(tourDto, this);
    }
}
