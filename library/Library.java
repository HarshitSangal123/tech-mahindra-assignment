import java.util.*;
public class Library {
   
    public static void main(String args[]){
        Scanner sc=new Scanner(System.in);
        Book book[]={
            new Book("Ikigai", "Hector garcia and Francesc Miralles", 499),
            new Book("Death", "Sadhguru", 299),
            new Book("Lifes Amazing secret", "Gaur gopal Das", 259),
            new Book("Good Vibes Good lifes", "Vex king", 359),
            new Book("A girl in a room 105", "Chetan BHagat", 199)
        };
        System.out.println("Enter the book title");
        String searchItem=sc.nextLine();
        searchBook(searchItem,book);
    }
    public static void searchBook(String item,Book book[]){
       boolean found=false;
        for(Book b:book){
            if(b.title.equalsIgnoreCase(item)){
                b.display();
                found=true;
                break;
            }

        }

        if(found==false)
        System.out.println("Book Not Found");

    }
    
}
