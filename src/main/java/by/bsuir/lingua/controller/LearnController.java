package by.bsuir.lingua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LearnController {

    @GetMapping("/learn")
    public String getLearnPage() {

        return "learn";
    }
}
