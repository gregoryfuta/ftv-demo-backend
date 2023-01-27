package i0.sealights.demo.calculator.configuration;

import i0.sealights.demo.calculator.service.CalculatorService;
import i0.sealights.demo.calculator.service.ExpressionValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CalcConfiguration {

    @Bean
    public CalculatorService calculatorService() {
        return new CalculatorService(new ExpressionValidator());
    }

}
