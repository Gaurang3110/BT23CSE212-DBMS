CREATE DATABASE project;
USE project;

CREATE TABLE farmers (
    farmer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    village VARCHAR(50)
);

CREATE TABLE fields (
    field_id INT PRIMARY KEY,
    farmer_id INT,
    area_acres DECIMAL(5,2),
    soil_type VARCHAR(20),
    crop_type VARCHAR(30),
    FOREIGN KEY (farmer_id) REFERENCES farmers(farmer_id)
);

CREATE TABLE devices (
    device_id VARCHAR(10) PRIMARY KEY,
    field_id INT,
    device_type VARCHAR(30),
    install_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (field_id) REFERENCES fields(field_id)
);

CREATE TABLE sensor_data (
    data_id INT PRIMARY KEY,
    device_id VARCHAR(10),
    timestamp DATETIME,
    moisture_level INT,
    temperature DECIMAL(5,2),
    ph_level DECIMAL(4,2),
    FOREIGN KEY (device_id) REFERENCES devices(device_id)
);

CREATE TABLE irrigation_log (
    log_id INT PRIMARY KEY,
    field_id INT,
    start_time DATETIME,
    end_time DATETIME,
    water_used_ltrs INT,
    triggered_by VARCHAR(20),
    FOREIGN KEY (field_id) REFERENCES fields(field_id)
);

CREATE TABLE alerts (
    alert_id INT PRIMARY KEY,
    device_id VARCHAR(10),
    timestamp DATETIME,
    alert_type VARCHAR(30),
    description VARCHAR(255),
    FOREIGN KEY (device_id) REFERENCES devices(device_id)
);

-- INSERT INTO TABLES

INSERT INTO farmers VALUES
(1, 'Ravi Singh', '9876543210', 'Rampur'),
(2, 'Asha Devi', '9123456780', 'Lakhnipur'),
(3, 'Mohit Yadav', '9988776655', 'Kesar Nagar'),
(4, 'Suman Rao', '9012345678', 'Jaitpur'),
(5, 'Harish Kumar', '8899776655', 'Bairiya'),
(6, 'Nisha Verma', '9811122233', 'Lakhnipur'),
(7, 'Pawan Mehta', '9090909090', 'Rampur'),
(8, 'Komal Singh', '9345677889', 'Goripur'),
(9, 'Arjun Chauhan', '9556677889', 'Kesar Nagar'),
(10,'Krishna Patel', '9001122334', 'Bairiya');

INSERT INTO fields VALUES
(101, 1, 2.5, 'Loamy', 'Wheat'),
(102, 1, 1.8, 'Clay', 'Sugarcane'),
(103, 2, 3.2, 'Sandy', 'Rice'),
(104, 3, 1.0, 'Loamy', 'Vegetables'),
(105, 4, 4.5, 'Clay', 'Cotton'),
(106, 5, 2.2, 'Silty', 'Wheat'),
(107, 6, 3.0, 'Loamy', 'Maize'),
(108, 7, 1.5, 'Sandy', 'Rice'),
(109, 8, 2.0, 'Clay', 'Sugarcane'),
(110, 9, 3.3, 'Loamy', 'Wheat');

INSERT INTO devices VALUES
('D01',101,'moisture_sensor','2024-01-11','active'),
('D02',101,'camera','2024-01-15','active'),
('D03',102,'moisture_sensor','2024-01-20','inactive'),
('D04',103,'pump','2024-02-01','active'),
('D05',104,'light','2024-02-14','active'),
('D06',105,'camera','2024-02-20','active'),
('D07',106,'pump','2024-03-01','inactive'),
('D08',107,'moisture_sensor','2024-03-04','active'),
('D09',108,'light','2024-03-10','active'),
('D10',109,'camera','2024-03-12','active'),
('D11',110,'moisture_sensor','2024-03-14','active'),
('D12',103,'camera','2024-03-18','inactive');

INSERT INTO sensor_data VALUES
(1,'D01','2024-03-10 10:00',40,28.5,6.5),
(2,'D01','2024-03-10 14:00',38,29.0,6.4),
(3,'D03','2024-03-11 09:00',22,32.1,6.8),
(4,'D08','2024-03-11 11:00',33,31.0,6.7),
(5,'D11','2024-03-11 13:00',45,27.5,6.3),
(6,'D01','2024-03-12 10:00',42,30.2,6.6),
(7,'D08','2024-03-12 11:30',35,29.8,6.6),
(8,'D11','2024-03-12 14:00',47,30.1,6.4),
(9,'D03','2024-03-13 08:00',20,33.2,7.0),
(10,'D01','2024-03-13 10:00',39,28.2,6.5),
(11,'D08','2024-03-14 12:00',36,30.0,6.8),
(12,'D11','2024-03-14 15:30',50,28.8,6.2),
(13,'D04','2024-03-10 09:00',NULL,27.0,6.5),
(14,'D04','2024-03-11 09:00',NULL,26.8,6.4),
(15,'D05','2024-03-12 18:00',NULL,25.0,6.2),
(16,'D09','2024-03-12 19:00',NULL,24.0,6.3),
(17,'D10','2024-03-12 20:00',NULL,25.2,6.5),
(18,'D12','2024-03-13 22:00',NULL,27.2,6.7),
(19,'D06','2024-03-14 21:00',NULL,26.5,6.1),
(20,'D07','2024-03-14 23:00',NULL,29.0,6.4);

