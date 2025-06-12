package service;


import java.io.*;
import java.util.*;

import Module.Examiner;

public class QuestionService {
	private  final String FILE_DIR = "C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Questions";

	public void saveQuestion(Examiner question) {
	    File file = new File(FILE_DIR, question.getModel() + ".txt");

	    try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
	        String line = String.join("|",
	            question.getQuestionText().trim(),
	            question.getOptionA().trim(),
	            question.getOptionB().trim(),
	            question.getOptionC().trim(),
	            question.getOptionD().trim(),
	            question.getCorrectAnswer().trim()
	        );
	        writer.write(line);
	        writer.newLine();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}


	public List<Examiner> loadQuestionsByModel(String model) {
	    List<Examiner> questions = new ArrayList<>();
	    File file = new File("C:\\Users\\ASUS\\Desktop\\AnudaMalli\\Questions", model + ".txt");

	    try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
	        String line;
	        while ((line = reader.readLine()) != null) {
	            String[] parts = line.split("\\|");
	            if (parts.length == 6) {
	                Examiner q = new Examiner(model, parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
	                questions.add(q);
	            }
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return questions;
	}

}
