package by.bsuir.lingua.controller;

import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.repository.CourseRepository;
import by.bsuir.lingua.repository.UserRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Log4j2
public class CourseController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CourseRepository courseRepository;

    @PostMapping("/joinCourse")
    public String joinCourse(@RequestParam(name = "course_id") Long courseId, @AuthenticationPrincipal User userCredentials) {

        log.info("user id:" + userCredentials);
        User user = userRepository.findById(userCredentials.getId()).get();
        user.addCourse(courseRepository.getOne(courseId));
        userRepository.save(user);


        return "profile";
    }
}
