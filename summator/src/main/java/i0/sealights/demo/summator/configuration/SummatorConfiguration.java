package i0.sealights.demo.summator.configuration;

import i0.sealights.demo.summator.service.SummatorService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SummatorConfiguration {

    @Bean
    public SummatorService calculatorService() {
        return new SummatorService();
    }

}
