package conn;
import java.sql.*;

public class MySQLconn {
    public static Connection getMySQLConnection()
            throws ClassNotFoundException, SQLException {
        // Note: Change the connection parameters accordingly.
        String hostName = "localhost";
        String dbName = "aeroport";
        String userName = "root";
        String password = "perdea13mimu";
        return getMySQLConnection(hostName, dbName, userName, password);
    }
    public static Connection getMySQLConnection(String hostName, String dbName,
                                                String userName, String password) throws SQLException,
            ClassNotFoundException {

            Class.forName("com.mysql.jdbc.Driver");


        // URL Connection for MySQL:
        // Example:
        // jdbc:mysql://localhost:3306/simplehr
        String connectionURL = "jdbc:mysql://" + hostName+"/"+ dbName;
        //String connectionURL = hostName+"/"+ dbName;

        Connection conn = DriverManager.getConnection(connectionURL,userName,password);
        return conn;
    }
}
