public class Student{
    private String name;
    private int roll;
    private double marks;

    Student(String name,int roll,double marks){
        this.name=name;
        this.roll=roll;
        this.marks=marks;
    }
    public String getName() {
        return name;
    }

    public int getRollNumber() {
        return roll;
    }

    public double getMarks() {
        return marks;
    }

    // Setter methods
    public void setName(String name) {
        this.name = name;
    }

    public void setRollNumber(int  roll) {
        this.roll = roll;
    }

    public void setMarks(double marks) {
        this.marks = marks;
    }
    public void display(){
        System.out.println("The name of the Student is:- "+name);
        System.out.println("The roll number of the Student is:- "+roll);
        System.out.println("The marks out of 100 of the Student is:- "+marks);
    }
}