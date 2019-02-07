package Shape;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
public class HollowCylinderTest {
	private HollowCylinder hc;
	
	@Before
	public void setUp()
	{
		hc = new HollowCylinder(4,2,1);
	}
	
	@Test
	public void testConstructor()
	{
		assertEquals("volume was not properly calculated",
				Math.PI*(hc.getOuterRadius()*hc.getOuterRadius()-hc.getInnerRadius()*hc.getInnerRadius())*hc.getHeight(), hc.getVolume(), 0.1);
		assertEquals("area was not properly calculated",2*Math.PI*(hc.getOuterRadius()+hc.getInnerRadius())*hc.getHeight(),hc.getArea(), 0.1);
	}
	
	@Test
	public void testEquals()
	{
		HollowCylinder hollowCylinder = new HollowCylinder(3,2,1);
		hc.setOuterRadius(3);
		assertEquals("equals or setter was not implemented properly", hc, hollowCylinder);
	}
}
