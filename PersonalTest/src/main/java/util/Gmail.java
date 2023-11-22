package util;

import javax.mail.*;

public class Gmail extends Authenticator{
	
	@Override
	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("akflsqoxmf3@gmail.com", "nwrdfvhogcrgaata");
	}
	
}
