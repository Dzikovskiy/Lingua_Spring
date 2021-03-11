package by.bsuir.lingua;

import by.bsuir.lingua.controller.ProfileController;
import by.bsuir.lingua.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
class LinguaApplicationTests {

	@Autowired
	private ProfileController profileController;

	@Autowired
	private UserService userService;

	@Test
	void contextLoads() {
		assertNotNull(profileController);
		assertNotNull(userService);
	}

}
