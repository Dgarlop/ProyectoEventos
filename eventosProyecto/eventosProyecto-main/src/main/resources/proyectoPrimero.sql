DROP DATABASE IF EXISTS eventos;

CREATE database eventos;
USE eventos;

CREATE USER IF NOT EXISTS 'alumno'@'localhost' IDENTIFIED BY 'alumnodam#1234';
GRANT ALL PRIVILEGES ON *.* TO 'alumno'@'localhost';
FLUSH PRIVILEGES;


CREATE TABLE Historial (
                           ID_Historial INT PRIMARY KEY,
                           Iteraciones INT,
                           Fecha_Inicio DATE,
                           Fecha_Fin DATE
);


CREATE TABLE Organizacion (
                              ID_Organizacion INT PRIMARY KEY,
                              Nombre VARCHAR(100),
                              Direccion VARCHAR(150),
                              Telefono VARCHAR(20),
                              Email VARCHAR(100),
                              Ciudad VARCHAR(50),
                              Fecha_Registro DATE,
                              ID_Historial INT,


                              CONSTRAINT FK_Organizacion_Historial
                                  FOREIGN KEY (ID_Historial)
                                      REFERENCES Historial(ID_Historial)
);


CREATE TABLE Oportunidad (
                             ID_Oportunidad INT PRIMARY KEY,
                             Descripcion VARCHAR(200),
                             Fecha_Inicio DATE,
                             Fecha_Fin DATE,
                             Estado VARCHAR(50),
                             Presupuesto DECIMAL(15,2),
                             ID_Persona INT,
                             ID_Historial INT,


                             CONSTRAINT FK_Oportunidad_Historial
                                 FOREIGN KEY (ID_Historial)
                                     REFERENCES Historial(ID_Historial),


                             CONSTRAINT chk_estado CHECK (Estado IN ('Aprobado', 'Rechazado', 'Pendiente'))
);


CREATE TABLE Colaboracion (
                              ID_Colaboracion INT PRIMARY KEY,
                              Tipo VARCHAR(200),
                              Fecha DATE,
                              Firma VARCHAR(2),
                              Dinero DECIMAL(15,2),
                              Convenio VARCHAR(200),
                              ID_Historial INT,

                              CONSTRAINT FK_COLABORACION_HISTORIAL FOREIGN KEY (ID_Historial) REFERENCES Historial(ID_Historial),
                              CONSTRAINT chk_colaboracion_firma CHECK (firma IN ('SI', 'NO'))
);


CREATE TABLE Actividad (
                           ID_Actividad INT PRIMARY KEY,
                           Descripcion VARCHAR(200),
                           Fecha DATE,
                           Dinero DECIMAL(15,2),
                           Firma VARCHAR(2),
                           ID_Historial INT,


                           CONSTRAINT FK_ACTIVIDAD_HISTORIAL FOREIGN KEY (ID_Historial) REFERENCES Historial(ID_Historial),
                           CONSTRAINT chk_actividad_firma CHECK (firma IN ('SI', 'NO'))
);


CREATE TABLE Patrocinio(
                           ID_Patrocinio INT PRIMARY KEY,
                           Firma VARCHAR(200),
                           Tipo VARCHAR(200),
                           ID_Historial INT,
                           CONSTRAINT FK_PATROCINIO_HISTORIAL FOREIGN KEY (ID_Historial) REFERENCES Historial(ID_Historial),
                           CONSTRAINT chk_patrocinio_firma CHECK (Firma IN ('SI', 'NO')),
                           CONSTRAINT chk_tipo_patrocinio CHECK (Tipo IN ('Bronce', 'Plata', 'Oro'))
);


CREATE TABLE Recinto(
                        ID_Recinto INT PRIMARY KEY,
                        Nombre VARCHAR(200),
                        Capacidad INT(4),
                        Ubicacion VARCHAR(200)
);



CREATE TABLE Administracion (
                                id_administracion INT AUTO_INCREMENT PRIMARY KEY,
                                Ambito VARCHAR(100),
                                Presupuesto DECIMAL(15, 2)
);


CREATE TABLE Empresa (
                         id_empresa INT AUTO_INCREMENT PRIMARY KEY,
                         Sector VARCHAR(100),
                         Num_Empleados INT
);


CREATE TABLE Centro_Educativo (
                                  id_centro INT AUTO_INCREMENT PRIMARY KEY,
                                  Tipo_Centro VARCHAR(100),
                                  Num_Alumnos INT
);


CREATE TABLE Asociacion (
                            id_asociacion INT AUTO_INCREMENT PRIMARY KEY,
                            Finalidad VARCHAR(150),
                            Num_Socios INT
);


CREATE TABLE Ayuntamiento (
                              id_ayuntamiento INT AUTO_INCREMENT PRIMARY KEY,
                              Provincia VARCHAR(100),
                              Alcalde VARCHAR(150)
);


