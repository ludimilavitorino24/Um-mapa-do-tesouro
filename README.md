Nesse diagrama é para mostrar o fluxo do banco de daods criado . 
+-------------------+        +-----------------------+
|       Sensor      |        |   Aplicacao_Agua     |
+-------------------+        +-----------------------+
| ID_Sensor (PK)   |<-------| ID_Aplicacao (PK)    |
| Tipo              |        | ID_Sensor (FK)       |
| Localização       |        | DataHora             |
+-------------------+        | Quantidade_Agua      |
                             +-----------------------+

+-------------------+        +-----------------------+
|    Leitura_pH     |        | Leitura_Nutrientes    |
+-------------------+        +-----------------------+
| ID_Leitura_pH (PK)|<-------| ID_Leitura_Nutrientes |
| ID_Sensor (FK)    |        | ID_Sensor (FK)       |
| DataHora          |        | DataHora             |
| Valor_pH          |        | Valor_Fosforo        |
+-------------------+        | Valor_Potassio       |
                             +-----------------------+
