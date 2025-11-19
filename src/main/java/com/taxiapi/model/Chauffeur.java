package com.taxiapi.model;

import jakarta.persistence.*;

@Entity
public class Chauffeur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nom;
    private String vehicule;
    private String immatriculation;
    @Enumerated(EnumType.STRING)
    private StatutChauffeur statut;

    public Chauffeur() {
    }

    public Chauffeur(Long id, String nom, String vehicule, String immatriculation, StatutChauffeur statut) {
        this.id = id;
        this.nom = nom;
        this.vehicule = vehicule;
        this.immatriculation = immatriculation;
        this.statut = statut;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getVehicule() {
        return vehicule;
    }

    public void setVehicule(String vehicule) {
        this.vehicule = vehicule;
    }

    public String getImmatriculation() {
        return immatriculation;
    }

    public void setImmatriculation(String immatriculation) {
        this.immatriculation = immatriculation;
    }

    public StatutChauffeur getStatut() {
        return statut;
    }

    public void setStatut(StatutChauffeur statut) {
        this.statut = statut;
    }
}
