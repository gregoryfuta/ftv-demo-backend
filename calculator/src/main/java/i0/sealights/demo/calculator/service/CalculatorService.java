package i0.sealights.demo.calculator.service;

import com.fathzer.soft.javaluator.DoubleEvaluator;

public class CalculatorService {

    final ExpressionValidator expressionValidator;

    public CalculatorService(ExpressionValidator expressionValidator) {
        this.expressionValidator = expressionValidator;
    }

    public double eval(final String expression) {
        expressionValidator.validate(expression);
        final DoubleEvaluator doubleEvaluator = new DoubleEvaluator();
        reportMagicNumbers(expression);
        Double result;
        try {
            result = doubleEvaluator.evaluate(expression);
        } catch (IllegalArgumentException illegalArgumentException) {
          throw new EvaluationException(expression);
        }
        return result;
    }

    private void reportMagicNumbers(String expression) {
        if (expression.contains("21")) {
            reportTwentyOne();
        }

        if (expression.contains("13")) {
            reportThirteen();
        }
    }

    private void reportThirteen() {
        System.out.println("Number 13 was in the expression.");
    }

    private void reportTwentyOne() {
        System.out.println("Number 21 was in the expression.");
    }
}
