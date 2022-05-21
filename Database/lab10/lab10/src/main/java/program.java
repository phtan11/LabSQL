import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class program {
    public static void main(String[] args) {

        String url = "jdbc:sqlserver://DESKTOP-TJUI0PV;user=testconnect;password=123456;databaseName=Lab10;encrypt=true;trustServerCertificate=true;";
        try{
            System.out.println("connectingggg..............");
            Connection conn = DriverManager.getConnection(url);
            System.out.printf("connect success");
            conn.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }
}
