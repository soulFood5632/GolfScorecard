import java.util.List;
import java.util.Vector;

public class Polynomial {

    public static final int POLYNOMIAL_ORDER = 2;
    public static final int MAX_CONSTANT = 5;
    private final double[] constants;

    public Polynomial(double[] constantArr){
        constants = constantArr;
    }

    /**
     * Modifies the polynomial.
     * @param modifier A vector of the same size as the order of the Polynomial + 1
     */

    public void modifyPolynomial(Vector<Double> modifier){
        for(int index = 0; index < constants.length; index++){
            constants[index] += modifier.get(index);
        }
    }

    /**
     * Gets a new random polynomial.
     * @return An instance of a random polynomial.
     */
    public static Polynomial randomPolynomial() {
        double[] newConstants = new double[POLYNOMIAL_ORDER + 1];
        for(int i = 0; i <= POLYNOMIAL_ORDER; i++){
            newConstants[i] = Math.random() * MAX_CONSTANT - (double) MAX_CONSTANT / 2;
        }
        return new Polynomial(newConstants);
    }

    /**
     * Gets the polynomial with an epsilon increase in the specified coefficient Index
     * @param epsilon the epsilon increase
     * @param coefficientIndex the coefficient to change
     * @return An instance of Polynomial that's coefficient is increase by epsilon.
     */
    public Polynomial epsilonPoly(double epsilon, int coefficientIndex){
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
        for(int index = 0; index <= POLYNOMIAL_ORDER; index++){
            currValue += constants[index] * Math.pow(independentVariable, index);
        }

        return currValue;
    }


    /**
     * Gets the order of this polynomial
     * @return An int representing the order of this polynomial
     */
    public int getPolynomialOrder(){
        return POLYNOMIAL_ORDER;
    }


}
