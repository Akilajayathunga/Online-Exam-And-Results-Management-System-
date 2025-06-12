package service;


import java.io.*;
import java.util.*;

import Module.Payment;

public class ExamPaymentService {
	private final File file = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\ExamPayments.txt");


    public void savePayment(Payment payment) {
        boolean newFile = !file.exists() || file.length() == 0;
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            if (newFile) {
                writer.write("Name, Email, Mobile, Exam, Price, Card Number, Expiry, CVV");
                writer.newLine();
            }

            String line = String.join(", ",
                payment.getName(),
                payment.getEmail(),
                payment.getMobile(),
                payment.getExam(),
                payment.getPrice(),
                payment.getCardNumber(),
                payment.getExpiryDate(),
                payment.getCvv()
            );

            writer.write(line);
            writer.newLine();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<Payment> getAllPayments() {
        List<Payment> list = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            reader.readLine(); // skip header
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",\\s*");
                if (parts.length >= 8) {
                    Payment ep = new Payment();
                    ep.setName(parts[0]);
                    ep.setEmail(parts[1]);
                    ep.setMobile(parts[2]);
                    ep.setExam(parts[3]);
                    ep.setPrice(parts[4]);
                    ep.setCardNumber(parts[5]);
                    ep.setExpiryDate(parts[6]);
                    ep.setCvv(parts[7]);
                    list.add(ep);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deletePayment(String email) {
        File inputFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\ExamPayments.txt");
        File tempFile = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\ExamPayments_temp.txt");

        boolean isDeleted = false;

        try (
            BufferedReader reader = new BufferedReader(new FileReader(inputFile));
            PrintWriter writer = new PrintWriter(new FileWriter(tempFile))
        ) {
            String line;
            String header = reader.readLine();
            writer.println(header); // keep header

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",\\s*");
                if (parts.length >= 2 && parts[1].equalsIgnoreCase(email)) {
                    isDeleted = true;
                    continue; // skip writing this line
                }
                writer.println(line);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        if (!inputFile.delete() || !tempFile.renameTo(inputFile)) {
            return false;
        }

        return isDeleted;
    }

   
}
