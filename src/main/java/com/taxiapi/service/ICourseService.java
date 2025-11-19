package com.taxiapi.service;

import com.taxiapi.model.Course;

import java.util.List;

public interface ICourseService {
    Course create(Course course);
    List<Course> findAll();
    Course findById(Long id);
    Course update(Long id, Course course);
    void delete(Long id);
}
