package Shape;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
public class HemiSphereTest {
	private HemiSphere hemiSphere;
	
	@Before
	public void setUp()
	{
		hemiSphere = new HemiSphere(3);
	}
	
	@Test
	public void testConstructor()
	{
		assertEquals("volume not calculated properly",4/3*Math.PI*Math.pow(hemiSphere.getRadius(), 3)/2,hemiSphere.getVolume(),0.1);
		assertEquals("area not calculated properly",3*Math.PI*hemiSphere.getRadius()*hemiSphere.getRadius(), hemiSphere.getArea(), 0.1);
	}
	
	@Test
	public void testEquals()
	{
		HemiSphere hs = new HemiSphere(5);
		hemiSphere.setRadius(5);
		assertEquals("set radius or equals is not implemented properly", hemiSphere, hs);
	}
}
