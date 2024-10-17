## Modelo Entidade-Relacionamento (MER)

Este MER descreve um sistema de gerenciamento de sensores,  recomendações e aplicações.

**Entidades:**

* **t_sensors:** Armazena informações sobre os sensores.
    * Atributos: id, name, type_id
* **t_sensor_types:** Define os tipos de sensores. NO nosso univeso são 3 tipos de sensores: S1 (umidade), S2 (ph) e S3 (Fósforo e Potássio).
    * Atributos: id, name, qtd_outputs
* **t_sensors_log:** Registra as leituras dos sensores.
    * Atributos: id, sensor_id, value, type_id, latitude, longitude, created_at
* **t_output_types:**  Define os tipos de saída dos sensores. No nosso caso, os tipos de saída são: umidade, ph, Fósforo (P) e Potássio (K).
    * Atributos: id, name, sensor_type_id, type_id
* **t_types:**  Classificação de tipos de dados ou medições (por exemplo, "umidade", "pH", "temperatura").
    * Atributos: id, name
* **t_recommendations:** Armazena recomendações, relacionadas a ações a serem tomadas com base nas leituras dos sensores.
    * Atributos: id, input_id, input_qtd, latitude, longitude, created_at
* **t_applications_log:**  Registra as aplicações de insumos, de forma independente ou relacionadas às recomendações.
    * Atributos: id, recommendation_id, input_id, input_qtd, latitude, longitude, applicated_at
* **t_inputs:** Define os tipos de insumos que podem ser aplicados.
    * Atributos: id, name

**Relacionamentos:**

* **t_sensors** e **t_sensor_types:** 
  * Um sensor é de um único tipo de sensor (1:1).
  * Um tipo pode ter vários sensores (1:N).
* **t_sensors_log** e **t_sensors:** 
  * Um sensor pode ter de nenhum a vários registros de log (0:N).
  * Um registro de log está associado a um sensor (1:1).
* **t_sensors_log** e **t_types:**
  * Um registro de log está associado a um tipo.
  * 
* **t_output_types** e **t_sensor_types:**
  * Um tipo de sensor pode ter vários tipos de saída (1:N).
  * Um tipo de saída está associado a um único tipo de sensor (1:1).
* **t_output_types** e **t_types:**
  * Um tipo de saída está associado a um tipo.
  * 
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
