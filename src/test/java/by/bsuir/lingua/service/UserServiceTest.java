package by.bsuir.lingua.service;

import by.bsuir.lingua.entity.User;
import by.bsuir.lingua.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;

@RunWith(SpringRunner.class)
@DataJpaTest
class UserServiceTest {

    @Autowired
    private UserRepository repository;

    @Autowired
    private TestEntityManager entityManager;


    @Test
    void loadUserByUsername() {
        User user = new User();
        user.setUsername("name");
        user.setPassword("123123123");

        user = entityManager.persistAndFlush(user);
        Optional<User> optionalUser = repository.findById(1L);

        assertEquals(optionalUser.get().getId(), user.getId());
        assertEquals(optionalUser.get().getUsername(), user.getUsername());
        assertEquals(optionalUser.get().getPassword(), user.getPassword());
    }
}