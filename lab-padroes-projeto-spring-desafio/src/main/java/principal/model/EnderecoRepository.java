package principal.model;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

//* Classe reutilizada para o desafio de padroes por npfs, autor falvojr

@Repository
public interface EnderecoRepository extends CrudRepository<Endereco, String> {

}