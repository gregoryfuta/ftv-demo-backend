package i0.sealights.demo.summator.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("appservices.url")
public class AppServicesUrl {
    private String calculator;
    private String summator;
}
