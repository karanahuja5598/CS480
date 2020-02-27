import java.util.*;
import java.io.*;

public class CreateUser
{
   public static void main(String[] args)
  {
      try (Writer writer = new BufferedWriter(new OutputStreamWriter(
              new FileOutputStream("test.sql"), "utf-8")))
    {
     File f = new File("input.txt");
     Scanner in = new Scanner(new File("input.txt"));
     String input = in.nextLine();
     
        
        ////------------------------------------------------
        ////This is where you write your code to build the sql statement(s)
        ////------------------------------------------------
       writer.write("show databases;\n");
       writer.write("use mysql;\n");
       writer.write("select * from "+input+";\n");
        ////------------------------------------------------
        
        
      }
     catch(Exception e){}
  }
}