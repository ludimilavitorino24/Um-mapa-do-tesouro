/*
ALTER TABLE "t_sensors" DROP CONSTRAINT "FK_t_sensors__sensor_types";
ALTER TABLE "t_output_sensor_types" DROP CONSTRAINT "FK__sensor_types__sensor_types";
ALTER TABLE "t_output_sensor_types" DROP CONSTRAINT "FK__sensor_types_t_types";
ALTER TABLE "t_sensors_log" DROP CONSTRAINT "FK_t_sensors_log_t_sensors";
ALTER TABLE "t_sensors_log" DROP CONSTRAINT "FK_t_sensors_log_t_types";
ALTER TABLE "t_recommendations" DROP CONSTRAINT "FK_commendations_t_inputs";
ALTER TABLE "t_applications_log" DROP CONSTRAINT "FK_lications_log_commendations";
ALTER TABLE "t_applications_log" DROP CONSTRAINT "FK_lications_log_t_inputs";
DROP TABLE "t_sensors" PURGE;
DROP SEQUENCE "SQ_t_sensors";
DROP TABLE "t_sensor_types" PURGE;
DROP SEQUENCE "SQ_t_sensor_types";
DROP TABLE "t_output_sensor_types" PURGE;
DROP SEQUENCE "SQ_t_output_sensor_types";
DROP TABLE "t_sensors_log" PURGE;
DROP SEQUENCE "SQ_t_sensors_log";
DROP TABLE "t_types" PURGE;
DROP SEQUENCE "SQ_t_types";
DROP TABLE "t_recommendations" PURGE;
DROP SEQUENCE "SQ_t_recommendations";
DROP TABLE "t_inputs" PURGE;
DROP SEQUENCE "SQ_t_inputs";
DROP TABLE "t_applications_log" PURGE;
DROP SEQUENCE "SQ_t_applications_log";
-- */

-------------------------------------------------------------------------------
--            t_sensors
-------------------------------------------------------------------------------

CREATE TABLE "t_sensors" (
    "id"                              NUMBER              NOT NULL
  , "name"                            VARCHAR2(50)        NOT NULL
  , "sensor_type_id"                  NUMBER              NOT NULL
  , CONSTRAINT "PK_t_sensors" PRIMARY KEY ( "id" )
);


CREATE SEQUENCE "SQ_t_sensors";

CREATE OR REPLACE TRIGGER "TG_t_sensors_BI"
    BEFORE INSERT ON "t_sensors"
    FOR EACH ROW
BEGIN
    if :NEW."id" is NULL then
        :NEW."id" := "SQ_t_sensors".nextVal;
    end if;
END;
/

SHOW ERRORS;

-------------------------------------------------------------------------------
--            t_sensor_types
-------------------------------------------------------------------------------

CREATE TABLE "t_sensor_types" (
    "id"                              NUMBER              NOT NULL
  , "name"                            VARCHAR2(50)        NOT NULL
  , "qtd_outputs"                     NUMBER
  , CONSTRAINT "PK_t_sensor_types" PRIMARY KEY ( "id" )
);


CREATE SEQUENCE "SQ_t_sensor_types";

CREATE OR REPLACE TRIGGER "TG_t_sensor_types_BI"
    BEFORE INSERT ON "t_sensor_types"
    FOR EACH ROW
BEGIN
    if :NEW."id" is NULL then
        :NEW."id" := "SQ_t_sensor_types".nextVal;
    end if;
END;
/

SHOW ERRORS;

-------------------------------------------------------------------------------
--            t_output_sensor_types
-------------------------------------------------------------------------------

CREATE TABLE "t_output_sensor_types" (
    "id"                              NUMBER              NOT NULL
  , "name"                            VARCHAR2(50)        NOT NULL
  , "sensor_type_id"                  NUMBER              NOT NULL
  , "type_id"                         NUMBER              NOT NULL
  , CONSTRAINT "PK_t_output_sensor_types" PRIMARY KEY ( "id" )
);


CREATE SEQUENCE "SQ_t_output_sensor_types";

CREATE OR REPLACE TRIGGER "TG_t_output_sensor_types_BI"
    BEFORE INSERT ON "t_output_sensor_types"
    FOR EACH ROW
BEGIN
    if :NEW."id" is NULL then
        :NEW."id" := "SQ_t_output_sensor_types".nextVal;
    end if;
END;
/

SHOW ERRORS;

-------------------------------------------------------------------------------
--            t_sensors_log
-------------------------------------------------------------------------------

CREATE TABLE "t_sensors_log" (
    "id"                              NUMBER              NOT NULL
  , "sensor_id"                       NUMBER
  , "value"                           DOUBLE PRECISION
  , "type_id"                         NUMBER              NOT NULL
  , "latitude"                        DECIMAL
  , "longitude"                       DOUBLE PRECISION
  , "created_at"                      TIMESTAMP
  , CONSTRAINT "PK_t_sensors_log" PRIMARY KEY ( "id" )
);


CREATE SEQUENCE "SQ_t_sensors_log";

CREATE OR REPLACE TRIGGER "TG_t_sensors_log_BI"
    BEFORE INSERT ON "t_sensors_log"
    FOR EACH ROW
