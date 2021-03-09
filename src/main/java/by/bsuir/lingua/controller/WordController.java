package by.bsuir.lingua.controller;

import by.bsuir.lingua.entity.Course;
import by.bsuir.lingua.entity.Word;
import by.bsuir.lingua.repository.CourseRepository;
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

    @Autowired
    private CourseRepository courseRepository;

    @PostMapping("/save")
    public String getProfilePage(@RequestParam String langFirst, @RequestParam String langSecond,@RequestParam Long course_id) {
        if (langFirst.length() < 1 || langSecond.length() < 1) {
            return "profile";
        }

        Word wordFromDb = wordRepository.findByLangFirst(langFirst);
        if (wordFromDb != null) {
            return "profile";
        }

        wordFromDb = wordRepository.findByLangSecond(langSecond);
        if (wordFromDb != null) {
            return "profile";
        }
        Course course = courseRepository.findById(course_id).get();

        Word word = Word.builder().langFirst(langFirst).langSecond(langSecond).course(course).build();

        wordRepository.save(word);

        return "redirect:/profile";
    }
}
