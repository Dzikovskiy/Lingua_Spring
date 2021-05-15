package by.bsuir.lingua.service;

import by.bsuir.lingua.entity.Course;
import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.entity.Word;
import by.bsuir.lingua.entity.WordStage;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class WordStageService {

    public void fillWordsListsByStages(List<WordStage> stagedWordsList, List<Word> wordsLearned, List<Word> wordsTested, List<Word> wordsMatched) {
        for (WordStage wordStage : stagedWordsList) {
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

    public List<Word> getWordsFromUserCourses(User user) {
        List<Course> courses = user.getJoinedCourses();
        if (courses.isEmpty()) {
            return new ArrayList<>();
        }
        List<Word> words = new ArrayList<>();//list of all words in courses that user have joined
        for (Course course : courses) {
            words.addAll(course.getWords());
        }
        return words;
    }
}
