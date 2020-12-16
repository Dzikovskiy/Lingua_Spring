package by.bsuir.lingua.entity;


import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@Getter
@Setter
@EqualsAndHashCode
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
