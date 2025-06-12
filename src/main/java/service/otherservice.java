package service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

public class otherservice {

    private final String filePath = "C:\\Users\\ASUS\\Desktop\\AnudaMalli\\adminlogin.txt";

    public boolean validateLogin(String email, String password) {
        File file = new File(filePath);

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;

            // Skip header line
            reader.readLine();

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",\\s*");

                if (parts.length >= 2) {
                    String fileEmail = parts[0];
                    String filePassword = parts[1];

                    if (email.equalsIgnoreCase(fileEmail) && password.equals(filePassword)) {
                        return true; // ✅ Match found
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false; // ❌ No match
    }
    
    
    private final String file1Path = "C:\\Users\\ASUS\\Desktop\\AnudaMalli\\stafflogin.txt";

    public boolean validateLogin1(String email, String password) {
        File file = new File(file1Path);

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;

            // Skip header line
            reader.readLine();

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",\\s*");

                if (parts.length >= 2) {
                    String fileEmail = parts[0];
                    String filePassword = parts[1];

                    if (email.equalsIgnoreCase(fileEmail) && password.equals(filePassword)) {
                        return true; // ✅ Match found
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false; // ❌ No match
    }
}
