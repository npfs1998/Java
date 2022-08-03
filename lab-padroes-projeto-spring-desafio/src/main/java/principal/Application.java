package principal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 *  Projeto gerado pelo Spring Initializr
 *  
 *  Modulos selecionados:
 *  
 *  	Spring Data JPA
 *    	Spring Web
 *   	H2 Database
 *   	OpenFeign
 *  
 *  @author npfs
 */
@EnableFeignClients
@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
