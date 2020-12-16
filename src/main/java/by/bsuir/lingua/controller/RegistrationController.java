package by.bsuir.lingua.controller;


import by.bsuir.lingua.entity.Role;
import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("message", "");
        return ("/registration");
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model, @RequestParam Map<String, String> form) {

        User userFormDb = userRepository.findByUsername(user.getUsername());
        if (userFormDb != null) {
            model.put("message", "User exists!");
            return "registration";

        }

        user.setActive(true);


        user.setRoles(Collections.singleton(Role.USER));

        userRepository.save(user);
        return "redirect:/login";

    }

}
