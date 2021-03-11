package by.bsuir.lingua.entity;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity(name = "Word")
@Table(name = "word")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode
public class Word {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String langFirst;
    private String langSecond;

    @OneToMany(
            mappedBy = "word",
            cascade = CascadeType.MERGE,
            orphanRemoval = true
    )
    private List<WordStage> users;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id")
    private Course course;
}
