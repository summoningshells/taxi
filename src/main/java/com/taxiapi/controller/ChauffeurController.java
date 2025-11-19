package com.taxiapi.controller;

import com.taxiapi.model.Chauffeur;
import com.taxiapi.service.IChauffeurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/chauffeurs")
public class ChauffeurController {

    @Autowired
    private IChauffeurService chauffeurService;

    @PostMapping
    public Chauffeur create(@RequestBody Chauffeur chauffeur) {
        return chauffeurService.create(chauffeur);
    }

    @GetMapping
    public List<Chauffeur> findAll() {
        return chauffeurService.findAll();
    }

    @GetMapping("/{id}")
    public Chauffeur findById(@PathVariable Long id) {
        return chauffeurService.findById(id);
    }

    @PutMapping("/{id}")
    public Chauffeur update(@PathVariable Long id, @RequestBody Chauffeur chauffeur) {
        return chauffeurService.update(id, chauffeur);
    }
}
