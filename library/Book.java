
public class Book{
    String title;
    String author;
    int price;

    Book(String title,String author,int price){
        this.title=title;
        this.author=author;
        this.price=price;
    }

   public void display(){
    System.out.println("Title :"+title+" Author : "+author+ " Price : "+price);
   }

}