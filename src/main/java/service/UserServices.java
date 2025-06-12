package service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import Module.UserReg;

public class UserServices {

	public void RegUser(UserReg reg) {
		File file = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Registration.txt");

		try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {

			if (file.length() == 0) {
				String header = "Email, Student Name, Qualification, Date of Birth, Address, City, Pin, Contact, Password, Confirm Password, Gender";
				writer.write(header);
				writer.newLine();
			}

			String userLine = String.join(", ", reg.getEmail(), reg.getStudentName(), reg.getQualification(),
					reg.getDob().toString(), reg.getAddress(), reg.getCity(), reg.getPin(), reg.getContact(),
					reg.getPassword(), reg.getConfirmPassword(), reg.getGender());

			writer.write(userLine);
			writer.newLine();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 🔍 Validates login by checking email and password from the file
	public boolean Validate(UserReg cus) {
		// 1️⃣ Define path to your registration file
		File file = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Registration.txt");

		try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
			String line;

			// 2️⃣ Skip header line (first row with field names)
			reader.readLine();

			// 3️⃣ Read line by line
			while ((line = reader.readLine()) != null) {
				// 4️⃣ Split line into parts using comma
				String[] parts = line.split(",\\s*");

				// 5️⃣ Check if line contains enough fields
				if (parts.length >= 10) {
					String email = parts[0]; // Email at index 0
					String password = parts[8]; // Password at index 8

					// 6️⃣ Compare with form input
					if (email.equalsIgnoreCase(cus.getEmail()) && password.equals(cus.getPassword())) {
						return true; // ✅ Match found
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace(); // Show any file read errors
		}

		return false; // ❌ No match found
	}

	public UserReg getOne(UserReg cus) {
		File file = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Registration.txt");

		try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
			String line;
			reader.readLine(); // skip header

			while ((line = reader.readLine()) != null) {
				String[] parts = line.split(",\\s*");

				if (parts.length >= 11 && parts[0].equalsIgnoreCase(cus.getEmail())) {
					UserReg user = new UserReg();
					user.setEmail(parts[0]);
					user.setStudentName(parts[1]);
					user.setQualification(parts[2]);

					java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
					java.util.Date parsedDate = sdf.parse(parts[3]);
					java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
					user.setDob(sqlDate);

					user.setAddress(parts[4]);
					user.setCity(parts[5]);
					user.setPin(parts[6]);
					user.setContact(parts[7]);
					user.setPassword(parts[8]);
					user.setConfirmPassword(parts[9]);
					user.setGender(parts[10]);

					return user;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public boolean updateUser(UserReg updatedUser) {
		File inputFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Registration.txt");
		File tempFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Registration_temp.txt");

		boolean isUpdated = false;

		try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
				PrintWriter writer = new PrintWriter(new FileWriter(tempFile))) {
			String line;
			String header = reader.readLine();
			writer.println(header); // Copy header

			while ((line = reader.readLine()) != null) {
				String[] parts = line.split(",\\s*");

				if (parts.length >= 11 && parts[0].equalsIgnoreCase(updatedUser.getEmail())) {
					// Write updated info
					writer.println(String.join(", ", updatedUser.getEmail(), updatedUser.getStudentName(),
							updatedUser.getQualification(), updatedUser.getDob().toString(), updatedUser.getAddress(),
							updatedUser.getCity(), updatedUser.getPin(), updatedUser.getContact(),
							updatedUser.getPassword(), updatedUser.getConfirmPassword(), updatedUser.getGender()));
					isUpdated = true;
				} else {
					// Copy original line
					writer.println(line);
				}
			}

			// Replace original file
			reader.close();
			writer.close();

			if (!inputFile.delete() || !tempFile.renameTo(inputFile)) {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return isUpdated;
	}

	public boolean deleteUser(String email) {
		File inputFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Registration.txt");
		File tempFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Registration_temp.txt");

		boolean isDeleted = false;

		try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
				PrintWriter writer = new PrintWriter(new FileWriter(tempFile))) {
			String line;
			String header = reader.readLine();
			writer.println(header); // Copy header

			while ((line = reader.readLine()) != null) {
				String[] parts = line.split(",\\s*");

				if (parts.length >= 1 && parts[0].equalsIgnoreCase(email)) {
					isDeleted = true; // Don't write this line
					continue;
				}

				writer.println(line); // Keep the rest
			}

			writer.close();
			reader.close();

			if (!inputFile.delete() || !tempFile.renameTo(inputFile)) {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return isDeleted;
	}

	public List<UserReg> getAllUsers() {

		File file = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Registration.txt");

		List<UserReg> list = new ArrayList<>();

		try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
			String line;
			reader.readLine(); // skip header

			while ((line = reader.readLine()) != null) {
				String[] parts = line.split(",\\s*");

				if (parts.length >= 11) {
					UserReg user = new UserReg();
					user.setEmail(parts[0]);
					user.setStudentName(parts[1]);
					user.setQualification(parts[2]);

					java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
					java.util.Date parsedDate = sdf.parse(parts[3]);
					java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
					user.setDob(sqlDate);

					user.setAddress(parts[4]);
					user.setCity(parts[5]);
					user.setPin(parts[6]);
					user.setContact(parts[7]);
					user.setPassword(parts[8]);
					user.setConfirmPassword(parts[9]);
					user.setGender(parts[10]);

					list.add(user);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
	public boolean deleteUser1(String email) {
		File inputFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Registration.txt");
		File tempFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Registration_temp.txt");

		boolean isDeleted = false;

		try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
				PrintWriter writer = new PrintWriter(new FileWriter(tempFile))) {
			String line;
			String header = reader.readLine();
			writer.println(header); // Copy header

			while ((line = reader.readLine()) != null) {
				String[] parts = line.split(",\\s*");

				if (parts.length >= 1 && parts[0].equalsIgnoreCase(email)) {
					isDeleted = true; // Don't write this line
					continue;
				}

				writer.println(line); // Keep the rest
			}

			writer.close();
			reader.close();

			if (!inputFile.delete() || !tempFile.renameTo(inputFile)) {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return isDeleted;
	}

}
