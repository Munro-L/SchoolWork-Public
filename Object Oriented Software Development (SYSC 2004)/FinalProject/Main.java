package main;
import java.util.*;

public class Main {
	
	public static void main(String [] args) {
		String seq1 = null;
		String seq2 = null;
		double matchScore = 0;
		double gapPen = 0;
		double mismatchPen = 0;
		Scanner userEntry = new Scanner(System.in);
		int i = 0;
		boolean error;		//initialized to true to make sure we got into the loop the first time	
		boolean exit = false;
//		String response;
		int selection;
		boolean menu = true;
		
		while (exit == false) {
		
			//takes in first sequence and checks for bullshit
			error = true;
			while (error == true) {
				error = false;
				i = 0;
				System.out.println("Enter DNA Sequence 1: "); 
				seq1 = userEntry.nextLine();
				seq1 = seq1.toUpperCase();
				if (seq1.length() == 0) {	//makes sure the user actually entered something
					error = true;
					System.out.println("Blank input detected: Please enter a valid sequence");
					continue;
				}
				while(i < seq1.length()) {
					if (seq1.charAt(i) != 'A' && seq1.charAt(i) != 'C' && seq1.charAt(i) != 'T' && seq1.charAt(i) != 'G') {
						System.out.println("The entered string is not a valid sequence. Only upper/lower case A, C, T or Gs are allowed.");
						error = true;
						break;
					}
					i++;
				}
			}
			
			error = true;	//to make sure we got into the loop the first time
			i = 0;	//reset i to be used again
			while (error == true) {
				error = false;
				i = 0;
				System.out.println("Enter DNA Sequence 2: "); 
				seq2 = userEntry.nextLine();
				seq2 = seq2.toUpperCase();
				if (seq2.length() == 0) {	
					error = true;
					System.out.println("Blank input detected: Please enter a valid sequence");
					continue;
				}
				while(i < seq2.length()) {
					if (seq2.charAt(i) != 'A' && seq2.charAt(i) != 'C' && seq2.charAt(i) != 'T' && seq2.charAt(i) != 'G') {
						System.out.println("The entered string is not a valid sequence. Only upper/lower case A, C, T or Gs are allowed.");
						error = true;
						break;
					}
					i++;
				}
			}
			
	
			
			//takes in entry for matchScore
			error = true;
			userEntry.useLocale(Locale.US);		//sets locale to make sure we are using points, not commas in our doubles
			while (error == true) {
				error = false;
				System.out.println("Enter the score associated with a match: ");
				if (userEntry.hasNextDouble()){		//checks if entry is a number, before we try to assign it
					matchScore = userEntry.nextDouble();
				} else {	
					error = true;
					System.out.println("A number was not entered. Please enter a valid interger or double.");
					userEntry.nextLine();
					continue;
					
				}
			}
			
			
			userEntry.nextLine();
			
			//takes in entry for gap penalty
			error = true;
			while (error == true) {
				error = false;
				System.out.println("Enter the penalty associated with a gap (should be negative): ");
				if (userEntry.hasNextDouble()){
					gapPen = userEntry.nextDouble();
				} else {	
					error = true;
					System.out.println("A number was not entered. Please enter a valid interger or double.");
					userEntry.nextLine();
					continue;
					
				}
			}
			
			userEntry.nextLine();
			
			//takes in entry for mismatch
			error = true;
			while (error == true) {
				error = false;
				System.out.println("Enter the penalty associated with a mismatch (should be negative): ");
				if (userEntry.hasNextDouble()){
					mismatchPen = userEntry.nextDouble();
				} else {	
					error = true;
					System.out.println("A number was not entered. Please enter a valid interger or double.");
					userEntry.nextLine();
					continue;
					
				}
			}
			
			Strand strand1 = new Strand("First", seq1);
			Strand strand2 = new Strand("Second", seq2);
			DNA dna = new DNA(strand1, strand2);
			Alignment alignment = new Alignment(dna, matchScore, mismatchPen, gapPen);
			alignment.computeAlignments();
			
			menu = true;
			while (menu == true) {
				
				System.out.println("1) Print Sequences");
				System.out.println("2) Print uninitialized matrix");
				System.out.println("3) Print Completed Matrix");
				System.out.println("4) Print one alignment");
				System.out.println("5) Print Optimal Alignments");
				System.out.println("6) Enter 2 new sequences (restart)");
				System.out.println("7) Exit");
				
			
				userEntry.nextLine();
				
				//takes in entry for menu
				error = true;
				while (error == true) {
					error = false;
					System.out.println("Enter a menu selection: ");
					if (userEntry.hasNextInt()){
						selection = userEntry.nextInt();
						if (selection > 7 || selection <= 0) {
							error = true;
							System.out.println("A valid menu item was not selected.");
							userEntry.nextLine();
							continue;
						}
						//execute whatever the user selected
						switch (selection) {
							case 1: selection = 1;
								System.out.println(seq1);
								System.out.println(seq2);
								break;
								
							case 2: selection = 2;
								alignment.printInitializedMatrix();
								break;
							
							case 3: selection = 3;
								alignment.printCompletedMatrix();
								break;
							
							case 4: selection = 4;
								int index;
								error = true;
								while (error == true) {
									error = false;
									System.out.println("Which index do you want to see the alignment for? ");
									if (userEntry.hasNextInt()){
										index = userEntry.nextInt();
										alignment.printOneOptimalAlignment(index);
										break;
									} else {	
										error = true;
										System.out.println("A number was not entered. Please enter a valid interger.");
										userEntry.nextLine();
										continue;
									}
								}
								break;
							
							case 5: selection = 5;
								alignment.printAllOptimalAlignments();
								break;
							
							case 6: selection = 6;
								userEntry.nextLine();
								menu = false;
								break;
							
							case 7: selection = 7;
								userEntry.close();	//no longer need the scanner
								System.out.println("Exiting...");
								System.out.println("Thank you for using DNASequencer *Sexy robot voice*");
								System.exit(0);
						}
						
						
					} else {	
						error = true;
						System.out.println("A valid menu item was not selected.");
						userEntry.nextLine();
						continue;
					}
				}
			}
			

			
			//quick testing		
	//		System.out.println("*DEBUG*" + seq1);
	//		System.out.println("*DEBUG*" + seq2);
	//		System.out.println("*DEBUG*" + matchScore);
	//		System.out.println("*DEBUG*" + gapPen);
	//		System.out.println("*DEBUG*" + mismatchPen);
			
//			userEntry.nextLine();
//			
//			System.out.println("Would you like to quit? y/n");
//			response = userEntry.next();
//			if (response.equals("y") || response.equals("Y")) {
//				exit = true;
//			}
//			
//			userEntry.nextLine();
			
		}
//		userEntry.close();	//no longer need the scanner
//		System.out.println("Exiting...");
//		System.out.println("Thank you for using DNASequencer *Sexy robot voice*");
	}
}
