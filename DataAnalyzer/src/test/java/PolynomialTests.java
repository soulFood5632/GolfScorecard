

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Vector;

public class PolynomialTests {

    @Test
    public void testMakeNewPolynomial(){
        double[] myPolyArr = {0.1, 0.2, 0.1};
        Polynomial polynomial = new Polynomial(myPolyArr);

        Assertions.assertEquals(2, polynomial.getPolynomialOrder());
        Assertions.assertEquals(0.4, polynomial.calculateValue(1), 0.01);
        Assertions.assertEquals(0.1, polynomial.calculateValue(0), 0.01);
        Assertions.assertEquals(0.0, polynomial.calculateValue(-1), 0.01);
    }

    @Test
    public void testModifiedPolynomial(){
        double[] myPolyArr = {1, 7, 2};
        Polynomial polynomial = new Polynomial(myPolyArr);

        Vector<Double> vectorModifier = new Vector<>();

        vectorModifier.add(0.0);
        vectorModifier.add(1.0);
        vectorModifier.add(2.0);


        polynomial.modifyPolynomial(vectorModifier);

        Assertions.assertEquals(1, polynomial.calculateValue(0), 0.01);
        Assertions.assertEquals(13, polynomial.calculateValue(1), 0.01);

    }

    @Test
    public void testEpsilonChange(){
        double[] myPolyArr = {1, 0, 1, 0, 2, 0, 1};
        Polynomial polynomial = new Polynomial(myPolyArr);

        Polynomial epsilonAddition = polynomial.epsilonPoly(2.0, 2);
        Assertions.assertEquals(6, epsilonAddition.getPolynomialOrder());
        Assertions.assertEquals(7, epsilonAddition.calculateValue(1), 0.01);
        epsilonAddition = polynomial.epsilonPoly(-1.0, 0);
        Assertions.assertEquals(0, epsilonAddition.calculateValue(0), 0.01);
    }

    @Test
    public void testRandoms(){
        for(int i = 0; i < 50; i++) {
            Polynomial polynomial = Polynomial.randomPolynomial();
            Assertions.assertEquals(0, polynomial.calculateValue(0), 2.5);
        }
    }




}
