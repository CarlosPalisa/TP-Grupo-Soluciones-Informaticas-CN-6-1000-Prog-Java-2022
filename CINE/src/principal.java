import java.sql.SQLException;
import java.text.ParseException;
import java.util.Scanner;


public class principal {
	
	int opcion;
	Scanner t = new Scanner(System.in);
	
	public principal() throws SQLException, ParseException {
		//System.out.println("BIENVENIDO A CINEMAR \n");
		System.out.println("Por favor espere...");
		pausa(1500);
		System.out.println("Entrando al sistema...\n");
		pausa(1500);
		System.out.println("------------------ MENU PRINCIPAL ----------------------");
		
		System.out.println("---->  INICIAR SESION        (Digite 1)");
		System.out.println("---->  REGISTRARSE           (Digite 2)");
		
		System.out.println("---->  SALIR                 (Digite 0) \n");
		
		System.out.println("--------------------------------------------------------");
		System.out.print("OPCION:/-------> ");
	  	this.opcion = t.nextInt();
	  	
	  	switch(this.opcion) {
	  	case 2:
	  		registrarse r=new registrarse();
	  		break;
	  	case 1:	
	  		//System.out.print("->LOGIN \n");
  			login log = new login();
  			log.mostrarFormulario();
  			log.autDatos();
  			
  			break;
	  	case 0:
	  		System.out.println("Saliendo del sistema...");
	  		try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
	  		System.out.println("GRACIAS POR VISITARNOS HASTA LA PROXIMA");
	  		
	  		break;
	  	default:
	  			System.out.print("MAL INGRESO, VUELVA A INTENTAR...");
		  		//t.nextInt();
		  		try {
					Thread.sleep(3000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
		  		principal p = new principal();	
		  		
		  		break;
	  	}
	  	
	  	  	
	  	
	}
	@SuppressWarnings("unused")
	private void pausa(int seg) {
		try {
			Thread.sleep(seg);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	 
}
