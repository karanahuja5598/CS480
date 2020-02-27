import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.Scanner;
import java.util.ArrayList;

public class StockUser
{
    // code taken from https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-usagenotes-connect-drivermanager.html
    // 
    public static void main(String[] args) {
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      int numRows = -1;
      int userInput = -1;
      Scanner input = new Scanner(System.in);
      String accountName = "";
      float userInput2 = -1;
      float userInput3 = -1;
      int userInput4 = -1;
      ArrayList<String> companyList = new ArrayList<String>();
      ArrayList<Integer> companyList2 = new ArrayList<Integer>();

      try {
            conn =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost/StockMarket?" +
                            "user=student&password=password");

            // Do something with the Connection
            stmt = conn.createStatement();
            //rs = stmt.executeQuery("SHOW TABLES;");
            if (rs!=null){
                while(rs.next())
                {
                    System.out.println(rs.getString(1));

                }
            }

            System.out.print("What is the name of your account? ");
            accountName = input.nextLine();
            System.out.println();
        
            while(userInput!=6)
            {
              System.out.print("Which operation would you like to perform (1-6)? ");
              userInput = input.nextInt();
              System.out.println();
              switch(userInput)
              {
                case 1: String sql = String.format("Select Balance from Person WHERE AccountName = '%s';", accountName);
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);
                        if (rs!=null){
                        System.out.println("Balance");
                        while(rs.next())
                        {
                          System.out.println(rs.getString("Balance"));

                        }
                        }
                        break;
                case 2: String sql2 = String.format("SELECT CompanyName, SUM(Quantity) " +
                    "FROM (Stock JOIN Company ON Stock.CompanyID = Company.CompanyID) " +
                    "JOIN Person ON Stock.AccountID = Person.AccountID " + 
                    "WHERE AccountName = '%s' " +
                    "GROUP BY CompanyName;", 
                    accountName);
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql2);
                        if (rs!=null){
                        System.out.println("Company Name and Stock Quantity");
                        while(rs.next())
                        {
                          System.out.print(rs.getString("CompanyName"));
                          System.out.print(" ");
                          System.out.print(rs.getInt("SUM(Quantity)"));
                          System.out.print("\n");
                        }
                        }
                        break;
                case 3: String sql3 = String.format("SELECT CompanyName, Quantity, Price " +
                    "FROM (Stock JOIN Company ON Stock.CompanyID = Company.CompanyID) " +
                    "JOIN SellOrder ON Stock.StockID = SellOrder.StockID;");
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql3);
                        if (rs!=null){
                        System.out.println("Company Name, Stock Quantity and Price");
                        int counter = 1;
                        while(rs.next())
                        {
                          System.out.print(counter + ". ");
                          System.out.print(rs.getString("CompanyName"));
                          companyList.add(rs.getString("CompanyName"));
                          System.out.print(" ");
                          System.out.print(rs.getInt("Quantity"));
                          companyList2.add(rs.getInt("Quantity"));
                          System.out.print(" ");
                          System.out.print(rs.getFloat("Price"));
                          System.out.print("\n");
                          counter++;
                        }
                        }
                        System.out.print("Which lot would you like to purchase? Please enter the lot number. ");
                        userInput4 = input.nextInt();
                        System.out.println();
                        String sql8 = String.format("Select BuyStock('%s','%s','%d');",accountName,companyList.get(userInput4 - 1),
                                                   companyList2.get(userInput4 - 1));
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql8);
                        if(rs!=null) {
                          System.out.println("BuyStock Returned");
                          while(rs.next()) {
                            System.out.println(rs.getFloat(1));
                          }
                        }
                        break;
                case 4: System.out.print("How much would you like to deposit? ");
                        userInput2 = input.nextFloat();
                        System.out.println();
                        String sql4 = String.format("Call DepositFunds('%s','%f');",accountName,userInput2);
                        stmt = conn.createStatement();
                        stmt.executeQuery(sql4);
                        String sql5 = String.format("SELECT Balance FROM Person WHERE Person.AccountName = '%s';",accountName);
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql5);
                        if (rs!=null){
                        System.out.println("Balance After Deposit");
                        while(rs.next())
                        {
                          System.out.print(rs.getString("Balance"));
                          System.out.print("\n");
                        }
                        }
                        break;
                case 5: System.out.print("How much would you like to withdraw? ");
                        userInput3 = input.nextFloat();
                        System.out.println();
                        String sql6 = String.format("Call WithdrawFunds('%s','%f');",accountName,userInput3);
                        stmt = conn.createStatement();
                        stmt.executeQuery(sql6);
                        String sql7 = String.format("SELECT Balance FROM Person WHERE Person.AccountName = '%s';",accountName);
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql7);
                        if (rs!=null){
                        System.out.println("Balance After Withdraw");
                        while(rs.next())
                        {
                          System.out.print(rs.getString("Balance"));
                          System.out.print("\n");
                        }
                        }
                        break;
                case 6: System.out.println("Goodbye."); break;
              }
            }

        } catch (SQLException ex) {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        finally {
            // it is a good idea to release
            // resources in a finally{} block
            // in reverse-order of their creation
            // if they are no-longer needed

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore

                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore

                stmt = null;
            }
        }
   }
}

