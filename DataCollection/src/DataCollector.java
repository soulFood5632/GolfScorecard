import java.util.*;
import java.util.stream.Collectors;

public class DataCollector {


    private Map<String, Map<Integer, Double>> trainingData;

    public DataCollector(List<String> lieTypes){
        trainingData = new HashMap<>();

        for(String lieType: lieTypes){
            trainingData.put(lieType, new HashMap<>());
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

        Thread thread1 = new Thread(() -> {


        });
    }



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
     * @param epsilon
     * @return
     */

    private Vector<Double> findGradient(int epsilon,
                                        Polynomial regressionModel,
                                        Map<Integer, Double> trainingData) {



    }



    public static void main(String[] args){


        String myString = "10 2.18 20 2.40 30 2.52 40 2.60 50 2.66 60 2.70 70 2.72 80 2.75 90 2.77 100 2.92 2.80 120 2.99 2.85 140 2.97 2.91 160 2.99 2.98 180 3.05 3.08 200 3.12 3.19 220 3.17 3.32 240 3.25 3.45 260 3.45 3.58 280 3.65 3.69 300 3.71 3.78 320 3.79 3.84 340 3.86 3.88 360 3.92 3.95 380 3.96 4.03 400 3.99 4.11 420 4.02 4.19 440 4.08 4.27 460 4.17 4.34 480 4.28 4.42 500 4.41 4.50 520 4.54 4.58 540 4.65 4.66 560 4.74 4.74 580 4.79 4.82 600 4.82 4.89";
        String otherData = "2.34 2.43 3.45 2.59 2.53 3.51 2.70 2.66 3.57 2.78 2.82 3.71 2.87 2.92 3.79 2.91 3.15 3.83 2.93 3.21 3.84 2.96 3.24 3.84 2.99 3.24 3.82 3.02 3.23 3.80 3.08 3.21 3.78 3.15 3.22 3.80 3.23 3.28 3.81 3.31 3.40 3.82 3.42 3.55 3.87 3.53 3.70 3.92 3.64 3.84 3.97 3.74 3.93 4.03 3.83 4.00 4.10 3.90 4.04 4.20 3.95 4.12 4.31 4.02 4.26 4.44 4.11 4.41 4.56 4.21 4.55 4.66 4.30 4.69 4.75 4.40 4.83 4.84 4.49 4.97 4.94 4.58 5.11 5.03 4.68 5.25 5.13 4.77 5.40 5.22 4.87 5.54 5.32 4.96 5.68 5.41 5.06 5.82 5.51 5.15 5.96 5.60 5.25 6.10 5.70";


        String[] topData = myString.split(" ");
        String[] bottomData = otherData.split(" ");

        for(int indexTop = 0, indexBottom = 0; indexBottom < bottomData.length;){
            int distance = Integer.parseInt(topData[indexTop++]);
            double tee;
            if(distance >= 100){
                tee = Double.parseDouble(topData[indexTop++]);
            }
            double fairway = Double.parseDouble(topData[indexTop++]);
            double rough = Double.parseDouble(bottomData[indexBottom++]);
            double sand = Double.parseDouble(bottomData[indexBottom++]);
            double recovery = Double.parseDouble(bottomData[indexBottom++]);

        }


    }
}
