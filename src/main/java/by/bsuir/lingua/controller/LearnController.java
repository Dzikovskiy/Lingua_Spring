package by.bsuir.lingua.controller;

import by.bsuir.lingua.entity.StageType;
import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.entity.Word;
import by.bsuir.lingua.entity.WordStage;
import by.bsuir.lingua.repository.UserRepository;
import by.bsuir.lingua.repository.WordRepository;
import by.bsuir.lingua.repository.WordStageRepository;
import by.bsuir.lingua.service.WordStageService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/learn")
@AllArgsConstructor
public class LearnController {
    private final WordRepository wordRepository;
    private final WordStageRepository wordStageRepository;
    private final UserRepository userRepository;
    private final WordStageService wordStageService;

    @GetMapping
    public String getLearnPage(@AuthenticationPrincipal User user, Model model) {
        List<WordStage> wordStageList = wordStageRepository.findAll();

        List<Word> words = wordStageService.getWordsFromUserCourses(userRepository.findByEmail(user.getEmail()));
        //remove all wordStages that not belong to current user
        wordStageList.removeIf(wordStage -> !wordStage.getUsers().getId().equals(user.getId()));
        //remove all words that already was studied by user
        for (WordStage wordStage : wordStageList) {
            words.removeIf(word -> word.getId().equals(wordStage.getWord().getId()));
        }

        if (!words.isEmpty()) {
            model.addAttribute("word", words.get(0));
        }

        return "learn";
    }

    @PostMapping("/learnWord")
    public String learnWord(@AuthenticationPrincipal User user, @RequestParam Long word_id) {
        Optional<Word> word = wordRepository.findById(word_id);
        if (word.isPresent()) {
            user.addWord(word.get(), StageType.ACQUAINTED);
            userRepository.save(user);
        }

        return "redirect:/learn";
    }
}
