package by.bsuir.lingua.controller;

import by.bsuir.lingua.entity.StageType;
import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.entity.Word;
import by.bsuir.lingua.entity.WordStage;
import by.bsuir.lingua.repository.UserRepository;
import by.bsuir.lingua.repository.WordRepository;
import by.bsuir.lingua.service.WordStageService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/test")
@AllArgsConstructor
public class TestController {
    private final WordRepository wordRepository;
    private final UserRepository userRepository;
    private final WordStageService wordStageService;

    @GetMapping
    public String getLearnPage(@AuthenticationPrincipal User user, Model model) {

        String counter;
        List<WordStage> stagedWordsList = user.getWords();
        List<Word> wordsLearned = new ArrayList<>();
        List<Word> wordsTested = new ArrayList<>();
        List<Word> randomWordsList = wordRepository.findAll();

        wordStageService.fillWordsListsByStages(stagedWordsList, wordsLearned, wordsTested, new ArrayList<>());

        if (wordsLearned.isEmpty()) {
            return "test";
        }

        //counter = wordsTested.size() + "/" + wordsLearned.size();
        counter = 1 + "/" + wordsLearned.size();

        model.addAttribute("counter", counter);

        Collections.shuffle(wordsLearned);
        Collections.shuffle(randomWordsList);

        Word word = wordsLearned.get(0);

        //remove word to test from random words to avoid duplicate
        randomWordsList.removeIf(w -> w.getId().equals(word.getId()));


        randomWordsList.get(0).setId(-1L);
        randomWordsList.get(1).setId(-1L);
        randomWordsList.get(2).setId(-1L);

        List<Word> testWords = new ArrayList<>(List.of(randomWordsList.get(0), randomWordsList.get(1), randomWordsList.get(2), word));

        Collections.shuffle(testWords);

        model.addAttribute("word", word);
        model.addAttribute("test_word_1", testWords.get(0));
        model.addAttribute("test_word_2", testWords.get(1));
        model.addAttribute("test_word_3", testWords.get(2));
        model.addAttribute("test_word_4", testWords.get(3));

        return "test";
    }

    @PostMapping("/testWord")
    public String testWord(@AuthenticationPrincipal User user, @RequestParam Long word_id) {
        if (word_id > 0) {
            Optional<Word> word = wordRepository.findById(word_id);
            if (word.isPresent()) {
                user.addWord(word.get(), StageType.TESTED);
                userRepository.save(user);
            }
        }

        return "redirect:/test";
    }
}
