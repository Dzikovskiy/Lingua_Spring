package by.bsuir.lingua.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity(name = "Course")
@Table(name = "courses")
@Data
@ToString
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @OneToMany(mappedBy = "course")
    private Set <Word> words;
    @ManyToMany(mappedBy = "joinedCourses")
    private List<User> joinedUsers;



}
