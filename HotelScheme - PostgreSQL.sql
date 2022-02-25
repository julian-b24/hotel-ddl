CREATE TABLE Hotel
(
    hotelNo INTEGER,
    hotelName VARCHAR,
    city VARCHAR,

    PRIMARY KEY(hotelNo)
);

CREATE TABLE Guest
(
    guestNo INTEGER,
    guestName VARCHAR,
    guestAddress VARCHAR,

    PRIMARY KEY(guestNo)
);

CREATE TABLE Room
(
    roomNo INTEGER,
    hotelNo INTEGER,
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
    hotelNo INTEGER,
    guestNo INTEGER,
    dateFrom DATE,
    dateTo DATE,
    roomNo INTEGER,

    PRIMARY KEY(hotelNo, guestNo, dateFrom),
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo),
    FOREIGN KEY (guestNo) REFERENCES Guest(guestNo),
    FOREIGN KEY (roomNo, hotelNo) REFERENCES Room(roomNo, hotelNo),

    CHECK(dateFrom >= CURRENT_DATE),
    CHECK(dateTo >= CURRENT_DATE AND dateTo >= dateFrom)
);

INSERT INTO Hotel VALUES(1, 'La Luna', 'Cali');
INSERT INTO Hotel VALUES(2, 'Muito Bueno', 'Bucaramanga');
INSERT INTO Hotel VALUES(3, 'Muito Malo', 'Bucaramanga');
INSERT INTO Hotel VALUES(4, 'Não seja um pau no cu', 'Bogotá');
INSERT INTO Hotel VALUES(5, 'Pacoça', 'Bogotá');
INSERT INTO Hotel VALUES(6, 'El Sol', 'Cali');
INSERT INTO Hotel VALUES(7, 'RedVile', 'Medellín');
INSERT INTO Hotel VALUES(8, 'Bistrot Chez Rémy', 'Bogotá');
INSERT INTO Hotel VALUES(9, 'Possum', 'Popayán');
INSERT INTO Hotel VALUES(10, 'Springs', 'Popayán');

INSERT INTO Guest VALUES(1, 'Andrés Felipe', 'Calle 100 #43-21');
INSERT INTO Guest VALUES(2, 'Manila Rodríguez', 'Cra 16 #24-12');
INSERT INTO Guest VALUES(3, 'Iván Duque', 'Calle 80 #89-43');
INSERT INTO Guest VALUES(4, 'Álex Char', 'Calle 4 #3-11');
INSERT INTO Guest VALUES(5, 'Tony Stark', 'Cra 32 #4-26');
INSERT INTO Guest VALUES(6, 'Sherlock Holmes', 'Calle 5 #5-55');
INSERT INTO Guest VALUES(7, 'Gerard Piqué', 'Calle 14 #6-2');
INSERT INTO Guest VALUES(8, 'Shakira', 'Cra 17 #18-7');
INSERT INTO Guest VALUES(9, 'Clifford', 'Cra 56 #5-18');
INSERT INTO Guest VALUES(10, 'Ben Tenyson', 'Calle 79 #6-21');

INSERT INTO Room VALUES(1, 1, 'Single', 25);
INSERT INTO Room VALUES(1, 2, 'Double', 50);
INSERT INTO Room VALUES(1, 3, 'Family', 75);
INSERT INTO Room VALUES(1, 4, 'Single', 25);
INSERT INTO Room VALUES(1, 5, 'Single', 25);
INSERT INTO Room VALUES(1, 6, 'Double', 50);
INSERT INTO Room VALUES(1, 7, 'Double', 50);
INSERT INTO Room VALUES(1, 8, 'Family', 75);
INSERT INTO Room VALUES(1, 9, 'Family', 75);
INSERT INTO Room VALUES(1, 10, 'Single', 100);

INSERT INTO Booking VALUES(1, 1, to_date('26 Feb 2022', 'DD Mon YYYY'), to_date('27 Feb 2022', 'DD Mon YYYY'), 1);
INSERT INTO Booking VALUES(2, 2, to_date('27 Feb 2022', 'DD Mon YYYY'), to_date('28 Feb 2022', 'DD Mon YYYY'), 1);
INSERT INTO Booking VALUES(3, 3, to_date('01 Mar 2022', 'DD Mon YYYY'), to_date('02 Mar 2022', 'DD Mon YYYY'), 1);
INSERT INTO Booking VALUES(4, 4, to_date('02 Mar 2022', 'DD Mon YYYY'), to_date('03 Mar 2022', 'DD Mon YYYY'), 1);
INSERT INTO Booking VALUES(5, 5, to_date('03 Mar 2022', 'DD Mon YYYY'), to_date('04 Mar 2022', 'DD Mon YYYY'), 1);
INSERT INTO Booking VALUES(6, 6, to_date('04 Mar 2022', 'DD Mon YYYY'), to_date('05 Mar 2022', 'DD Mon YYYY'), 1);
INSERT INTO Booking VALUES(7, 7, to_date('05 Mar 2022', 'DD Mon YYYY'), to_date('06 Mar 2022', 'DD Mon YYYY'), 1);
INSERT INTO Booking VALUES(8, 8, to_date('06 Mar 2022', 'DD Mon YYYY'), to_date('07 Mar 2022', 'DD Mon YYYY'), 1);
INSERT INTO Booking VALUES(9, 9, to_date('07 Mar 2022', 'DD Mon YYYY'), to_date('08 Mar 2022', 'DD Mon YYYY'), 1);
INSERT INTO Booking VALUES(10, 10, to_date('08 Mar 2022', 'DD Mon YYYY'), to_date('09 Mar 2022', 'DD Mon YYYY'), 1);