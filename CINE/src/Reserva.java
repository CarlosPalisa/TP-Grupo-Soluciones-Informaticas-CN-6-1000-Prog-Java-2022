import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Scanner;

public class Reserva {
      private int usuario;
      private int estado;
      private int tipoPago;
      private int cartelera;
      private Conecting conexion = new Conecting(); 
      Scanner t = new Scanner(System.in);
     
      
      public Reserva() {
    	  
      }
      public Reserva(int user) {
    	  this.usuario=user;
    	  this.estado=1;
    	  this.tipoPago=1;
    	  
      }
      
      public void creaReserva() throws SQLException, ParseException {
    	  MenuUsuario Menu = new MenuUsuario(this.usuario);
    	// SELECCIONAMOS LA PELICULA
    	Peliculas p = new Peliculas();
   		p.getPeliculas();
   		System.out.print("SELECCIONE PELICULA (Id) ---> ");
   		int idPel = t.nextInt();
   		
   		//SELECCIONAMOS LA CARTELERA
   		Cartelera c = new Cartelera();
   		c.getCartelera(idPel);
   		System.out.print("SELECCIONE FUNCION (Id Caretelera) ---> ");
   		int idCartelera = t.nextInt();
   		
   		//SELECCIONANDO BUTACAS
   		Sala s=new Sala();
   		int idSala = s.getIdSala(idCartelera);
   		
   		Butacas b=new Butacas();
   		b.getButacas(idSala);
   		int k=b.cantidadButacas();
   		int []butacas = b.getListaButacas(k);
   		
   		//MOSTRAMOS BUTACAS SELECCIONADAS
   		
   		System.out.println("------ BUTACAS SELECCIONADAS -------");
		System.out.printf("%12s|%12s|%12s| \n","id"," Butaca","Estado");
   		for(int i=0; i<butacas.length;i++) {
   		   b.getButacasSelec(butacas[i]);
   		}
   		int k1=0;
   		for(int i=0; i<butacas.length;i++) {
    		if (b.compButLib(butacas[i])==1) {
    			    k1++;
    		   };
    		}
   		boolean prueba = b.compButacas(butacas);
   		pausa(2000);
   		System.out.print(" \n");   		
   		// MOSTRANDO SELECCION
   		
   		String pelicula = p.getNombrePeliculas(idPel);
   		String hora = c.getHorario(idCartelera);
   		String sala = s.getNombreSala(idCartelera);
   		double precio = c.getPrecio(idCartelera);
   		if (prueba && k1<1) {
          System.out.println("Procesando informacion...");
   		//REVISION FINAL DE LA COMPRA/RESERVA
   			pausa(2000);
   			
   			System.out.println("--------------------------------------------------");
   			System.out.println("                 REVISE SU SELECCION ");
   			System.out.println("--------------------------------------------------");
   			System.out.println("PELICULA:                                 "+pelicula);
   			System.out.println("HORARIO:                                  "+hora);
   			System.out.println("SALA:                                     "+sala);
   			System.out.println("CANTIDAD DE ENTRADAS:                     "+k);
   			System.out.println("--------------------------------------------------");
   			System.out.println("TOTAL S/ DESC $:                          "+k*precio);
   			//System.out.println("HOY ES                                   ¡"+getDia()+"!");
   			double desc=0.10; 
   			if (getDia().equals("lunes") || getDia().equals("lunes")) {
   				  desc = .20;
   			  }else if(getDia().equals("martes") || getDia().equals("jueves"));{
   				  desc = .15;
   			  } 
   			double precDesc=(k*precio)*desc;
   			
   			System.out.println("DESCUENTO por dia "+ getDia()+"      $:   "+precDesc);
   			System.out.println("TOTAL S/ DESC $:                          "+((k*precio)-precDesc));
   			
   			System.out.println("--------------------------------------------------");
   	     	System.out.print("CONFIRMAR COMPRA: (1: Si/ 0: Cancelar) ---------> ");
   	    	
   	     	int confirmacion = t.nextInt();
   	    	if(confirmacion==1) {

   	    		// INSERT DE RESERVA + CAMBIO DE ESTADO
   	    		insertReserva(idCartelera);
   	    		System.out.println("SU COMPRA FUE RALIZADA CON EXITO!!! ");
   	    		 Menu.mostrarMenu();
   	    	}else if(confirmacion==0){
   	    		System.out.println("COMPRA CANCELADA ");
   		    	pausa(2000);
   		    	Menu.mostrarMenu();
   		   }else {
   		    	pausa(2000);
   		    	System.out.println("VUELVA MAS TARDE Y CONFIRME SU COMPRA... ");
   		    	//GRABAR LA RESERVA SIN CONFIRMAR COMPRA
   			   Menu.mostrarMenu();
   		   }
   		}else {
   			System.out.println("REVISE SUS SELECCION... ");
   			pausa(1500);
   			System.out.println("VUELVA A INTENTARLO... ");
   			pausa(1500);
   			Menu.mostrarMenu();
   		}
   		
    	  
      }
      private String getDia() {
    	  String dia[] = {"lunes","martes","miercoles","jueves","viernes","sabado","domingo"};
    	  int numero = (int) (Math.random() * 7);
    	  return dia[numero];
    	  
      }
      public void verReservas() throws SQLException {
    	  String sql="SELECT reserva.idReserva, cartelera.hora, peliculas.nombre as peli, sala.nombre as sala, cartelera.preciototal, usuario.apellido AS user from reserva, peliculas,sala, usuario inner join cartelera WHERE \r\n"
    	  		+ "    	  	    	  		                     reserva.idCartelera=cartelera.idCartelera and \r\n"
    	  		+ "    	  	    	  		                     cartelera.idPelicula=peliculas.idPeliculas and \r\n"
    	  		+ "    	  	    	  		                     reserva.idUsuario=usuario.id_usuario and\r\n"
    	  		+ "    	  	    	  		                     cartelera.idSala=sala.idSala;";
    	  ResultSet r=conexion.devolverConsulta(sql);
			System.out.println("----------------------------------RESERVAS-------------------------------------------|");
			System.out.printf("%-3s|%-12s|%-30s|%-12s|%-12s|%12s| \n","Nro","HORA","PELICULA","SALA","PRECIO","USUARIO");
			System.out.println("-------------------------------------------------------------------------------------|");
			while(r.next()) {
  			System.out.printf("%-3s|%-12s|%-30s|%-12s|%-12s|%12s| \n",
  					r.getInt("idReserva"),
  					r.getString("hora"),
  					r.getString("peli"),
  					r.getString("sala"),
  					r.getInt("precioTotal"),
  					r.getString("user"));
			}
      }
      
