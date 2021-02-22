package win.pangniu.learn;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import win.pangniu.learn.service.StorageService;

/**
 * 启动类
 * Created by wenwen on 2017/4/11.
 * version 1.0
 */
@SpringBootApplication
public class App  {

    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }

    @Bean
    CommandLineRunner init(final StorageService storageService) {
        return args -> {
            storageService.deleteAll();
            storageService.init();
        };
    }

}
