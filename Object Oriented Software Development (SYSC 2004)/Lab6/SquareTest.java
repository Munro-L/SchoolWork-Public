package Shape;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
public class SquareTest {
	private Square square;
	
	@Before
	public void setUp()
	{
		square = new Square(4);
	}
	
	@Test
	public void testConstructor()
	{
		assertEquals("perimeter was not properly calculated",16,square.getPerimeter(),0.01);
		assertEquals("volume was not set as 0",0, square.getVolume(),0);
	}
	@Test
	public void testEquals()
	{
		Square s = new Square(4);
		s.setArea(5);
		square.setArea(5);
		assertEquals("equals was not implemented properly",square, s);
	}
}