      public void getReserva(int u) throws SQLException {
    	  /*
    	   * SELECT reserva.idReserva, cartelera.hora, peliculas.nombre, sala.nombre, cartelera.preciototal from reserva, peliculas,sala inner join cartelera WHERE 
                     reserva.idCartelera=cartelera.idCartelera and
                     cartelera.idPelicula=peliculas.idPeliculas and
                     cartelera.idSala=sala.idSala and
	                 idUsuario=3;
    	   * 
    	   * */
    	  
    	  
    	  String sql="SELECT reserva.idReserva, cartelera.hora, peliculas.nombre as peli, sala.nombre as sala, cartelera.preciototal from reserva, peliculas,sala inner join cartelera WHERE \r\n"
    	  		+ "                     reserva.idCartelera=cartelera.idCartelera and\r\n"
    	  		+ "                     cartelera.idPelicula=peliculas.idPeliculas and\r\n"
    	  		+ "                     cartelera.idSala=sala.idSala and\r\n"
    	  		+ "	                    idUsuario="+u+";";
			ResultSet r=conexion.devolverConsulta(sql);
			System.out.println("----------------------------------RESERVAS-------------------------------------------|");
			System.out.printf("%-3s|%-12s|%-30s|%-12s|%-12s|\n","Nro","HORA","PELICULA","SALA","PRECIO");
			System.out.println("-------------------------------------------------------------------------------------|");
			while(r.next()) {
    			System.out.printf("%-3s|%-12s|%-30s|%-12s|%-12s|\n",
    					r.getInt("idReserva"),
    					r.getString("hora"),
    					r.getString("peli"),
    					r.getString("sala"),
    					r.getInt("precioTotal"));
			}
    	  
    	  
    	  
      }
      
      @SuppressWarnings("null")
	public void insertReserva(int c) throws SQLException {
    	  
    	  ArrayList<Integer> Lista = new ArrayList<Integer>(); 
    	  Lista.add(this.usuario);
    	  Lista.add(this.estado);
    	  Lista.add(this.tipoPago);
    	  Lista.add(c);
    	  Conecting conn=new Conecting();
    	  conn.AgregarReserva(Lista);
    	  
    	  
      }
     void pausa(int seg ){
    	 try {
    			Thread.sleep(seg);
    		} catch (InterruptedException e) {
    			e.printStackTrace();
    		}
     }
      
}