BEGIN
    if :NEW."id" is NULL then
        :NEW."id" := "SQ_t_sensors_log".nextVal;
    end if;
END;
/

SHOW ERRORS;

-------------------------------------------------------------------------------
--            t_types
-------------------------------------------------------------------------------

CREATE TABLE "t_types" (
    "id"                              NUMBER
  , "name"                            VARCHAR2(50)
  , CONSTRAINT "PK_t_types" PRIMARY KEY ( "id" )
);


CREATE SEQUENCE "SQ_t_types";

CREATE OR REPLACE TRIGGER "TG_t_types_BI"
    BEFORE INSERT ON "t_types"
    FOR EACH ROW
BEGIN
    if :NEW."id" is NULL then
        :NEW."id" := "SQ_t_types".nextVal;
    end if;
END;
/

SHOW ERRORS;

-------------------------------------------------------------------------------
--            t_recommendations
-------------------------------------------------------------------------------

CREATE TABLE "t_recommendations" (
    "id"                              NUMBER              NOT NULL
  , "input_id"                        NUMBER
  , "input_qtd"                       NUMBER
  , "latitude"                        DOUBLE PRECISION
  , "longitude"                       DOUBLE PRECISION
  , "created_at"                      DATE
  , CONSTRAINT "PK_t_recommendations" PRIMARY KEY ( "id" )
);


CREATE SEQUENCE "SQ_t_recommendations";

CREATE OR REPLACE TRIGGER "TG_t_recommendations_BI"
    BEFORE INSERT ON "t_recommendations"
    FOR EACH ROW
BEGIN
    if :NEW."id" is NULL then
        :NEW."id" := "SQ_t_recommendations".nextVal;
    end if;
END;
/

SHOW ERRORS;

-------------------------------------------------------------------------------
--            t_inputs
-------------------------------------------------------------------------------

CREATE TABLE "t_inputs" (
    "id"                              NUMBER              NOT NULL
  , "name"                            VARCHAR2(50)
  , CONSTRAINT "PK_t_inputs" PRIMARY KEY ( "id" )
);


CREATE SEQUENCE "SQ_t_inputs";

CREATE OR REPLACE TRIGGER "TG_t_inputs_BI"
    BEFORE INSERT ON "t_inputs"
    FOR EACH ROW
BEGIN
    if :NEW."id" is NULL then
        :NEW."id" := "SQ_t_inputs".nextVal;
    end if;
END;
/

SHOW ERRORS;

-------------------------------------------------------------------------------
--            t_applications_log
-------------------------------------------------------------------------------

CREATE TABLE "t_applications_log" (
    "id"                              NUMBER              NOT NULL
  , "recommendation_id"               NUMBER
  , "input_id"                        NUMBER              NOT NULL
  , "input_qtd"                       FLOAT               NOT NULL
  , "latitude"                        DOUBLE PRECISION
  , "longitude"                       DOUBLE PRECISION
  , "applicated_at"                   TIMESTAMP           NOT NULL
  , CONSTRAINT "PK_t_applications_log" PRIMARY KEY ( "id" )
);


CREATE SEQUENCE "SQ_t_applications_log";

CREATE OR REPLACE TRIGGER "TG_t_applications_log_BI"
    BEFORE INSERT ON "t_applications_log"
    FOR EACH ROW
BEGIN
    if :NEW."id" is NULL then
        :NEW."id" := "SQ_t_applications_log".nextVal;
    end if;
END;
/

SHOW ERRORS;

-------------------------------------------------------------------------------

ALTER TABLE "t_sensors" ADD CONSTRAINT "FK_t_sensors__sensor_types" FOREIGN KEY ( "sensor_type_id" ) REFERENCES "t_sensor_types" ( "id" );
ALTER TABLE "t_output_sensor_types" ADD CONSTRAINT "FK__sensor_types__sensor_types" FOREIGN KEY ( "sensor_type_id" ) REFERENCES "t_sensor_types" ( "id" );
ALTER TABLE "t_output_sensor_types" ADD CONSTRAINT "FK__sensor_types_t_types" FOREIGN KEY ( "type_id" ) REFERENCES "t_types" ( "id" );
ALTER TABLE "t_sensors_log" ADD CONSTRAINT "FK_t_sensors_log_t_sensors" FOREIGN KEY ( "sensor_id" ) REFERENCES "t_sensors" ( "id" );
ALTER TABLE "t_sensors_log" ADD CONSTRAINT "FK_t_sensors_log_t_types" FOREIGN KEY ( "type_id" ) REFERENCES "t_types" ( "id" );
ALTER TABLE "t_recommendations" ADD CONSTRAINT "FK_commendations_t_inputs" FOREIGN KEY ( "input_id" ) REFERENCES "t_inputs" ( "id" );
ALTER TABLE "t_applications_log" ADD CONSTRAINT "FK_lications_log_commendations" FOREIGN KEY ( "recommendation_id" ) REFERENCES "t_recommendations" ( "id" );
ALTER TABLE "t_applications_log" ADD CONSTRAINT "FK_lications_log_t_inputs" FOREIGN KEY ( "input_id" ) REFERENCES "t_inputs" ( "id" );
