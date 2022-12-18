import java.util.List;

public class Polynomial {

    public static final int POLYNOMIAL_ORDER = 7;
    public static final int MAX_CONSTANT = 5;
    double[] constants;

    public Polynomial(double[] constantArr){
        constants = constantArr;
    }

    public static Polynomial randomPolynomial() {
        double[] newConstants = new double[POLYNOMIAL_ORDER];
        for(int i = 0; i < POLYNOMIAL_ORDER; i++){
            newConstants[i] = Math.random() * MAX_CONSTANT;
        }
        return new Polynomial(newConstants);
    }

    public Polynomial epsilonPoly(int epsilon, int coefficientIndex){
        double[] positiveEpsilonConstants = constants.clone();
        double currentValue = positiveEpsilonConstants[coefficientIndex];
        positiveEpsilonConstants[coefficientIndex] = currentValue + epsilon;

        return new Polynomial(positiveEpsilonConstants);
    }

    /**
     * Calculates the value of this polynomial at the value given
     * @param independentVariable the value to plug into this polynomial.
     * @return a double representing the value of f(x).
     */

    public double calculateValue(int independentVariable){
        double currValue = 0;
        for(int index = 0; index < POLYNOMIAL_ORDER; index++){
            currValue += constants[index] * Math.pow(independentVariable, index);
        }

        return currValue;
    }


}
