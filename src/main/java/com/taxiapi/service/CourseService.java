package com.taxiapi.service;

import com.taxiapi.model.Chauffeur;
import com.taxiapi.model.Course;
import com.taxiapi.model.StatutChauffeur;
import com.taxiapi.model.StatutCourse;
import com.taxiapi.repository.ChauffeurRepository;
import com.taxiapi.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class CourseService implements ICourseService {

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private ChauffeurRepository chauffeurRepository;

    @Override
    public Course create(Course course) {
        course.setStatus(StatutCourse.demandee);
        return courseRepository.save(course);
    }

    @Override
    public List<Course> findAll() {
        return courseRepository.findAll();
    }

    @Override
    public Course findById(Long id) {
        return courseRepository.findById(id).orElse(null);
    }

    @Override
    public Course update(Long id, Course course) {
        Course existingCourse = findById(id);
        if (existingCourse != null) {
            if (course.getStatus() == StatutCourse.en_cours) {
                // Find an available driver
                List<Chauffeur> chauffeurs = chauffeurRepository.findAll();
                Chauffeur availableChauffeur = chauffeurs.stream()
                        .filter(c -> c.getStatut() == StatutChauffeur.disponible)
                        .findFirst()
                        .orElse(null);

                if (availableChauffeur != null) {
                    existingCourse.setChauffeur(availableChauffeur);
                    existingCourse.setStatus(StatutCourse.en_cours);
                    existingCourse.setDateHeureDepart(LocalDateTime.now());

                    availableChauffeur.setStatut(StatutChauffeur.en_course);
                    chauffeurRepository.save(availableChauffeur);
                } else {
                    // Handle case where no driver is available
                    return null;
                }
            } else if (course.getStatus() == StatutCourse.terminee) {
                existingCourse.setStatus(StatutCourse.terminee);
                existingCourse.setDateHeureArrivee(LocalDateTime.now());

                Chauffeur chauffeur = existingCourse.getChauffeur();
                if (chauffeur != null) {
                    chauffeur.setStatut(StatutChauffeur.disponible);
                    chauffeurRepository.save(chauffeur);
                }
            }
            return courseRepository.save(existingCourse);
        }
        return null;
    }

    @Override
    public void delete(Long id) {
        Course existingCourse = findById(id);
        if (existingCourse != null) {
            existingCourse.setStatus(StatutCourse.annulee);

            Chauffeur chauffeur = existingCourse.getChauffeur();
            if (chauffeur != null) {
                chauffeur.setStatut(StatutChauffeur.disponible);
                chauffeurRepository.save(chauffeur);
            }
            courseRepository.save(existingCourse);
        }
    }
}
