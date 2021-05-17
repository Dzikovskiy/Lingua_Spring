package by.bsuir.lingua.controller;


import by.bsuir.lingua.entity.Role;
import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.Set;

@Controller
@AllArgsConstructor
public class UserController {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("message", "");
        return ("/registration");
    }

    @PostMapping("/registration")
    public String addUser(User userCredentials, Map<String, Object> model) {

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

    @PostMapping("/saveProfile")
    public String saveEditedUser(User editedUser,@AuthenticationPrincipal User userPrincipal) {

        //todo добавить проверку есть ли такой эмэил у другого пользователя
        userPrincipal.setEmail(editedUser.getEmail());
        userPrincipal.setUsername(editedUser.getUsername());
        userPrincipal.setPassword(passwordEncoder.encode(editedUser.getPassword()));

        userRepository.save(userPrincipal);

        return "redirect:/profile";

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
