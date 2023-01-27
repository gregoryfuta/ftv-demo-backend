package i0.sealights.demo.gateway.api;

import i0.sealights.demo.gateway.service.ApiUrlNotFound;
import i0.sealights.demo.gateway.service.HostResolver;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiGatewayController {

    HostResolver hostResolver;

    public ApiGatewayController(HostResolver hostResolver) {
        this.hostResolver = hostResolver;
    }

    @GetMapping("/api/{*uri}")
    public Object route(HttpServletRequest request) {

        final String serviceUrl = hostResolver.resolveServiceUrl(request.getRequestURI());

        final Map<String, String[]> parameterMap = request.getParameterMap();
        return "asd";
    }

    @ExceptionHandler({Exception.class})
    public ResponseEntity<ErrorResult> handleOtherExceptions(Exception exception) {
        final ErrorResult errorResult = new ErrorResult("Unexpected API Gateway exception: " + exception.getMessage());
        return ResponseEntity.internalServerError().body(errorResult);
    }


    @ExceptionHandler({ApiUrlNotFound.class})
    public ResponseEntity<ErrorResult> handleNotFoud(ApiUrlNotFound exception) {
        return ResponseEntity.notFound().header("X-Reason", exception.getMessage()).build();
    }

}
