package Shape;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
public class ShapeTest {
	public Shape shape;
	@Before
	public void setUp() {
		shape = new Shape();
	}
	@Test
	public void testConstructor() {
		assertEquals("Area was not set to 0", 0, shape.getArea(), 0);
	}
	@Test
	public void testEquals()
	{
		Shape s = new Shape();
		s.setArea(5);
		shape.setArea(5);
		
		assertEquals("equals was not implemented properly",shape, s);
	}
}
