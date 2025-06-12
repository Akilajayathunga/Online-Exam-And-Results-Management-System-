package service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import Module.ContactMessage;

public class ContactService {



	    private final String CONTACT_FILE = "C:\\Users\\ASUS\\Desktop\\AnudaMalli\\ContactUs.txt";

	    // ➕ Add message
	    public void addMessage(ContactMessage msg) {
	        try (BufferedWriter writer = new BufferedWriter(new FileWriter(CONTACT_FILE, true))) {
	            if (new File(CONTACT_FILE).length() == 0) {
	                writer.write("Name,Email,Subject,Message");
	                writer.newLine();
	            }
	            writer.write(String.join(", ", msg.getName(), msg.getEmail(), msg.getSubject(), msg.getMessage()));
	            writer.newLine();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    
	    public List<ContactMessage> getAllMessages() {
	        List<ContactMessage> messages = new ArrayList<>();
	        File file = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\ContactUs.txt");

	        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
	            String line;
	            reader.readLine(); // Skip header

	            while ((line = reader.readLine()) != null) {
	                String[] parts = line.split(",\\s*");
	                if (parts.length >= 4) {
	                    ContactMessage msg = new ContactMessage();
	                    msg.setName(parts[0]);
	                    msg.setEmail(parts[1]);
	                    msg.setSubject(parts[2]);
	                    msg.setMessage(parts[3]);
	                    messages.add(msg);
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return messages;
	    }

	    
	    
	    
	   
	    // ❌ Delete message by email
	    public boolean deleteMessage(String email) {
	        File inputFile = new File(CONTACT_FILE);
	        File tempFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\ContactUs_temp.txt");
	        boolean isDeleted = false;

	        try (
	            BufferedReader reader = new BufferedReader(new FileReader(inputFile));
	            PrintWriter writer = new PrintWriter(new FileWriter(tempFile))
	        ) {
	            String line;
	            String header = reader.readLine();
	            writer.println(header);

	            while ((line = reader.readLine()) != null) {
	                String[] parts = line.split(",\\s*");
	                if (parts.length >= 2 && parts[1].equalsIgnoreCase(email)) {
	                    isDeleted = true;
	                    continue;
	                }
	                writer.println(line);
	            }

	            reader.close();
	            writer.close();

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
