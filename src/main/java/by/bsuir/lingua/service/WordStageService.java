package by.bsuir.lingua.service;

import by.bsuir.lingua.entity.Word;
import by.bsuir.lingua.entity.WordStage;
import by.bsuir.lingua.repository.WordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WordStageService {

    @Autowired
    private WordRepository wordRepository;



    public void fillWordsListsByStages(List<WordStage> wordStageList, List<Word> wordsLearned, List<Word> wordsTested, List<Word> wordsMatched){
        for (WordStage wordStage : wordStageList) {
            switch (wordStage.getStageType()) {
                case ACQUAINTED:
                    wordsLearned.add(wordStage.getWord());
                    break;
                case TESTED:
                    wordsTested.add(wordStage.getWord());
                    break;
                case MATCHED:
                    wordsMatched.add(wordStage.getWord());
                    break;
                default:
                    break;
            }
        }
    }
}
