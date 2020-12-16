package by.bsuir.lingua.controller;


import by.bsuir.lingua.entity.Role;
import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.Set;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("message", "");
        return ("/registration");
    }

    @PostMapping("/registration")
    public String addUser(User userCredentials, Map<String, Object> model, @RequestParam Map<String, String> form) {

        User userFormDb = userRepository.findByUsername(userCredentials.getUsername());
        if (userFormDb != null) {
            model.put("message", "User exists by login!");
            return "registration";

        }
        userFormDb = userRepository.findByEmail(userCredentials.getEmail());
        if (userFormDb != null) {
            model.put("message", "User exists by email!");
            return "registration";

        }

        User user = User.builder()
                .active(true)
                .username(userCredentials.getUsername())
                .email(userCredentials.getEmail())
                .password(passwordEncoder.encode(userCredentials.getPassword()))
                .roles(Set.of(Role.USER))
                .build();

        userRepository.save(user);

        return "redirect:/login";

    }

    @GetMapping("/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

}
