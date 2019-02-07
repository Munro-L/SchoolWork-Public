package vehicles;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by Charberg on 2/22/2017.
 */
public class MotorVehicleTest {

    MotorVehicle m;

    @Before
    public void setUp() {
        m = new MotorVehicle(2, 3, "RED", "ABC123", 10, 15);
    }

    @Test
    public void getLicensePlate() throws Exception {
        assertEquals("ABC123", m.getLicensePlate());
    }

    @Test
    public void setLicensePlate() throws Exception {
        m.setLicensePlate("AABBCC");
        assertEquals("AABBCC", m.getLicensePlate());
    }

    @Test
    public void getMaximumSpeed() throws Exception {
        assertEquals(15, m.getMaximumSpeed(), 0);
    }

    @Test
    public void setMaximumSpeed() throws Exception {
        m.setMaximumSpeed(30);
        assertEquals(30, m.getMaximumSpeed(), 0);
    }


    @Test
    public void equals() throws Exception {
        assertEquals(new MotorVehicle(2,3,"RED","ABC123",10,15), m);
    }

    @Test
    public void move() throws Exception {
        m.move(100);
        assertEquals(10, m.getSpeed(), 0);
        m.move(6);
        assertEquals(4, m.getSpeed(), 0);
        m.move(6);
        assertEquals(10, m.getSpeed(), 0);
    }

}