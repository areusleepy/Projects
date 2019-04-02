
import java.util.ArrayList;


/** @author kyleklopfenstein
 * PRG/421
 * Due 11/6/17
 * Professor: MITCHELL WILLIAMS
 */
public class AnimalMaker {
    
ArrayList<String> obj = new ArrayList<>();


    private String color;
    private String awsome;
    private String swim ;

    public void obj(String c, String a, String s) {

        color = c;
        awsome = a;
        swim = s;
    }
    
    public void printData(){
        System.out.println("Color\tAwsome\tCan Swim");
        System.out.println(color + "\t" + awsome + "\t" + swim);
    }

}
