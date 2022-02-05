CREATE DATABASE Sklep_odziezowy;
USE Sklep_odziezowy;

-- pkt. 2 - tabela1 - dostawcy
CREATE TABLE Dostawcy(
	ProducentID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nazwa_producenta VARCHAR(255) UNIQUE,
    Adres_producenta CHAR(40) NOT NULL,
    NIP_producenta BIGINT(10) UNIQUE,
    Data_podpisania_umowy DATE NOT NULL
);

-- pkt. 3 - tabela2 - produkty - aby móc lepiej powiązać tabelę dostawców z produktami dodałam kolumnę ProducentID
CREATE TABLE Produkty(
	ProduktID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ProducentID INTEGER NOT NULL,
    Nazwa_producenta VARCHAR(255) NOT NULL,
    Nazwa_produktu VARCHAR(255) NOT NULL,
    Opis_produktu TEXT DEFAULT NULL,
    Cena_zakupu_netto FLOAT DEFAULT NULL,
    Cena_zakupu_brutto FLOAT DEFAULT NULL,
    Cena_sprzedazy_netto FLOAT DEFAULT NULL,
    Cena_sprzedazy_brutto FLOAT DEFAULT NULL,
    Procent_VAT_sprzedazy FLOAT DEFAULT 1.23
);

-- pkt. 4 - tabela3 - zamówienia
CREATE TABLE Zamowienia(
	ZamowienieID INTEGER PRIMARY KEY AUTO_INCREMENT,
    KlientID INTEGER NOT NULL,
    ProduktID INTEGER NOT NULL,
    Data_zamowienia DATE NOT NULL
);

-- pkt. 5 - tabela4 - klienci 
/*kolumna ZamowienieID wydaje mi się w tym przypadku zbędna, 
ponieważ generowałaby duplikowanie poszczególnych rekordów w tabeli klienci*/
CREATE TABLE Klienci(
	KlientID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Imie VARCHAR(255) NOT NULL,
    Nazwisko VARCHAR(255) NOT NULL,
    Adres VARCHAR(255) DEFAULT 'nie podano'
);

-- pkt.6 - uzupełnianie danych w tabelach
INSERT INTO Dostawcy 
VALUES (ProducentID, 'CottonWorld', 'ul. Brzozowa 8, Warszawa',5683216549, '2018-05-02'),
(ProducentID, 'Silknessa', 'Al. Konstytucji 32, Gdańsk',4987894451, '2019-12-10'),
(ProducentID, 'Clothes&You', 'Plac Andrzeja 12a, Szczecin',3692581470, '2019-02-15'),
(ProducentID, 'Blueline', 'ul. Tekstylna 125, Tuszyn',6549517535, '2020-02-19');

