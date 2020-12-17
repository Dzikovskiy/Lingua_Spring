package by.bsuir.lingua.controller;

import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.entity.Word;
import by.bsuir.lingua.entity.WordStage;
import by.bsuir.lingua.repository.WordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProfileController {

    @Autowired
    private WordRepository wordRepository;

    @GetMapping("/profile")
    public String getProfilePage(@AuthenticationPrincipal User user, Model model) {
        List<WordStage> wordStageList = user.getWords();
        List<Word> wordsLearned = new ArrayList<>();
        List<Word> wordsTested = new ArrayList<>();
        List<Word> wordsMatched = new ArrayList<>();

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


        model.addAttribute("wordsLearned",wordsLearned);
        model.addAttribute("wordsTested",wordsTested);
        model.addAttribute("wordsMatched",wordsMatched);
        return "profile";
    }

}