INSERT INTO sensor_data VALUES
(1,'D01','2024-03-10 10:00',40,28.5,6.5),
(2,'D01','2024-03-10 14:00',38,29.0,6.4),
(3,'D03','2024-03-11 09:00',22,32.1,6.8),
(4,'D08','2024-03-11 11:00',33,31.0,6.7),
(5,'D11','2024-03-11 13:00',45,27.5,6.3),
(6,'D01','2024-03-12 10:00',42,30.2,6.6),
(7,'D08','2024-03-12 11:30',35,29.8,6.6),
(8,'D11','2024-03-12 14:00',47,30.1,6.4),
(9,'D03','2024-03-13 08:00',20,33.2,7.0),
(10,'D01','2024-03-13 10:00',39,28.2,6.5),
(11,'D08','2024-03-14 12:00',36,30.0,6.8),
(12,'D11','2024-03-14 15:30',50,28.8,6.2),
(13,'D04','2024-03-10 09:00',NULL,27.0,6.5),
(14,'D04','2024-03-11 09:00',NULL,26.8,6.4),
(15,'D05','2024-03-12 18:00',NULL,25.0,6.2),
(16,'D09','2024-03-12 19:00',NULL,24.0,6.3),
(17,'D10','2024-03-12 20:00',NULL,25.2,6.5),
(18,'D12','2024-03-13 22:00',NULL,27.2,6.7),
(19,'D06','2024-03-14 21:00',NULL,26.5,6.1),
(20,'D07','2024-03-14 23:00',NULL,29.0,6.4);

INSERT INTO irrigation_log VALUES
(1,101,'2024-03-10 06:00','2024-03-10 06:20',120,'auto'),
(2,102,'2024-03-10 07:00','2024-03-10 07:30',150,'manual'),
(3,103,'2024-03-10 08:00','2024-03-10 08:10',80,'auto'),
(4,104,'2024-03-11 06:40','2024-03-11 06:55',90,'manual'),
(5,105,'2024-03-11 07:10','2024-03-11 07:40',160,'auto'),
(6,106,'2024-03-11 08:00','2024-03-11 08:35',200,'manual'),
(7,107,'2024-03-12 06:00','2024-03-12 06:15',110,'auto'),
(8,108,'2024-03-12 07:20','2024-03-12 07:35',95,'manual'),
(9,109,'2024-03-12 08:00','2024-03-12 08:20',130,'auto'),
(10,110,'2024-03-13 06:00','2024-03-13 06:18',125,'auto'),
(11,101,'2024-03-13 07:00','2024-03-13 07:25',140,'manual'),
(12,102,'2024-03-14 09:00','2024-03-14 09:30',155,'auto');

INSERT INTO alerts VALUES
(1,'D01','2024-03-10 10:10','low_moisture','Moisture dropped below threshold'),
(2,'D03','2024-03-10 11:00','device_inactive','Sensor not responding'),
(3,'D08','2024-03-11 12:00','low_moisture','Low moisture detected'),
(4,'D11','2024-03-11 14:10','high_temp','Temperature above normal'),
(5,'D12','2024-03-12 22:10','device_inactive','Camera offline'),
(6,'D05','2024-03-12 19:10','low_light','Light level very low'),
(7,'D09','2024-03-13 14:00','low_light','Light intensity low'),
(8,'D04','2024-03-13 10:30','pump_error','Pump pressure unstable'),
(9,'D01','2024-03-13 11:30','low_moisture','Repeated low moisture'),
(10,'D03','2024-03-14 09:00','device_inactive','Sensor remains offline'),
(11,'D10','2024-03-14 20:00','camera_blocked','Camera view obstructed'),
(12,'D06','2024-03-14 21:10','low_light','Low light warning detected');

-- QUERIES

SELECT f.name, COUNT(field_id) AS total_fields
FROM farmers f
LEFT JOIN fields fl ON f.farmer_id = fl.farmer_id
GROUP BY f.name;

SELECT fl.field_id, fl.crop_type
FROM fields fl
JOIN devices d ON fl.field_id = d.field_id
WHERE d.device_type='moisture_sensor'
AND d.status='inactive';

