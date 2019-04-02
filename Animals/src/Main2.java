
/** @author kyleklopfenstein
 * PRG/421
 * Due 11/6/17
 * Professor: MITCHELL WILLIAMS
 */
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class Main2 {

    public static void main(String[] args) throws IOException {

        ArrayList<String> animals = new ArrayList<>();  //creates arrayList

        // ArrayList<String> obj = new ArrayList<>();
        Scanner input = new Scanner(System.in);     // creates scanner
        int choice = 0; // initilizes input to 0
        //char exit = '2';

        while (choice < 1 || choice > 3) {          //while loop will run while choice is between 1 and 2

            System.out.println("");
            System.out.println("Select an option?");         // menu for user
            System.out.println("");
            System.out.println("Add an animal:.........................1");
            System.out.println("View list of animals:................. 2");
            System.out.println("Exit program:......................... 3");
            System.out.println("Exit program and save data to file.....4");
            choice = input.nextInt();            // user input

            switch (choice) {

                case 1:                             //option to enter animal to array list
                    System.out.println("");
                    System.out.println("Please enter name of animal");
                    animals.add(input.next());
                    System.out.println("Please enter the color of the animal:");
                    String color = input.next();
                    System.out.println("Is the animal awsome:");
                    String awsome = input.next();
                    System.out.println("Can the animal swim?");
                    String swim = input.next();
                    choice = 0;
                    break;
                case 2:
                    System.out.println("");             //option to show array list
                    System.out.println("Here is a list of all the animals.");
                    System.out.println("");
                    System.out.println(animals);
                    // System.out.println(printData.obj);
                    choice = 0;
                    break;

                case 3:
                    System.out.println("");             //option to terminate program
                    System.out.println("Program Terminated...Have a good day!");
                    System.exit(0);

                case 4:

                    FileWriter writer = new FileWriter("output.txt");
                    for (String str : animals) {
                        writer.write(str);
                    }
                    writer.close();
                    System.out.println("            Program Terminated");
                    System.out.println("Data was writen to file 'output.txt' Have a good day!");
                    System.exit(0);
                //default:                                //option to limit some errors
                //System.out.println("Incorect Input Try Again");
                //choice = 0;
                // break;

            }
        }

    }
}
