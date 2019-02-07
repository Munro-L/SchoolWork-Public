package Shape;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;

import javafx.scene.shape.Cylinder;
public class CylinderTest {
	private Cylinder cylinder;
	
	@Before
	public void setUp()
	{
		cylinder = new Cylinder(5,6);
	}
	
	@Test
	public void testConstructor()
	{
		assertEquals("volume was not properly calculated",Math.PI*cylinder.getRadius()*cylinder.getRadius()*cylinder.getHeight(),cylinder.getVolume(),0.1);
		assertEquals("area was not properly calculated",2*Math.PI*cylinder.getRadius()*cylinder.getHeight() 
				+ 2*Math.PI*cylinder.getRadius()*cylinder.getRadius(),cylinder.getArea(),0.1);
	}
	
	@Test
	public void testEquals()
	{
		Cylinder c = new Cylinder(4,5);
		cylinder.setRadius(4);
		cylinder.setHeight(5);
		assertEquals("equals or setters not properly implemented", c, cylinder);
	}
	
}
