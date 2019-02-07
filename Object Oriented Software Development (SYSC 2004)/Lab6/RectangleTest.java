package Shape;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
public class RectangleTest {
	private Rectangle r;
	
	@Before
	public void setUp()
	{
		r = new Rectangle(2,4);
	}
	@Test
	public void testContructor()
	{
		assertEquals("Area was not properly calculated",8,r.getArea(), 0.01);
		assertEquals("Perimeter was not properly calculated",12,r.getPerimeter(), 0.01);
	}
	@Test
	public void testEquals()
	{
		Rectangle rectangle = new Rectangle(4,4);
		r.setLength(4);
		assertEquals("equals was not implemented properly, or setters do not change perimeter and area", rectangle, r);
	}
}
