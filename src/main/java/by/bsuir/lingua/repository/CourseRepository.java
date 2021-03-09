package by.bsuir.lingua.repository;

import by.bsuir.lingua.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<Course, Long> {
    Course findByName(String name);

    void deleteByName(String name);
}
