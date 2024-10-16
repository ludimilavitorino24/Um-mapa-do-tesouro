## Modelo Entidade-Relacionamento (MER)

Este MER descreve um sistema de gerenciamento de sensores,  recomendações e aplicações.

**Entidades:**

* **t_sensors:** Armazena informações sobre os sensores.
    * Atributos: id, name, type_id
* **t_sensor_types:** Define os tipos de sensores.
    * Atributos: id, name, qtd_outputs
* **t_sensors_log:** Registra as leituras dos sensores.
    * Atributos: id, sensor_id, value, type_id, latitude, longitude, created_at
* **t_output_types:**  Define os tipos de saída dos sensores.
    * Atributos: id, name, sensor_type_id, type_id
* **t_types:**  Define tipos genéricos, possivelmente relacionados a sensores e saídas.
    * Atributos: id, name
* **t_recommendations:** Armazena recomendações, possivelmente relacionadas a ações a serem tomadas com base nas leituras dos sensores.
    * Atributos: id, input_id, input_qtd, latitude, longitude, created_at
* **t_applications_log:**  Registra as aplicações de insumos, possivelmente relacionadas às recomendações.
    * Atributos: id, recommendation_id, input_id, input_qtd, latitude, longitude, applicated_at
* **t_inputs:** Define os tipos de insumos que podem ser aplicados.
    * Atributos: id, name

**Relacionamentos:**

* **t_sensors** e **t_sensor_types:** Um sensor possui um tipo de sensor.
* **t_sensors_log** e **t_sensors:** Um sensor pode ter vários registros de log.
* **t_sensors_log** e **t_types:** Um registro de log está associado a um tipo.
* **t_output_types** e **t_sensor_types:** Um tipo de sensor pode ter vários tipos de saída.
* **t_output_types** e **t_types:** Um tipo de saída está associado a um tipo.
* **t_recommendations** e **t_inputs:** Uma recomendação está associada a uma entrada.
* **t_applications_log** e **t_recommendations:** Um registro de aplicação está associado a uma recomendação.
* **t_applications_log** e **t_inputs:** Um registro de aplicação está associado a uma entrada.


**Observações:**

* Este MER é uma interpretação da imagem fornecida, e pode haver imprecisões na cardinalidade dos relacionamentos.
* Para um modelo completo, seria necessário definir as chaves primárias e estrangeiras de cada entidade, e a cardinalidade de cada relacionamento.
