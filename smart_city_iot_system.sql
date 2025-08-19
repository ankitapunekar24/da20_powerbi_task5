CREATE TABLE smart_city_iot_data (
    record_id SERIAL PRIMARY KEY,               -- Unique record ID
    device_id VARCHAR NOT NULL,             -- IoT device unique ID
    device_type VARCHAR,                    -- Sensor type (Traffic, Weather, Light, EV Charger, etc.)
    location_name VARCHAR,                 -- Human-readable location
    latitude DECIMAL(9,6),                      -- GPS latitude
    longitude DECIMAL(9,6),                     -- GPS longitude
    timestamp TIMESTAMP NOT NULL,               -- Data collection time
    temperature DECIMAL(5,2),                   -- Temperature (°C)
    humidity DECIMAL(5,2),                      -- Humidity (%)
    air_quality_index INT,                      -- AQI value
    noise_level DECIMAL(5,2),                   -- Noise in dB
    traffic_density INT,                        -- Vehicles counted
    power_consumption DECIMAL(10,2),            -- kWh for EV/Light devices
    light_intensity DECIMAL(6,2),               -- Lumens for smart lights
    rainfall DECIMAL(6,2),                      -- mm of rain
    wind_speed DECIMAL(5,2),                    -- km/h
    system_status VARCHAR,                  -- Active, Inactive, Maintenance
    battery_level DECIMAL(5,2),                 -- % battery left (for remote IoT devices)
    connectivity VARCHAR,                   -- 4G, 5G, WiFi, LoRaWAN
    firmware_version VARCHAR,               -- Device firmware version
    anomaly_detected BOOLEAN DEFAULT FALSE,     -- If anomaly is detected
    last_maintenance_date DATE,                 -- Last maintenance
    remarks TEXT                                -- Additional comments
);

select * from smart_city_iot_data

COPY smart_city_iot_data(
    record_id,
    device_id,
    device_type,
    location_name,
    latitude,
    longitude,
    timestamp,
    temperature,
    humidity,
    air_quality_index,
    noise_level,
    traffic_density,
    power_consumption,
    light_intensity,
    rainfall,
    wind_speed,
    system_status,
    battery_level,
    connectivity,
    firmware_version,
    anomaly_detected,
    last_maintenance_date,
    remarks
)
FROM '/Library/PostgreSQL/17/mydata/smart_city_iot_dataset.csv'
DELIMITER ','
CSV HEADER;

select * from smart_city_iot_data