package Shape;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
public class TriangleTest {

	private Triangle triangle;
	
	@Before
	public void setUp()
	{
		triangle = new Triangle(2,2,3,4);
	}
	
	@Test
	public void testConstructor()
	{
		assertEquals("area was not properly calculated", triangle.getBase()*triangle.getHeight()/2, triangle.getArea(), 0.1);
		assertEquals("perimeter was not properly calculated",triangle.getSide1() + triangle.getSide2() + triangle.getBase(), triangle.getPerimeter(), 0.01);
	}
	
	@Test
	public void testEquals()
	{
		Triangle t = new Triangle(1,2,3,4);
		triangle.setSide1(1);
		assertEquals("equals was not implemented properly", t, triangle);
		Triangle temp = new Triangle(1,2,3,3);
		triangle.setHeight(3);
		assertEquals("equals was not implemented properly", temp, triangle);
	}
}
