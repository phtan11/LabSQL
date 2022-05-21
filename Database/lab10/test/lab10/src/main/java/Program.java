import java.sql.*;


class product {
    private int id;
    private String name;
    private int price;
    private String des;
    public product(){}

    public product(int id, String name, int price, String des) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.des = des;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public String getDes() {
        return des;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @Override
    public String toString() {
        return "product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", des='" + des + '\'' +
                '}';
    }
}

public class Program {
    public static void main(String[] args){
        String url = "jdbc:sqlserver://702-29;user=admin;password=111111;databaseName=lab10;encrypt=true;trustServerCertificate=true;";


        try{
            System.out.println("connecting.............");
            Connection conn = DriverManager.getConnection(url);
            System.out.println("connect success");

            //dungf PreparedStatement


            /*insert
            product p = new product(3,"Iporn11",12000000,"new" );
            System.out.println(p);
            String sql = "INSERT INTO PRODUCT VALUES(?,?,?,?)";
            PreparedStatement stm = conn.prepareStatement(sql);

            stm.setInt(1,p.getId());
            stm.setString(2,p.getName());
            stm.setInt(3,p.getPrice());
            stm.setString(4,p.getDes());

            int insertRows = stm.executeUpdate();
            if (insertRows > 0){
                System.out.println("an item has been inserted!!");
            }
            else{
                System.out.println("not inserted");
            }
            */

            //in ra object
            String sql = "select * from product"; // create query
            Statement stm = conn.createStatement(); //tao menh de` to query ket noi
            ResultSet rs = stm.executeQuery(sql); // excuteQuery tra ve result set

            while (rs.next()){ // neu rs.next == true thi in ra tiep

                // cot 1,2,3,4 tuong tu nhu ben sql server
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int price = rs.getInt(3);
                String des = rs.getString(4);

                // tao sp with class
                product p = new product(id,name,price,des);
                System.out.println(p);
            }

        }catch (SQLException e){
            System.out.println("cannot connect " + e.getMessage());
            throw new RuntimeException(e);
        }
    }
}