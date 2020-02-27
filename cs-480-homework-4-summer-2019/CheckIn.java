import java.util.*;
import java.io.*;

public class CheckIn
{
   public static void main(String[] args)
  {
      try (Writer writer = new BufferedWriter(new OutputStreamWriter(
              new FileOutputStream("test.sql"), "utf-8")))
    {
     File f = new File("input.txt");
     Scanner in = new Scanner(new File("input.txt"));
     String input = in.nextLine();
     //File outputfile = File.createNewFile("CheckIn.sql");
     
        
        ////------------------------------------------------
        ////This is where you write your code to build the sql statement(s)
        ////------------------------------------------------
       writer.write("show databases;\n");
       writer.write("use mysql;\n");
       writer.write("select * from "+input+";\n");
        ////------------------------------------------------
        
        
      }
     catch(Exception e){}
     //outputfile.write("INSERT INTO CheckIn VALUES("+args[0]+","+args[1]+"))");
     //outputFile.save
  }
}