SELECT DISTINCT d.device_id, d.device_type
FROM devices d
JOIN alerts a ON d.device_id = a.device_id
WHERE MONTH(a.timestamp)=3 AND YEAR(a.timestamp)=2024;

SELECT field_id, SUM(water_used_ltrs) AS total_water
FROM irrigation_log
GROUP BY field_id
ORDER BY total_water DESC;

SELECT f.name
FROM farmers f
JOIN fields fl ON f.farmer_id = fl.farmer_id
JOIN irrigation_log il ON fl.field_id = il.field_id
WHERE il.triggered_by='manual'
GROUP BY f.name
HAVING COUNT(*) >= 2;

SELECT fl.field_id, sd.moisture_level
FROM fields fl
JOIN devices d ON fl.field_id = d.field_id
JOIN sensor_data sd ON d.device_id = sd.device_id
WHERE sd.moisture_level > 40;

SELECT fl.field_id, MAX(sd.temperature) AS max_temp
FROM fields fl
JOIN devices d ON fl.field_id = d.field_id
JOIN sensor_data sd ON d.device_id = sd.device_id
GROUP BY fl.field_id;

SELECT device_id, field_id
FROM devices
WHERE device_type='camera'
AND install_date < '2024-01-20';

SELECT f.name,
       MONTH(il.start_time) AS month,
       SUM(il.water_used_ltrs) AS total_used
FROM farmers f
JOIN fields fl ON f.farmer_id = fl.farmer_id
JOIN irrigation_log il ON fl.field_id = il.field_id
GROUP BY f.name, month
ORDER BY month;

SELECT d.device_id, COUNT(a.alert_id) AS alert_count
FROM devices d
LEFT JOIN alerts a ON d.device_id = a.device_id
GROUP BY d.device_id;

SELECT field_id
FROM devices
WHERE device_type IN ('camera','light')
GROUP BY field_id
HAVING COUNT(DISTINCT device_type)=2;

SELECT fl.field_id,
       AVG(sd.moisture_level) AS avg_moisture,
       AVG(sd.temperature) AS avg_temp,
       AVG(sd.ph_level) AS avg_ph
FROM fields fl
JOIN devices d ON fl.field_id = d.field_id
JOIN sensor_data sd ON d.device_id = sd.device_id
GROUP BY fl.field_id;

SELECT DISTINCT il.field_id
FROM irrigation_log il
JOIN fields fl ON il.field_id = fl.field_id
JOIN devices d ON fl.field_id = d.field_id
JOIN alerts a ON d.device_id = a.device_id
WHERE il.triggered_by='auto'
AND a.alert_type='low_moisture';

SELECT DISTINCT f.name
FROM farmers f
JOIN fields fl ON f.farmer_id = fl.farmer_id
JOIN devices d ON fl.field_id = d.field_id
JOIN sensor_data sd ON d.device_id = sd.device_id
WHERE sd.temperature > 32;

SELECT DISTINCT f.name
FROM farmers f
JOIN fields fl ON f.farmer_id = fl.farmer_id
JOIN devices d ON fl.field_id = d.field_id
JOIN sensor_data sd ON d.device_id = sd.device_id
WHERE sd.temperature > 32;

SET SQL_SAFE_UPDATES=0;

DELETE FROM devices
WHERE status='inactive'
AND install_date < '2024-01-01';

SELECT fi.field_id, f.name AS farmer_name, a.alert_type, a.timestamp
FROM ALERTS a
JOIN DEVICES d ON a.device_id = d.device_id
JOIN FIELDS fi ON d.field_id = fi.field_id
JOIN FARMERS f ON fi.farmer_id = f.farmer_id
WHERE a.timestamp >= NOW() - INTERVAL 1 DAY;

SELECT d.field_id, ROUND(AVG(s.moisture_level), 2) AS avg_moisture
FROM SENSOR_DATA s
JOIN DEVICES d ON s.device_id = d.device_id
GROUP BY d.field_id
ORDER BY avg_moisture DESC
LIMIT 5;

SELECT device_id, field_id
FROM DEVICES;

SELECT DISTINCT f.name, fi.field_id, s.ph_level
FROM SENSOR_DATA s
JOIN DEVICES d ON s.device_id = d.device_id
JOIN FIELDS fi ON d.field_id = fi.field_id
JOIN FARMERS f ON fi.farmer_id = f.farmer_id
WHERE s.ph_level < 6.5 OR s.ph_level > 7.5;

SELECT fi.field_id, f.name AS farmer_name
FROM FIELDS fi
JOIN FARMERS f ON fi.farmer_id = f.farmer_id
WHERE fi.field_id NOT IN (
    SELECT DISTINCT field_id
    FROM IRRIGATION_LOG
    WHERE start_time >= NOW() - INTERVAL 7 DAY
);



