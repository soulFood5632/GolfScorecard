import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataCollectorTests {

    private static final String type = "green";
    private static DataCollector dataCollector;

    @BeforeEach
    public void setUpData(){
        dataCollector = new DataCollector(List.of(type));
    }



    @Test
    public void testError() {
        Map<Integer, Double> trainingSet = new HashMap<>(){
            {
                put(0, 1.0);
                put(1, 2.0);

            }
        };

        double[] model = {1, 1};

        Polynomial bestFitModel = new Polynomial(model);

        Assertions.assertEquals(1, DataCollector.calculateError(trainingSet, bestFitModel), 0.001);

        bestFitModel = bestFitModel.epsilonPoly(1, 1);

        double expectedValue = 1 - 1/0.5;

        Assertions.assertEquals(expectedValue, DataCollector.calculateError(trainingSet, bestFitModel));

    }


    @Test
    public void testDataInput() throws InterruptedException {
        dataCollector.addData(type, 0, 1);
        dataCollector.addData(type, 1, 2);
        dataCollector.addData(type, 2, 4);

        dataCollector.runRegression();

        Polynomial bestFitModel = dataCollector.getRegressionModels().get(type);

        Thread.sleep(5000);

        System.out.println(bestFitModel.getPolynomial());

        Assertions.assertEquals(1, bestFitModel.calculateValue(0), 0.25);
        Assertions.assertEquals(2, bestFitModel.calculateValue(1), 0.25);
        Assertions.assertEquals(4, bestFitModel.calculateValue(2), 0.25);
    }


}
