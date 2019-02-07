package Shape;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
public class SphereTest {
	private Sphere sphere;
	
	@Before
	public void setUp()
	{
		sphere = new Sphere(3);
	}
	
	@Test
	public void testConstructor()
	{
		assertEquals("area was not properly calculated",4.0*Math.PI*sphere.getRadius()*sphere.getRadius(), sphere.getArea(), 0.1);
		assertEquals("volume was not properly calculated", 4.0/3.0*Math.PI*Math.pow(sphere.getRadius(), 3), sphere.getVolume(), 0.1);
		assertEquals("perimeter was not set to 0", 0 , sphere.getPerimeter(), 0);
	}
	@Test
	public void testEquals()
	{
		Sphere s = new Sphere(2);
		sphere.setRadius(2);
		assertEquals("equals or setRadius was not implemented properly", s, sphere);
	}
}
