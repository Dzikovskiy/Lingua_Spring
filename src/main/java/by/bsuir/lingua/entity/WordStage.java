package by.bsuir.lingua.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity(name = "WordStage")
@Data
@AllArgsConstructor
@NoArgsConstructor
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

    public WordStage(User users, Word word, StageType stageType) {
        this.users = users;
        this.word = word;
        this.stageType = stageType;
        this.id = new WordStageKey(users.getId(), word.getId());
    }
}
