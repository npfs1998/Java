package principal.model;

//* Classe reutilizada para o desafio de padroes por npfs, autor falvojr

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClienteRepository extends CrudRepository<Cliente, Long> {

}