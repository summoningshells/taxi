package com.taxiapi.service;

import com.taxiapi.model.Chauffeur;

import java.util.List;

public interface IChauffeurService {
    Chauffeur create(Chauffeur chauffeur);
    List<Chauffeur> findAll();
    Chauffeur findById(Long id);
    Chauffeur update(Long id, Chauffeur chauffeur);
}
