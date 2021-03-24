package util;

import java.security.MessageDigest;

public class SHA256 {
	
	public static String getSHA256(String input)  {
		String result = "";
		byte[] salt = "Hello! This is Salt.".getBytes();

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(salt); // MessageDigest가 SHA-256으로 암호화된 값을 들고 있음.

			byte[] bResult = md.digest();

			for (byte data : bResult) {
				System.out.print(data + " ");
			}
			System.out.println();

			StringBuffer sb = new StringBuffer();
			for (byte data : bResult) {
				sb.append(Integer.toString(data & 0xff, 16));
			}
			result = sb.toString();
			System.out.println(result);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
