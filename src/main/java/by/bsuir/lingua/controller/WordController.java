package by.bsuir.lingua.controller;

import by.bsuir.lingua.entity.Word;
import by.bsuir.lingua.repository.WordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/word")
public class WordController {

    @Autowired
    private WordRepository wordRepository;

    @PostMapping("/save")
    public String getProfilePage(@RequestParam String word_1, @RequestParam String word_2) {
        if (word_1.length() < 1 || word_2.length() < 1) {
            return "profile";
        }

        Word wordFromDb = wordRepository.findByLangFirst(word_1);
        if (wordFromDb != null) {
            return "profile";
        }

        wordFromDb = wordRepository.findByLangSecond(word_2);
        if (wordFromDb != null) {
            return "profile";
        }

        Word word = Word.builder().langFirst(word_1).langSecond(word_2).build();

        wordRepository.save(word);

        return "profile";
    }
}