INSERT INTO Historial (ID_Historial, Iteraciones, Fecha_Inicio, Fecha_Fin) VALUES
                                                                               (1, 3, '2026-06-10', '2026-06-12'),
                                                                               (2, 2, '2026-07-05', '2026-07-06'),
                                                                               (3, 5, '2026-09-15', '2026-09-30');


INSERT INTO Organizacion (ID_Organizacion, Nombre, Direccion, Telefono, Email, Ciudad, Fecha_Registro, ID_Historial) VALUES
                                                                                                                         (1, 'Tech_Solutions', 'Av_Andalucia 25', '654321987', 'contacto@techsolutions.com', 'Sevilla', '2025-03-12', 1),
                                                                                                                         (2, 'Asociación Futuro Joven', 'Calle Real 14', '611223344', 'info@futurojoven.org', 'Málaga', '2025-04-20', 2),
                                                                                                                         (3, 'Ayuntamiento de La Algaba', 'Plaza Constitución 1', '955667788', 'ayuntamiento@algaba.es', 'La Algaba', '2025-01-05', 3);


INSERT INTO Oportunidad (ID_Oportunidad, Descripcion, Fecha_Inicio, Fecha_Fin, Estado, Presupuesto, ID_Persona, ID_Historial) VALUES
                                                                                                                                  (1, 'Feria de Empleo Tecnologico', '2026-06-10', '2026-06-12', 'Aprobado', 150000.00, 1, 1),
                                                                                                                                  (2, 'Jornadas de Orientacion Prof', '2026-07-05', '2026-07-06', 'Pendiente', 80000.00, 2, 2),
                                                                                                                                  (3, 'Programa de Colaboracion Er', NULL, '2026-09-15', 'Rechazado', 220000.00, 3, 3);


INSERT INTO Colaboracion (ID_Colaboracion, Tipo, Fecha, Firma, Dinero, Convenio, ID_Historial) VALUES
                                                                                                   (1, 'Académica', '2026-05-15', 'SI', 5000.00, 'Convenio Unive', 1),
                                                                                                   (2, 'Empresarial', '2026-06-20', 'NO', 7500.00, 'Acuerdo Tempc', 2),
                                                                                                   (3, 'Institucional', '2026-07-01', 'SI', 12000.00, 'Convenio Anual', 3);


INSERT INTO Actividad (ID_Actividad, Descripcion, Fecha, Dinero, Firma, ID_Historial) VALUES
                                                                                          (1, 'Taller de Programación', '2026-06-11', 2500.00, 'SI', 1),
                                                                                          (2, 'Conferencia de Empleo', '2026-07-06', 1000.00, 'NO', 2),
                                                                                          (3, 'Jornada de Networking', '2026-09-18', 2000.00, 'SI', 3);


INSERT INTO Patrocinio (ID_Patrocinio, Firma, Tipo, ID_Historial) VALUES
                                                                      (1, 'SI', 'Bronce', 1),
                                                                      (2, 'NO', 'Plata', 2),
                                                                      (3, 'SI', 'Oro', 3);


INSERT INTO Recinto (ID_Recinto, Nombre, Capacidad, Ubicacion) VALUES
                                                                   (1, 'Palacio de Congresos', 2000, 'Sevilla'),
                                                                   (2, 'Centro Cultural Norte', 750, 'Málaga'),
                                                                   (3, 'Pabellón Municipal', 1200, 'Cádiz');


INSERT INTO Administracion (id_administracion, Ambito, Presupuesto) VALUES
                                                                        (1, 'Educación', 2500000.00),
                                                                        (2, 'Sanidad', 4200000.00),
                                                                        (3, 'Cultura', 1800000.00);


INSERT INTO Empresa (id_empresa, Sector, Num_Empleados) VALUES
                                                            (1, 'Tecnología', 120),
                                                            (2, 'Marketing', 45),
                                                            (3, 'Transporte', 300);


INSERT INTO Centro_Educativo (id_centro, Tipo_Centro, Num_Alumnos) VALUES
                                                                       (1, 'Instituto', 850),
                                                                       (2, 'Universidad', 12000),
                                                                       (3, 'Colegio Privado', 430);


INSERT INTO Asociacion (id_asociacion, Finalidad, Num_Socios) VALUES
                                                                  (1, 'Ayuda Social', 250),
                                                                  (2, 'Protección Animal', 180),
                                                                  (3, 'Actividades Juveniles', 320);


INSERT INTO Ayuntamiento (id_ayuntamiento, Provincia, Alcalde) VALUES
                                                                   (1, 'Sevilla', 'María Lopez'),
                                                                   (2, 'Málaga', 'Antonio Ruiz'),
                                                                   (3, 'Cádiz', 'Carmen Ortega');

