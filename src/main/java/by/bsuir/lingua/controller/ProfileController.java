package by.bsuir.lingua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {

    @GetMapping("/")
    public String getProfilePage() {

        return "profile.html";
    }

}
