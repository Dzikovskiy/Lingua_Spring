package by.bsuir.lingua.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity(name = "WordStage")
@Getter
@Setter
@AllArgsConstructor
public class WordStage {
    @ManyToOne
    @MapsId("userId")
    @JoinColumn(name = "User_id")
    User users;
    @ManyToOne
    @MapsId("wordId")
    @JoinColumn(name = "Word_id")
    Word word;
    @EmbeddedId
    private WordStageKey id;
    @Column(name = "stage")
    private StageType stageType;

    public WordStage() {

    }
}
