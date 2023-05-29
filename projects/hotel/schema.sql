CREATE TABLE User (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100),
    phone_number VARCHAR(20)
);

CREATE TABLE Hotel (
    hotel_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(200),
    city VARCHAR(50),
    country VARCHAR(50),
    description TEXT
);

CREATE TABLE RoomType (
    room_type_id INT PRIMARY KEY,
    name VARCHAR(50),
    description TEXT
);

CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    room_type_id INT,
    hotel_id INT,
    price_per_night DECIMAL(10, 2),
    availability BOOLEAN,
    FOREIGN KEY (room_type_id) REFERENCES RoomType(room_type_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    user_id INT,
    room_id INT,
    check_in_date DATE,
    check_out_date DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);