INSERT INTO Produkty
VALUES (ProduktID, 3, 'Clothes&You', 'Tunika szara', 'Tunika szara z dłuższym tyłem. Luźny fason. Wykonana z gładkiej, jednobarwnej dzianiny.', 31.17, 31.17*1.23, 47.96, 59.00, DEFAULT),
(ProduktID, 4, 'Blueline', 'Spodnie niebieskie', 'Granatowe spodnie jeansowe z podwyższonym stanem. Zapinane na suwak i guzik, z kieszeniami', 73.46, 73.46*1.23, 113.01, 139.00, DEFAULT),
(ProduktID, 3, 'Clothes&You', 'Tunika czerwona', 'Tunika czerwona, bawełniania, z wiązaniem w pasie', 25.90, 25.90*1.23, 39.84, 49.00, DEFAULT),
(ProduktID, 1, 'Cottonworld', 'Kardigan z kapturem', 'Ciepły kardigan z kapturem. Prosty krój bez zapięcia.', 52.32, 52.32*1.23, 80.49, 99.00, DEFAULT),
(ProduktID, 2, 'Silknessa', 'Spodnie czarne', DEFAULT, 52.32, 52.32*1.23, 80.49, 99.00, DEFAULT),
(ProduktID, 3, 'Clothes&You', 'Sukienka dresowa', 'Khaki sukienka bawełniana, z kapturem i sznurkowym wiązaniem przy dekolcie', 47.03, 47.03*1.23, 72.36, 89.00, DEFAULT),
(ProduktID, 1, 'CottonWorld', 'Legginsy czarne', DEFAULT, 18.50, 18.50*1.23, 28.46, 35.00, DEFAULT),
(ProduktID, 4, 'Blueline', 'Sukienka biała', 'Biała sukienka z delikatnej dzianyny, ażurowa, bez rękawów.', 57.60, 57.60*1.23, 88.62, 109.00, DEFAULT),
(ProduktID, 4, 'Blueline', 'Tunika zielona', DEFAULT, 25.90, 25.90*1.23, 39.84, 49.00, DEFAULT),
(ProduktID, 2, 'Silknessa', 'Sukienka wieczorowa', 'Czarna, elegancka sukienka z drapowaniem. Głęboki dekolt w kształcie litery V.', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT),
(ProduktID, 1, 'Cottonworld', 'Spodnie bawełnianie', DEFAULT, 47.03, 47.03*1.23, 72.36, 89.00, DEFAULT),
(ProduktID, 4, 'Blueline', 'Bluzka ze stójką', 'Asymetryczna bluzka nietoperz w kolorze beżowym. Ze stójką przy dekolcie.', 52.32, 52.32*1.23, 80.49, 99.00, DEFAULT),
(ProduktID, 4, 'Blueline', 'Bluzka swetrowa', 'Luźna, swetrowa bluzka damska w kolorze pudrowym, z ażurową wstawką na przodzie.', 52.32, 52.32*1.23, 80.49, 99.00, DEFAULT),
(ProduktID, 1, 'Cottonworld', 'Legginsy', DEFAULT, 18.50, 18.50*1.23, 28.46, 35.00, DEFAULT),
(ProduktID, 1, 'Cottonworld', 'Sukienka prążkowana', 'Czarna, mini sukienka na cienkich nie regulowanych ramiączkach.', 41.75, 41.75*1.23, 64.23, 79.00, DEFAULT),
(ProduktID, 1, 'Cottonworld', 'T-shirt neonowy', DEFAULT, 18.50, 18.50*1.23, 28.46, 35.00, DEFAULT),
(ProduktID, 2, 'Silknessa', 'T-shirt czerwony', DEFAULT, 20.61, 20.61*1.23, 31.71, 39.00, DEFAULT),
(ProduktID, 2, 'Silknessa', 'Spodnie karmelowe', 'Eleganckie spodnie eko skóra karmelowe', 73.46, 73.46*1.23, 113.01, 139.00, DEFAULT),
(ProduktID, 2, 'Silknessa', 'Spodnie miętowe', 'Eleganckie spodnie w kant z paskiem niebieskie', 57.60, 57.60*1.23, 88.62, 109.00, DEFAULT),
(ProduktID, 4, 'Blueline', 'T-shirt grafitowy', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO Zamowienia
VALUES (ZamowienieID, 6, 15, '2021-04-16'),
(ZamowienieID, 10, 12, '2021-04-16'),
(ZamowienieID, 1, 2, '2021-04-18'),
(ZamowienieID, 9, 15, '2021-04-24'),
(ZamowienieID, 6, 5, '2021-04-26'),
(ZamowienieID, 8, 20, '2021-04-27'),
(ZamowienieID, 2, 3, '2021-05-02'),
(ZamowienieID, 7, 19, '2021-05-05'),
(ZamowienieID, 9, 6, '2021-05-06'),
(ZamowienieID, 3, 13, '2021-05-07');

INSERT INTO Klienci
VALUES (KlientID, 'Joanna', 'Pasterska', 'ul. Prosta 5/2, Chełm'),
(KlientID, 'Angelika', 'Kot', 'ul. Sobieskiego 12, Mielec'),
(KlientID, 'Izabela', 'Łęcka', 'ul. Kosynierów 16b/3, Katowice'),
(KlientID, 'Beata', 'Słodkowska', 'Mokra Prawa 76, Mokra'),
(KlientID, 'Stanisław', 'Dereń', 'ul. Gdańska 12/1, Andrychów'),
(KlientID, 'Wioletta', 'Paskuda', 'Al. Róż 56, Grajewo'),
(KlientID, 'Marcin', 'Klos', 'ul. Tulipanów 15f/123, Bydgoszcz'),
(KlientID, 'Irmina', 'Nowak', 'ul. Przybysławskiego 8, Kup'),
(KlientID, 'Joanna', 'Sałacka', 'Al. Jana Pawła II 10/9, Częstochowa'),
(KlientID, 'Arkadiusz', 'Żbik', 'Rynek 16, Szczawnica');

-- pkt. 7 - połączenie kolumn
ALTER TABLE Produkty
ADD CONSTRAINT FK_producent FOREIGN KEY (ProducentID) REFERENCES Dostawcy(ProducentID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Zamowienia
ADD CONSTRAINT FK_produkt FOREIGN KEY (ProduktID) REFERENCES Produkty(ProduktID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Zamowienia
ADD CONSTRAINT FK_klient FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- pkt. 8
SELECT p.ProduktID, p.Nazwa_producenta, p.Nazwa_produktu, p. Cena_zakupu_netto, Cena_zakupu_brutto, Cena_sprzedazy_netto, p.Cena_sprzedazy_brutto, p.Procent_VAT_sprzedazy 
FROM Produkty AS p, Dostawcy AS d
WHERE p.ProducentID = d.ProducentID
AND d.ProducentID = 1;

-- pkt.9
SELECT p.ProduktID, p.Nazwa_producenta, p.Nazwa_produktu, p. Cena_zakupu_netto, Cena_zakupu_brutto, Cena_sprzedazy_netto, p.Cena_sprzedazy_brutto, p.Procent_VAT_sprzedazy 
FROM Produkty AS p, Dostawcy AS d
WHERE p.ProducentID = d.ProducentID
AND d.ProducentID = 1
ORDER BY p.Nazwa_produktu;

-- pkt. 10
SELECT ROUND(AVG(Cena_zakupu_netto), 2) AS 'Srednia cena zakupu' 
FROM Produkty AS p, Dostawcy AS d
WHERE p.ProducentID = d.ProducentID
AND d.ProducentID = 1;

-- pkt.11
SELECT d.ProducentID, p.ProduktID, p.Nazwa_produktu, 'Tanie' AS 'Grupa cenowa', d.Nazwa_producenta
FROM Dostawcy AS d, Produkty AS p
WHERE d.ProducentID = p.ProducentID
AND Cena_zakupu_netto <= 
(SELECT AVG(Cena_zakupu_netto) FROM Produkty
WHERE p.ProducentID = 1)
UNION
SELECT d.ProducentID, p.ProduktID, p.Nazwa_produktu, 'Drogie' AS 'Grupa cenowa', d.Nazwa_producenta
FROM Dostawcy AS d, Produkty AS p
WHERE d.ProducentID = p.ProducentID
AND Cena_zakupu_netto > 
(SELECT AVG(Cena_zakupu_netto) FROM Produkty
WHERE p.ProducentID = 1);

-- pkt. 12
SELECT DISTINCT p.Nazwa_produktu AS 'Produkty zamowione' 
FROM Produkty AS p
RIGHT JOIN Zamowienia AS z
ON p.ProduktID = z.ProduktID;

-- pkt.13
SELECT p.Nazwa_produktu AS 'Produkty zamowione' 
FROM Produkty AS p
RIGHT JOIN Zamowienia AS z
ON p.ProduktID = z.ProduktID
LIMIT 5;

-- pkt. 14
-- wartość sprzedaży poszczególnych zamówień
SELECT z.ZamowienieID, z.ProduktID, p.Cena_sprzedazy_brutto 
FROM Zamowienia AS z
JOIN Produkty AS p
ON z.ProduktID = p.ProduktID
ORDER BY z.ZamowienieID;

-- całkowita wartość wszystkich zamówień
SELECT SUM(Cena_sprzedazy_brutto) AS 'Total sprzedaz' 
FROM Zamowienia AS z
JOIN Produkty AS p
ON z.ProduktID = p.ProduktID;

-- pkt. 15
SELECT * FROM Zamowienia AS z
JOIN Produkty AS p
ON z.ProduktID=p.ProduktID
ORDER BY z.Data_zamowienia;

-- pkt. 16
SELECT * FROM Produkty
WHERE Opis_produktu IS NULL OR Cena_zakupu_netto IS NULL OR Cena_zakupu_brutto IS NULL
OR Cena_sprzedazy_netto IS NULL OR Cena_sprzedazy_brutto IS NULL;

-- pkt. 17
SELECT z.ProduktID, COUNT(*) AS 'Ilosc zamowien', p.Nazwa_produktu, p.Cena_sprzedazy_brutto 
FROM Produkty AS p, Zamowienia AS z
WHERE z.ProduktID = p.ProduktID
GROUP BY z.ProduktID
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- pkt. 18
SELECT Data_zamowienia AS 'Data max ilosci zamowien', COUNT(*) AS 'Ilosc zamowien' FROM Zamowienia
GROUP BY Data_zamowienia
ORDER BY COUNT(*) DESC
LIMIT 1;