package Shape;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
public class CircleTest {
	private Circle circle;
	
	@Before
	public void setUp()
	{
		circle = new Circle(5);
	}
	
	@Test
	public void testConstructor()
	{
		assertEquals("area was not properly calculated", Math.PI*circle.getRadius()*circle.getRadius(),circle.getArea(), 0.05);
		assertEquals("perimeter was not properly calculated", 2*Math.PI*circle.getRadius(),circle.getPerimeter(), 0.05);
	}
	
	@Test
	public void testEquals()
	{
		Circle c = new Circle(3);
		circle.setRadius(3);
		assertEquals("equals or setters not implemented properly", c, circle);
				
	}
}
