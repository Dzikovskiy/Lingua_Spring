package by.bsuir.lingua.service;

import by.bsuir.lingua.entity.Word;
import by.bsuir.lingua.repository.WordRepository;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class WordIdGenerator implements IdentifierGenerator {


    private WordRepository wordRepository;

    @Override
    public Serializable generate(SharedSessionContractImplementor sharedSessionContractImplementor, Object o) {
        wordRepository = ApplicationContextHolder.getBean(WordRepository.class);
        List<Word> words = wordRepository.findAll();

        long lastId = 1;

        if (!words.isEmpty()) {
            lastId = words.get(words.size() - 1).getId();
            lastId++;
        }
        return lastId;
    }
}