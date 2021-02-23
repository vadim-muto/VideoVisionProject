package progetto.application.utilities;

import org.springframework.security.crypto.bcrypt.BCrypt;

public class EncryptPassword {
	
	private static EncryptPassword instance = null;
	
	private EncryptPassword() {}
	
	public String generatePasswordCrypted(String originalPassword) {
		String pswCrypted = BCrypt.hashpw(originalPassword, BCrypt.gensalt(12));
		return pswCrypted;
	}
	
	public boolean checkPassword(String originalPassword, String pswCrypted) {
		return BCrypt.checkpw(originalPassword, pswCrypted);
	}
	
	public static EncryptPassword getInstance() {
		if (instance == null)
			instance = new EncryptPassword();
		return instance;
	}
}
