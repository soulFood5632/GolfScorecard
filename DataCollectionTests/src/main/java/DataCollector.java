import java.util.*;
import java.util.stream.Collectors;

public class DataCollector {


    private final Map<String, Map<Integer, Double>> trainingData;

    private final Map<String, Polynomial> regressionModels;

    private static final double EPSILON = 0.01;
    private static final double STEP_SIZE = 0.1;
    private static final double TOLERANCE = 0.9;

    public DataCollector(List<String> lieTypes){
        trainingData = new HashMap<>();
        regressionModels = new HashMap<>();

        for(String lieType: lieTypes){
            trainingData.put(lieType, new HashMap<>());
            regressionModels.put(lieType, Polynomial.randomPolynomial());
        }

    }

    /**
     * Get the identifier of this dataAnalyzer
     * @return A string representing this dataType
     */
    public Set<String> getLieTypes() {
        return trainingData.keySet();
    }

    /**
     * Adds another data element to this training dataset
     * @param lie A string that exists in this dataset
     * @param yardage a integer representing the yardage
     * @param expectedVal The expected value of the strokes to hole out from this
     *                    yardage.
     */
    public void addData(String lie, int yardage, double expectedVal){
        trainingData.get(lie).put(yardage, expectedVal);
    }

    public void runRegression(){

        for(String lieType: trainingData.keySet()) {
            Thread thread = new Thread(() -> {
                Map<Integer, Double> trainingSet = trainingData.get(lieType);
                double rSquared = calculateError(trainingSet, regressionModels.get(lieType));
                while(TOLERANCE > rSquared){
                    Vector<Double> gradient = findGradient(EPSILON, regressionModels.get(lieType), trainingSet);
                    gradient = gradient.stream().map(value -> value * STEP_SIZE).collect(Collectors.toCollection(Vector::new));
                    regressionModels.get(lieType).modifyPolynomial(gradient);
                    rSquared = calculateError(trainingSet, regressionModels.get(lieType));
                }
            });

            thread.start();
        }

    }

    /**
     * Calculates the R^2 error of this given regression model
     * @param trainingSet The training data set
     * @param regressionModel The provided regression model
     * @return The R^2 value of this regression model with the given dataset.
     */
    private double calculateError(Map<Integer, Double> trainingSet, Polynomial regressionModel){
        Set<Integer> valueSet = trainingSet.keySet();
        double sumSquaredRegression = valueSet.stream().
                map(yardage -> trainingSet.get(yardage) - regressionModel.calculateValue(yardage)).
                map(value -> Math.pow(value, 2)).
                reduce(0.0, Double::sum);

        double mean = valueSet.stream().
                map(trainingSet::get).
                reduce(0.0, Double::sum) / valueSet.size();

        double sumSquaredMean = valueSet.stream().
                map(yardage -> trainingSet.get(yardage) - mean).
                map(value -> Math.pow(value, 2)).
                reduce( 0.0, Double::sum);

        return 1 - sumSquaredRegression / sumSquaredMean;

    }

    /**
     * Finds the gradient of this current model
     * @param epsilon the epsilon to get the gradient from
     * @param regressionModel The current regression model
     * @param trainingData The trainingData currently being modelled
     * @return A vector representing a gradient of the function.
     * The nth entry of the vector corresponds to the nth coefficient's
     * derivative.
     */
    private Vector<Double> findGradient(double epsilon,
                                        Polynomial regressionModel,
                                        Map<Integer, Double> trainingData) {

        Vector<Double> gradientVector = new Vector<>();
        for(int index = 0; index < regressionModel.getPolynomialOrder(); index++){
            Polynomial epsilonPoly = regressionModel.epsilonPoly(epsilon, index);
            double epsilonDifference = calculateError(trainingData, regressionModel)
                    - calculateError(trainingData, epsilonPoly);
            gradientVector.add(epsilonDifference / epsilon);
        }

        return gradientVector;

    }

    public Map<String, Polynomial> getRegressionModels() {
        return regressionModels;
    }

    public static void main(String[] args) throws InterruptedException {


        String myString = "10 2.18 20 2.40 30 2.52 40 2.60 50 2.66 60 2.70 70 2.72 80 2.75 90 2.77 100 2.92 2.80 120 2.99 2.85 140 2.97 2.91 160 2.99 2.98 180 3.05 3.08 200 3.12 3.19 220 3.17 3.32 240 3.25 3.45 260 3.45 3.58 280 3.65 3.69 300 3.71 3.78 320 3.79 3.84 340 3.86 3.88 360 3.92 3.95 380 3.96 4.03 400 3.99 4.11 420 4.02 4.19 440 4.08 4.27 460 4.17 4.34 480 4.28 4.42 500 4.41 4.50 520 4.54 4.58 540 4.65 4.66 560 4.74 4.74 580 4.79 4.82 600 4.82 4.89";
        String otherData = "2.34 2.43 3.45 2.59 2.53 3.51 2.70 2.66 3.57 2.78 2.82 3.71 2.87 2.92 3.79 2.91 3.15 3.83 2.93 3.21 3.84 2.96 3.24 3.84 2.99 3.24 3.82 3.02 3.23 3.80 3.08 3.21 3.78 3.15 3.22 3.80 3.23 3.28 3.81 3.31 3.40 3.82 3.42 3.55 3.87 3.53 3.70 3.92 3.64 3.84 3.97 3.74 3.93 4.03 3.83 4.00 4.10 3.90 4.04 4.20 3.95 4.12 4.31 4.02 4.26 4.44 4.11 4.41 4.56 4.21 4.55 4.66 4.30 4.69 4.75 4.40 4.83 4.84 4.49 4.97 4.94 4.58 5.11 5.03 4.68 5.25 5.13 4.77 5.40 5.22 4.87 5.54 5.32 4.96 5.68 5.41 5.06 5.82 5.51 5.15 5.96 5.60 5.25 6.10 5.70";


        String[] topData = myString.split(" ");
        String[] bottomData = otherData.split(" ");

        DataCollector myDataSet = new DataCollector(List.of("tee", "fairway", "rough", "sand", "recovery"));


        for(int indexTop = 0, indexBottom = 0; indexBottom < bottomData.length;){
            int distance = Integer.parseInt(topData[indexTop++]);
            double tee;
            if(distance >= 100){
                tee = Double.parseDouble(topData[indexTop++]);
                myDataSet.addData("tee", distance, tee);
            }
            double fairway = Double.parseDouble(topData[indexTop++]);
            myDataSet.addData("fairway", distance, fairway);

            double rough = Double.parseDouble(bottomData[indexBottom++]);
            myDataSet.addData("rough", distance, rough);

            double sand = Double.parseDouble(bottomData[indexBottom++]);
            myDataSet.addData("sand", distance, sand);

            double recovery = Double.parseDouble(bottomData[indexBottom++]);
            myDataSet.addData("recovery", distance, recovery);
        }

        myDataSet.runRegression();



        Thread.sleep(1000);




    }
}
