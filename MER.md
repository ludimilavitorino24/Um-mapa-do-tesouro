## Modelo Entidade-Relacionamento (MER)

Este MER descreve um sistema de gerenciamento de sensores,  recomendações e aplicações.

**Entidades:**

* **t_sensors:** Armazena informações sobre os sensores, No nosso univeso são 3 sensores: S1 (Umidade), S2 (pH) e S3 (NPK).
    * Atributos: id (PK), name, sensor_type_id (FK)
* **t_sensor_types:** Define os tipos de sensores. São 3 tipos de sensores: Umidade, pH e o NPK (Fósforo e Potássio).
    * Atributos: id (PK), name, qtd_outputs
* **t_output_sensor_types:**  Define os tipos de saída dos sensores. No nosso caso, os tipos de saída são: umidade, ph, Fósforo (P) e Potássio (K).
    * Atributos: id (PK), name, sensor_type_id (FK), type_id (FK)
* **t_types:**  Classificação de tipos de dados ou medições (por exemplo, "umidade", "pH", "temperatura", "etc").
    * Atributos: id (PK), name
* **t_sensors_log:** Registra as leituras dos sensores.
    * Atributos: id (PK), sensor_id (FK), value, type_id (FK), latitude, longitude, created_at
* **t_recommendations:** Armazena recomendações, relacionadas a ações a serem tomadas com base nas leituras dos sensores.
    * Atributos: id (PK), input_id (FK), input_qtd, latitude, longitude, created_at
* **t_inputs:** Define os tipos de insumos que podem ser aplicados.
    * Atributos: id (PK), name
* **t_applications_log:**  Registra as aplicações de insumos, de forma independente ou relacionadas às recomendações.
    * Atributos: id (PK), recommendation_id (FK), input_id (FK), input_qtd, latitude, longitude, applicated_at

**Relacionamentos:**

* **t_sensors_log** e **t_sensors:** 
  * Um sensor pode ter de um para muitos registros de log (1:N).
  * Vários registros de log para um sensor (N:1).
* **t_sensors_log** e **t_types:**
  * Vários registros de log para um tipo (N:1).
  * Um tipo para vários registros de log (1:N).
* **t_sensors** e **t_sensor_types:** 
  * Vários sensores para um tipo de sensor (N:1).
  * Um tipo pode ter vários sensores (1:N).
* **t_output_types** e **t_sensor_types:**
  * Um tipo de sensor pode ter vários tipos de saída (1:N).
  * Um tipo de saída está associado a um único tipo de sensor (1:1).
* **t_output_types** e **t_types:**
  * Um tipo de saída está associado a um tipo (1:1).
  * Vários tipos estão associados a um tipo de saída (N:1).
* **t_recommendations** e **t_inputs:** 
  * Uma recomendação está associada a um insumo (1:1).
  * Um insumo pode estar associado a nenhuma, a uma ou a várias recomendações (0:N).
* **t_applications_log** e **t_recommendations:**
  * Um registro de aplicação pode estar associado de zero a várias recomendação (0:1).
  * Uma recomendação está associada a um registro de aplicação (1:1).
* **t_applications_log** e **t_inputs:**
  * Um registro de aplicação está associado a um insumo (1:1).
  * Um insumo pode estar associada a zero ou vários registros de aplicação (0:N).


**Observações:**

* Este MER é uma interpretação da imagem fornecida, e pode haver imprecisões na cardinalidade dos relacionamentos.
* Para um modelo completo, seria necessário definir as chaves primárias e estrangeiras de cada entidade, e a cardinalidade de cada relacionamento.
