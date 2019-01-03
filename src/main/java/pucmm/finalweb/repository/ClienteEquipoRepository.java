package pucmm.finalweb.repository;

        import org.springframework.data.jpa.repository.JpaRepository;
        import org.springframework.data.jpa.repository.Query;
        import org.springframework.data.repository.query.Param;
        import pucmm.finalweb.model.ClienteProducto;

        import java.util.List;

public interface ClienteEquipoRepository extends JpaRepository<ClienteProducto, Long> {

    @Query(value = "SELECT CLI.NOMBRE, EQ.NOMBRE_EQUIPO, ABS(DATEDIFF('DAY',  ALQ.FECHA_INICIO_ALQUILER, ALQ.FECHA_FIN_ALQUILER )) AS DIAS " +
            "FROM ALQUILER ALQ INNER JOIN CLIENTE CLI ON CLI.ID = ALQ.CLIENTE_ID INNER JOIN EQUIPO EQ ON EQ.ID = ALQ.EQUIPO_ID " +
            "WHERE ALQ.ESTADO = 'Pendiente' ORDER BY ALQ.FECHA_INICIO_ALQUILER", nativeQuery = true)
    List<Object[]> equiposAlquiladosNoDevueltos();

    @Query(value = "SELECT  CLI.NOMBRE, EQ.NOMBRE_EQUIPO, ALQ.FECHA_INICIO_ALQUILER, ALQ.FECHA_FIN_ALQUILER, ALQ.ESTADO FROM ALQUILER ALQ " +
            "INNER JOIN CLIENTE CLI ON CLI.id = ALQ.CLIENTE_ID INNER JOIN EQUIPO EQ ON EQ.ID = ALQ.EQUIPO_ID WHERE CLI.ID = :id", nativeQuery = true)
    List<Object[]> historialCliente(@Param("id") long id);

    @Query(value = "SELECT S.NOMBRE_SUB_FAMILIA, AVG(ABS(DATEDIFF('DAY', ALQ.FECHA_INICIO_ALQUILER, ALQ.FECHA_FIN_ALQUILER))) AS PROMDIAS " +
            "FROM ALQUILER ALQ INNER JOIN EQUIPO EQ ON EQ.ID = ALQ.EQUIPO_ID INNER JOIN SUB_FAMILIA S ON S.ID = EQ.SUBFAMILIA_ID " +
            "WHERE S.CATEGORIA_ID = :id GROUP BY S.NOMBRE_SUB_FAMILIA", nativeQuery = true)
    List<Object[]> promediosAlquiler(@Param("id") long id);

}

