package by.bsuir.lingua.repository;

import by.bsuir.lingua.entity.Word;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WordRepository extends JpaRepository<Word, Long> {

    Word findByLangFirst(String langFirst);

    Word findByLangSecond(String langSecond);
}
