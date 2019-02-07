package accounts;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
public class AccountTest {
	public Account account;
	
	@Before
	public void setUp()
	{
		account = new Account("Justin", 15, 50);
	}
	
	@Test
	public void testGetters()
	{
		assertEquals("getBalance or balance type incorret", 50.0, account.getBalance(),0.1);
	}
	
	@Test
	public void testEquals()
	{
		assertEquals("equals not working properly", new Account("Justin", 15, 50), account);
	}
	
	@Test
	public void testWithdraw()
	{
		account.withdraw(-5);
		assertEquals("withdraw not working with negative numbers",account.getBalance(),50,0);
		account.withdraw(15);
		assertEquals("withdraw not working",account.getBalance(),35,0);
	}
	
	@Test
	public void testDeposit()
	{
		account.deposit(10);
		assertEquals("deposit not working", 60, account.getBalance(),0.5);
	}
	
	@Test
	public void testTransferTo()
	{
		Account temp = new Account("John", 20, 30);
		account.transferTo(null,15);
		assertEquals("not checking for null",account.getBalance() , 50 ,0);
		account.transferTo(temp, 15);
		assertEquals("transfer not withdrawing", account.getBalance(), 35, 0);
		assertEquals("transfer not depositing", temp.getBalance(), 45,0); 
	}
	
	@Test
	public void testBalanceAtMonthEnd()
	{
		assertEquals("not returning properly", account.balanceAtMonthEnd(), 50,0);
	}
}
