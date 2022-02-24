CREATE TABLE Hotel
(
    hotelNo CHAR(4),
    hotelName VARCHAR,
    city VARCHAR,
    
    PRIMARY KEY(hotelNo)
);

CREATE TABLE Guest
(
    guestNo CHAR(4),
    guestName VARCHAR,
    guestAddress VARCHAR,

    PRIMARY KEY(guestNo)
);

CREATE TABLE Room
(
    roomNo INTEGER,
    hotelNo CHAR(4),
    type VARCHAR,
    price INTEGER,

    PRIMARY KEY(roomNo, hotelNo),
    FOREIGN KEY(hotelNo) REFERENCES Hotel(hotelNo),

    CHECK(type IN('Single', 'Double', 'Family')),
    CHECK(price > 9 AND price < 101),
    CHECK(roomNo > 0 AND roomNo < 121)
);

CREATE  TABLE Booking
(
    hotelNo CHAR(4),
    guestNo CHAR(4),
    dateFrom DATE,
    dateTo DATE,
    roomNo INTEGER,

    PRIMARY KEY(hotelNo, guestNo, dateFrom),
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo),
    FOREIGN KEY (guestNo) REFERENCES Guest(guestNo),
    FOREIGN KEY (roomNo, hotelNo) REFERENCES Room(roomNo, hotelNo),

    CHECK(dateFrom > CURRENT_DATE),
    CHECK(dateTo > CURRENT_DATE AND dateTo > dateFrom)
);

INSERT INTO Hotel VALUES('HT01', 'La Luna (Difunto)', 'Cali');

INSERT INTO Guest VALUES('0001', 'Andres Felipe', 'Calle 100 #43-21');
INSERT INTO Guest VALUES('0002', 'Manila Rodríguez', 'Cra 16 #24-12');
INSERT INTO Guest VALUES('0003', 'Ivan Duque', 'Calle 80 #89-43');
INSERT INTO Guest VALUES('0004', 'Alex Char', 'Calle 4 #3-11');
INSERT INTO Guest VALUES('0005', 'Tony Stark', 'Cra 32 #4-26');
INSERT INTO Guest VALUES('0006', 'Sherlock Holmes', 'Calle 5 #5-55');
INSERT INTO Guest VALUES('0007', 'Gerard Piqué', 'Calle 14 #6-2');
INSERT INTO Guest VALUES('0008', 'Shakira Shakira', 'Cra 17 #18-7');
INSERT INTO Guest VALUES('0009', 'Clifford', 'Cra 56 #5-18');
INSERT INTO Guest VALUES('0010', 'Ben Tenyson', 'Calle 79 #6-21');
