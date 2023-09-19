package com.example.exam.controller;

public class PlaceController {
    @GetMapping("/places")
    public List<Place> getALlPlaces(){
        List<Place> places = new ArrayList<>();
        places.add(new Place("1", "Hội An"));
        places.add(new Place("2", "Sài Gòn"));
        places.add(new Place("3", "Chùa Một cột"));

        return places;
    }
}
