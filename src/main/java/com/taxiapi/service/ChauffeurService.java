package com.taxiapi.service;

import com.taxiapi.model.Chauffeur;
import com.taxiapi.repository.ChauffeurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChauffeurService implements IChauffeurService {

    @Autowired
    private ChauffeurRepository chauffeurRepository;

    @Override
    public Chauffeur create(Chauffeur chauffeur) {
        return chauffeurRepository.save(chauffeur);
    }

    @Override
    public List<Chauffeur> findAll() {
        return chauffeurRepository.findAll();
    }

    @Override
    public Chauffeur findById(Long id) {
        return chauffeurRepository.findById(id).orElse(null);
    }

    @Override
    public Chauffeur update(Long id, Chauffeur chauffeur) {
        Chauffeur existingChauffeur = findById(id);
        if (existingChauffeur != null) {
            existingChauffeur.setNom(chauffeur.getNom());
            existingChauffeur.setVehicule(chauffeur.getVehicule());
            existingChauffeur.setImmatriculation(chauffeur.getImmatriculation());
            existingChauffeur.setStatut(chauffeur.getStatut());
            return chauffeurRepository.save(existingChauffeur);
        }
        return null;
    }
}
