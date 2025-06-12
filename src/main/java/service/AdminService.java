package service;



import java.io.*;
import java.util.*;

import Module.AdminDashboard;
import Module.Payment;

public class AdminService {
	

	private static final String FILE_PATH = "C:\\Users\\ASUS\\Desktop\\AnudaMalli\\AdminService.txt";
	private final File file = new File(FILE_PATH);

    public void addExam(AdminDashboard exam) {
        boolean newFile = !file.exists() || file.length() == 0;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            if (newFile) {
                writer.write(" Name, Subject, Description, DateTime, Duration, Marks, Status");
                writer.newLine();
            }

            String line = String.join(", ",

                exam.getName(),
                exam.getSubject(),
                exam.getDescription(),
                exam.getDateTime(),
                String.valueOf(exam.getDuration()),
                String.valueOf(exam.getMarks()),
                exam.getStatus()
            );

            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

	
	
    public List<AdminDashboard> getAllExams() {
        List<AdminDashboard> list = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            reader.readLine(); // skip header
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",\\s*");
                if (parts.length >= 7) { // Ensure there's enough data in each line
                    AdminDashboard ad = new AdminDashboard();
                    ad.setName(parts[0]); // Corrected to index 0
                    ad.setSubject(parts[1]); // Corrected to index 1
                    ad.setDescription(parts[2]); // Corrected to index 2
                    ad.setDateTime(parts[3]); // Corrected to index 3
                    ad.setDuration(Integer.parseInt(parts[4])); // Corrected to index 4
                    ad.setMarks(Integer.parseInt(parts[5])); // Corrected to index 5
                    ad.setStatus(parts[6]); // Corrected to index 6
                    list.add(ad);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        
        return list;
    }
    
    
    public boolean deleteExam(String name) {
        File inputFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\AdminService.txt");
        File tempFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\AdminService_temp.txt");

        boolean isDeleted = false;

        try (
            BufferedReader reader = new BufferedReader(new FileReader(inputFile));
            PrintWriter writer = new PrintWriter(new FileWriter(tempFile))
        ) {
            String line;
            String header = reader.readLine();
            if (header != null) {
                writer.println(header); // Write the header
            }

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",\\s*");
                if (parts.length >= 1) {
                    System.out.println("Checking: " + parts[0]);
                    if (parts[0].equalsIgnoreCase(name)) {
                        System.out.println("Deleting exam: " + name);
                        isDeleted = true;
                        continue; // Skip writing this line
                    }
                }
                writer.println(line);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        // Replace original file with updated one
        if (!inputFile.delete()) {
            System.out.println("Failed to delete original file.");
            return false;
        }
        if (!tempFile.renameTo(inputFile)) {
            System.out.println("Failed to rename temp file.");
            return false;
        }

        return isDeleted;
    }


}
