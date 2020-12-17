package by.bsuir.lingua.entity;

import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Entity(name = "Word")
@Table(name = "word")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Word {
    @Id
    @GenericGenerator(name = "from_last_row_incremental_id", strategy =
            "by.bsuir.lingua.service.WordIdGenerator")
    @GeneratedValue(generator = "from_last_row_incremental_id")
    private Long id;
    private String langFirst;
    private String langSecond;

    @OneToMany(
            mappedBy = "word",
            cascade = CascadeType.MERGE,
            orphanRemoval = true
    )
    private List<WordStage> users;

}
