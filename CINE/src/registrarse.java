//import java.util.ArrayList;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Scanner;

public class registrarse {
	
	//private ArrayList<String> nuevoUsuario;
	private String nombre;
	private String apellido;
	private String email;
	private String dni;
	private String pass1;
	private String pass2;
	private int ban;
	private String continuar;
	
	private Scanner t = new Scanner(System.in);
	
	public registrarse() throws SQLException, ParseException {
		
		System.out.println("FORMULARIO DE REGISTRO \n \n");
	    	
		System.out.print("INGRESE APELLIDO ->");
		this.apellido = t.next();
		System.out.print("INGRESE NOMBRE ->");
		this.nombre = t.next();
		System.out.print("INGRESE CORREO ELECTRONICO ->");
		this.email = t.next();
		System.out.print("INGRESE DNI ->");
		this.dni = t.next();
		
					
		    System.out.print("INGRESE PASSWORD ->");
		    this.pass1 = t.next();
		    System.out.print("REPITA PASSWORD ->");
		    this.pass2 = t.next();
		    this.ban = 0;
		
		    if(this.pass1.equals(this.pass2)) { 
		    	//Preguntamos en primera instancia si las passwored son iguales
				System.out.print("DATOS INGRESADOS \n");
			   	Usuario user=new Usuario(this.apellido, this.nombre,this.email,this.dni,this.pass2);
				user.mostrarUser();
				System.out.print("LOS DATOS SON CORRECTOS: S/N --> ");
				//Preguntamos y comprobamos si los datos son correctos, nos preparamos para guardar los datos en BD
				this.continuar=t.next();
				if(this.continuar.equals("s") || this.continuar.equals("S")){
	                //Metodo insert
					user.insertUser();
					principal q = new principal();
				}else{
					System.out.print("LO ESPERAMOS EN OTRA OCASION... GRACIAS");
					//Salimos del programita
				}
				
			    /**/
			}else{
				do{
				    System.out.print("LAS PASSWORD NO SON IGUALES \n");
					System.out.print("INGRESE PASSWORD ->");
				    this.pass1 = t.next();
				    System.out.print("REPITA PASSWORD ->");
				    this.pass2 = t.next();
				    if(this.pass1.equals(this.pass2)){
				    	this.ban=1;
				    	
						Usuario user=new Usuario(this.apellido, this.nombre,this.email,this.dni,this.pass2);
				    	user.mostrarUser();
				    	System.out.print("LOS DATOS SON CORRECTOS: S/N --> ");
						this.continuar=t.next();
						if(this.continuar.equals("s") || this.continuar.equals("S")){
			                //Metodo insert
							user.insertUser();
							principal q = new principal();
						}else{
							System.out.print("LO ESPERAMOS EN OTRA OCASION... GRACIAS");
							//Salimos del programita
						}
				    }else {
				    	this.ban=-1;
				    }
			    }while(this.ban==-1);
			}
	
	}
	
	

}
