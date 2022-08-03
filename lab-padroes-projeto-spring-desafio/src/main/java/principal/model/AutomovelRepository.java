package principal.model;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/*
 *  @author npfs
 *  
 */

@Repository
public interface AutomovelRepository extends CrudRepository<Automovel, Long> {

}
