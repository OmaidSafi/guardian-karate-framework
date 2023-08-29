package api.utility.data;

public class GenerateData {

	public static String getEmail() {
		String prefix = "auto_email";
		String provider = "@tekschool.us";
		int random = (int) (Math.random() * 10000);
		String email = prefix + random + provider;
		return email;
	}


// Generate Random Phone number 10 digit and return String random phone number.

	public static String getPhoneNumber() {
		String phoneNumber ="2";
		for(int i = 0; i < 9;i++ ) {
			phoneNumber += (int) (Math.random() * 10);
		}
		return phoneNumber;
	}
	
	public static void main(String [] args) {
		String number = getPhoneNumber();
			System.out.println(number);
			System.out.println(number.length());
		}
	
	
	}
	

	
	
	
	
	
	
	
	
	
		