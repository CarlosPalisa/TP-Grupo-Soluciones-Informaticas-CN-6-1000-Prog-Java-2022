import java.sql.*;

public class conexion_prueba {
static final String JDBC_DRIVER="com.mysql.cj.jdbc.Driver";
	
	static final String DB_URL="jdbc:mysql://localhost:3306/cinemar";
	
	static final String USER="root";
	
	static final String PASS="";
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Connection conn=null;
		Statement stmt =null;
		
		try {
			Class.forName(JDBC_DRIVER);
			
			System.out.println("Conectando a la bd");
			
			conn=DriverManager.getConnection(DB_URL,USER,PASS);
			
			System.out.println("Creando Statement");
			stmt=conn.createStatement();
			String sql, sql2;
			sql="select * from usuario";
			sql2="select * from paliculas"; 
			//stmt.executeUpdate(sql);
			int i=1;
			
			ResultSet respuesta = stmt.executeQuery(sql);
			
			System.out.print("USUARIOS: \n");
			while (respuesta.next()) {
				String nombre = respuesta.getString("nombre");
				String apellido = respuesta.getString("apellido");
				String email = respuesta.getString("email");
				String dni = respuesta.getString("dni");
				
				System.out.print(i+") "+apellido+" ");
				System.out.print(" "+nombre+" ");
				System.out.print(" "+email+" ");
				System.out.print(" "+dni+"\n");
				i++;
			}
			ResultSet respuesta2 = stmt.executeQuery(sql2);
			int j=1;
			System.out.print("PELICULAS: \n");
			while (respuesta2.next()) {
				String nombre = respuesta2.getString("nombre");
				String duracion = respuesta2.getString("duracion");
				//String email = respuesta.getString("email");
				//String dni = respuesta.getString("dni");
				
				System.out.print(j+") "+nombre+" ");
				System.out.print(" "+duracion+" \n");
				//System.out.print(" "+email+" ");
				//System.out.print(" "+dni+"\n");
				j++;
			}
			
			
			respuesta.close();
			respuesta2.close();
			stmt.close();
			conn.close();
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
