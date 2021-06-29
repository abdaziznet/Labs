package belajar.unit.test;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

@DisplayName("Scenario test untuk kalkulator")
public class CalculatorTest {
    private Calculator calculator = new Calculator();

    @Test
    @DisplayName("test add sukses")
    public void testAddSuccess()
    {
        var result = calculator.add(40,20);
        assertEquals(60,result);
    }

    @Test
    public void testDivideSuccess()
    {
        var result = calculator.divide(20,5);
        assertEquals(4,result);
    }

    @Test
    public void testDivideError()
    {
        assertThrows(IllegalArgumentException.class, ()-> {
            calculator.divide(20,0);
        });
    }

}
