package Module;

public class Examiner {

	private String model;
	private String questionText;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private String correctAnswer;

	// Constructors
	public Examiner(String model, String questionText, String optionA, String optionB, String optionC, String optionD,
			String correctAnswer) {
		this.model = model;
		this.questionText = questionText;
		this.optionA = optionA;
		this.optionB = optionB;
		this.optionC = optionC;
		this.optionD = optionD;
		this.correctAnswer = correctAnswer;
	}

	// Getters
	public String getModel() {
		return model;
	}

	public String getQuestionText() {
		return questionText;
	}

	public String getOptionA() {
		return optionA;
	}

	public String getOptionB() {
		return optionB;
	}

	public String getOptionC() {
		return optionC;
	}

	public String getOptionD() {
		return optionD;
	}

	public String getCorrectAnswer() {
		return correctAnswer;
	}

}
