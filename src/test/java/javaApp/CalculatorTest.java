package javaApp;
import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class CalculatorTest{
    @Test
    public void additionTest1(){
        long output = Calculator.add(-5, 5);
        assertEquals(0, output);
        
    }
    @Test
    public void additionTest2(){
        long output = Calculator.add(-5, -5);
        assertEquals(-10, output);
        
    }
    @Test
    public void additionTest3(){
        long output = Calculator.add(5, 5);
        assertEquals(10, output);
        
    }
    @Test
    public void subtractionTest1(){
        long output = Calculator.sub(1, 9);
        assertEquals(-8, output);
        
    }
    @Test
    public void subtractionTest2(){
        long output = Calculator.sub(-1, -9);
        assertEquals(8, output);
        
    }
    @Test
    public void subtractionTest3(){
        long output = Calculator.sub(9, 9);
        assertEquals(0, output);
        
    }
    @Test
    public void multiplicationTest1(){
        long output = Calculator.mul(5, -5);
        assertEquals(-25, output);
        
    }
    @Test
    public void multiplicationTest2(){
        long output = Calculator.mul(5, 0);
        assertEquals(0, output);
        
    }
    @Test
    public void multiplicationTest3(){
        long output = Calculator.mul(5, 1);
        assertEquals(5, output);
        
    }
    @Test
    public void divisionTest1(){
        double output = Calculator.div(10, 5);
        assertEquals(2, output, 2);
    }
    @Test(expected = IllegalArgumentException.class)
    public void divisionTest2(){
        int a = 15; int b = 0;
        Calculator.div(a, b);
    }
}
