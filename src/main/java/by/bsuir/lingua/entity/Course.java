package by.bsuir.lingua.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "Course")
@Table(name = "courses")
@Data
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @OneToMany
    private Set <Word> words;
}
