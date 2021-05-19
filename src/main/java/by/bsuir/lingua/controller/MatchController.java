package by.bsuir.lingua.controller;

import by.bsuir.lingua.entity.*;
import by.bsuir.lingua.repository.UserRepository;
import by.bsuir.lingua.repository.WordRepository;
import by.bsuir.lingua.service.WordStageService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/match")
@AllArgsConstructor
@Slf4j
public class MatchController {
    private final WordRepository wordRepository;
    private final WordStageService wordStageService;
    private final UserRepository userRepository;

    @GetMapping
    public String getMatchPage(@AuthenticationPrincipal User user, Model model) {
        List<WordStage> wordStageList = user.getWords();
        List<Word> wordsTested = new ArrayList<>();

        wordStageService.fillWordsListsByStages(wordStageList, new ArrayList<>(), wordsTested, new ArrayList<>());

        if (wordsTested.isEmpty()) {
            return "match";
        }
        List<Word> words = new ArrayList<>();

        for (short i = 0; i < wordsTested.size() && i < 6; i++) {
            words.add(wordsTested.get(i));
        }

        List<ResponseWord> responseWords = new ArrayList<>();

        for (Word word : words) {
            responseWords.add(new ResponseWord(word.getId(), word.getLangFirst()));
            responseWords.add(new ResponseWord(word.getId(), word.getLangSecond()));
        }
        Collections.shuffle(responseWords);

        model.addAttribute("words_match", responseWords);

        return "match";
    }

    @PostMapping
    @ResponseBody
    public ResponseEntity<String> addMatchedWordToUser(@RequestParam(name = "id") Long wordId, @AuthenticationPrincipal User user) {
        Optional<Word> word = wordRepository.findById(wordId);
        if (word.isPresent()) {
            user.addWord(word.get(), StageType.MATCHED);
            userRepository.save(user);
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }
}
