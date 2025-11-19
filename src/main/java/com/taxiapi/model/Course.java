package com.taxiapi.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "chauffeur_id")
    private Chauffeur chauffeur;

    private String pointDepart;
    private String pointArrivee;
    private LocalDateTime dateHeureDepart;
    private LocalDateTime dateHeureArrivee;

    @Enumerated(EnumType.STRING)
    private StatutCourse status;

    private BigDecimal tarif;

    public Course() {
    }

    public Course(Long id, Client client, Chauffeur chauffeur, String pointDepart, String pointArrivee, LocalDateTime dateHeureDepart, LocalDateTime dateHeureArrivee, StatutCourse status, BigDecimal tarif) {
        this.id = id;
        this.client = client;
        this.chauffeur = chauffeur;
        this.pointDepart = pointDepart;
        this.pointArrivee = pointArrivee;
        this.dateHeureDepart = dateHeureDepart;
        this.dateHeureArrivee = dateHeureArrivee;
        this.status = status;
        this.tarif = tarif;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Chauffeur getChauffeur() {
        return chauffeur;
    }

    public void setChauffeur(Chauffeur chauffeur) {
        this.chauffeur = chauffeur;
    }

    public String getPointDepart() {
        return pointDepart;
    }

    public void setPointDepart(String pointDepart) {
        this.pointDepart = pointDepart;
    }

    public String getPointArrivee() {
        return pointArrivee;
    }

    public void setPointArrivee(String pointArrivee) {
        this.pointArrivee = pointArrivee;
    }

    public LocalDateTime getDateHeureDepart() {
        return dateHeureDepart;
    }

    public void setDateHeureDepart(LocalDateTime dateHeureDepart) {
        this.dateHeureDepart = dateHeureDepart;
    }

    public LocalDateTime getDateHeureArrivee() {
        return dateHeureArrivee;
    }

    public void setDateHeureArrivee(LocalDateTime dateHeureArrivee) {
        this.dateHeureArrivee = dateHeureArrivee;
    }

    public StatutCourse getStatus() {
        return status;
    }

    public void setStatus(StatutCourse status) {
        this.status = status;
    }

    public BigDecimal getTarif() {
        return tarif;
    }

    public void setTarif(BigDecimal tarif) {
        this.tarif = tarif;
    }
}
