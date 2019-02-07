package Shape;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
public class ConeTest {
	private Cone cone;
	
	@Before
	public void setUp()
	{
		cone = new Cone(1,2);
	}
	
	@Test
	public void testConstructor()
	{
		assertEquals("Area was not properly found", Math.PI*Math.pow(cone.getRadius(), 2)+
				Math.PI*cone.getRadius()*Math.sqrt(Math.pow(cone.getRadius(), 2)+Math.pow(cone.getHeight(), 2)),cone.getArea(), 0.2);
		assertEquals("Volume was not properly calculated", Math.PI*cone.getRadius()*cone.getRadius()*cone.getHeight()/3, cone.getVolume(),0.1);
		assertEquals("Perimeter was not set to 0", 0, cone.getPerimeter(), 0);
	}
	
	@Test
	public void testEquals()
	{
		Cone c = new Cone(2,3);
		cone.setRadius(2);
		cone.setHeight(3);
		assertEquals("Equals or setters were not implemented properly", c, cone);
	}
}
