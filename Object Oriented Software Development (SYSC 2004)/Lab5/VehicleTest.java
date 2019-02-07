package vehicles;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by Charberg on 2/22/2017.
 */
public class VehicleTest {

    Vehicle v;

    @Before
    public void setUp() {
        v = new Vehicle(2, 4, 10, "RED");
    }

    @Test
    public void getNumOfTires() throws Exception {
        assertEquals(v.getColour(), "RED");
    }

    @Test
    public void setNumOfTires() throws Exception {
        v.setNumOfTires(1);
        assertEquals(v.getNumOfTires(), 1);
    }

    @Test
    public void getNumOfPassengers() throws Exception {
        assertEquals(v.getNumOfPassengers(), 4);
    }

    @Test
    public void setNumOfPassengers() throws Exception {
        v.setNumOfPassengers(2);
        assertEquals(v.getNumOfPassengers(), 2);
    }

    @Test
    public void getSpeed() throws Exception {
        assertEquals(v.getSpeed(), 10, 0);
    }

    @Test
    public void setSpeed() throws Exception {
        v.setSpeed(20);
        assertEquals(v.getSpeed(), 20, 0);
    }

    @Test
    public void getColour() throws Exception {
        assertEquals(v.getColour(), "RED");
    }

    @Test
    public void setColour() throws Exception {
        v.setColour("BLUE");
        assertEquals(v.getColour(), "BLUE");
    }

    @Test
    public void equals() throws Exception {
        assertEquals(v, new Vehicle(2, 4, 10, "RED"));
    }

    @Test
    public void turnRight() throws Exception {
        v.turnRight();
        assertEquals(15, v.getSpeed(), 0);
    }

    @Test
    public void turnLeft() throws Exception {
        v.turnLeft();
        assertEquals(12, v.getSpeed(), 0);
    }

}