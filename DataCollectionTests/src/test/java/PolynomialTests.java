import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

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
    public void


}
