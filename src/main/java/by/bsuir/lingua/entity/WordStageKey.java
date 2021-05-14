package by.bsuir.lingua.entity;


import lombok.*;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@Data
@AllArgsConstructor
/* Special class for Composite Key */
public class WordStageKey implements Serializable {
    @Column(name = "User_id")
    private Long userId;

    @Column(name = "Word_id")
    private Long wordId;

    public WordStageKey() {

    }
}
