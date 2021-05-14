package by.bsuir.lingua.controller;

import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.entity.Word;
import by.bsuir.lingua.entity.WordStage;
import by.bsuir.lingua.repository.WordRepository;
import by.bsuir.lingua.service.WordStageService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/match")
@AllArgsConstructor
public class MatchController {
    private final WordRepository wordRepository;
    private final WordStageService wordStageService;

    @GetMapping
    public String getMatchPage(@AuthenticationPrincipal User user, Model model) {
        List<WordStage> wordStageList = user.getWords();
        List<Word> wordsLearned = new ArrayList<>();
        List<Word> wordsTested = new ArrayList<>();
        List<Word> wordsMatched = new ArrayList<>();

        List<Word> randomWordsList = wordRepository.findAll();

        wordStageService.fillWordsListsByStages(wordStageList, wordsLearned, wordsTested, wordsMatched);

        if (wordsTested.isEmpty()) {
            return "match";
        }

//        model.addAttribute("counter", counter);
//
//        Collections.shuffle(wordsLearned);
//        Collections.shuffle(randomWordsList);
//
//        Word word = wordsLearned.get(0);
//
//        randomWordsList.get(0).setId(-1L);
//        randomWordsList.get(1).setId(-1L);
//        randomWordsList.get(2).setId(-1L);
//
//        List<Word> testWords = new ArrayList<>(List.of(randomWordsList.get(0), randomWordsList.get(1), randomWordsList.get(2), word));
//
//        Collections.shuffle(testWords);
//
//        model.addAttribute("word", word);
//        model.addAttribute("test_word_1", testWords.get(0));
//        model.addAttribute("test_word_2", testWords.get(1));
//        model.addAttribute("test_word_3", testWords.get(2));
//        model.addAttribute("test_word_4", testWords.get(3));

        return "match";
    }


}
