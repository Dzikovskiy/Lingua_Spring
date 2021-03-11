package by.bsuir.lingua.controller;

import by.bsuir.lingua.entity.Course;
import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.entity.Word;
import by.bsuir.lingua.entity.WordStage;
import by.bsuir.lingua.repository.CourseRepository;
import by.bsuir.lingua.repository.WordRepository;
import by.bsuir.lingua.service.WordStageService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
public class ProfileController {

    @Autowired
    private WordRepository wordRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private WordStageService wordStageService;

    @GetMapping("/profile")
    public String getProfilePage(@AuthenticationPrincipal User user, Model model) {
        List<WordStage> wordStageList = user.getWords();
        List<Word> wordsLearned = new ArrayList<>();
        List<Word> wordsTested = new ArrayList<>();
        List<Word> wordsMatched = new ArrayList<>();
        Iterable<Course> courses = courseRepository.findAll();
        Iterable<Word> words = wordRepository.findAll();

        wordStageService.fillWordsListsByStages(wordStageList, wordsLearned, wordsTested, wordsMatched);

        model.addAttribute("wordsLearned", wordsLearned);
        model.addAttribute("wordsTested", wordsTested);
        model.addAttribute("wordsMatched", wordsMatched);
        model.addAttribute("courses", courses);
        model.addAttribute("words", words);

       // log.info(user.getJoinedCourses());
        return "profile";
    }

    @PostMapping("/saveCourse")
    public String saveCourse(@RequestParam(name = "course_name") String courseName){
        Course course = new Course();
        course.setName(courseName.trim().toLowerCase());

        courseRepository.save(course);
        return "redirect:/profile";
    }

    @PostMapping("/deleteCourse")
    public String deleteCourse(@RequestParam Long id){
        courseRepository.deleteById(id);

        return "redirect:/profile";
    }

}
