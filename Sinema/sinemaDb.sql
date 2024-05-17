CREATE DATABASE IF NOT EXISTS sinemaDb;
use sinemaDb;

-- FilmTuru Tablosu
CREATE TABLE  FilmTuru (
    FilmTuruID INT AUTO_INCREMENT PRIMARY KEY,
    TurAdi VARCHAR(255)
);

-- Film Tablosu
CREATE TABLE  Film (
    FilmID INT AUTO_INCREMENT PRIMARY KEY,
    FilmAdi VARCHAR(255),
    Yonetmen VARCHAR(255),
    VizyonTarihi DATE,
    FilmTuruID INT,
    FOREIGN KEY (FilmTuruID) REFERENCES FilmTuru(FilmTuruID)
);

-- Salon Tablosu
CREATE TABLE  Salon (
    SalonID INT AUTO_INCREMENT PRIMARY KEY,
    SalonAdi VARCHAR(255),
    KoltukSayisi INT
);

-- Seans Tablosu
CREATE TABLE Seans (
    SeansID INT AUTO_INCREMENT PRIMARY KEY,
    FilmID INT,
    SalonID INT,
    SeansSaati TIME,
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID),
    FOREIGN KEY (SalonID) REFERENCES Salon(SalonID)
);

-- Bilet Tablosu
CREATE TABLE Bilet (
    BiletID INT AUTO_INCREMENT PRIMARY KEY,
    SeansID INT,
    KoltukNumarasi INT,
    OdemeTutari DECIMAL(10, 2),
    FOREIGN KEY (SeansID) REFERENCES Seans(SeansID)
);

-- Calisan Tablosu
CREATE TABLE  Calisan (
    CalisanID INT AUTO_INCREMENT PRIMARY KEY,
    Ad VARCHAR(255),
    Soyad VARCHAR(255),
    KullaniciAdi VARCHAR(255),
    Sifre VARCHAR(255),
    Rol ENUM('Admin', 'Personel')
);

-- Resimler Tablosu
CREATE TABLE  Resimler (
    ResimID INT AUTO_INCREMENT PRIMARY KEY,
    FilmID INT,
    ResimURL TEXT,
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID)
);

-- Kampanya Tablosu
CREATE TABLE  Kampanya (
    KampanyaID INT AUTO_INCREMENT PRIMARY KEY,
    KampanyaAdi VARCHAR(255),
    IndirimOrani DECIMAL(5, 2)
);

-- Admin Tablosu
CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    KullaniciAdi VARCHAR(255),
    Sifre VARCHAR(255)
);

-- Musteri Tablosu
CREATE TABLE  Musteri (
    MusteriID INT AUTO_INCREMENT PRIMARY KEY,
    Ad VARCHAR(255),
    Soyad VARCHAR(255),
    Telefon VARCHAR(20),
    Eposta VARCHAR(255)
);

-- Yonetmen Tablosu
CREATE TABLE Yonetmen (
    YonetmenID INT AUTO_INCREMENT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50)
);

-- Oyuncu Tablosu
CREATE TABLE Oyuncu (
    OyuncuID INT AUTO_INCREMENT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50)
);

-- FilmOyuncu Tablosu
CREATE TABLE FilmOyuncu (
    FilmID INT,
    OyuncuID INT,
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID),
    FOREIGN KEY (OyuncuID) REFERENCES Oyuncu(OyuncuID),
    PRIMARY KEY (FilmID, OyuncuID)
);

-- FilmYonetmen Tablosu
CREATE TABLE FilmYonetmen (
    FilmID INT,
    YonetmenID INT,
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID),
    FOREIGN KEY (YonetmenID) REFERENCES Yonetmen(YonetmenID),
    PRIMARY KEY (FilmID, YonetmenID)
);

-- Uye Tablosu
CREATE TABLE  Uye (
    UyeID INT AUTO_INCREMENT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50),
    Email VARCHAR(100),
    Sifre VARCHAR(50)
);

-- UyeBilet Tablosu
CREATE TABLE  UyeBilet (
    UyeID INT,
    BiletID INT,
    FOREIGN KEY (UyeID) REFERENCES Uye(UyeID),
    FOREIGN KEY (BiletID) REFERENCES Bilet(BiletID),
    PRIMARY KEY (UyeID, BiletID)
);

-- Yorum Tablosu
CREATE TABLE  Yorum (
    YorumID INT AUTO_INCREMENT PRIMARY KEY,
    UyeID INT,
    FilmID INT,
    YorumText TEXT,
    YorumTarihi DATETIME,
    FOREIGN KEY (UyeID) REFERENCES Uye(UyeID),
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID)
);

-- Puan Tablosu
CREATE TABLE  Puan (
    PuanID INT AUTO_INCREMENT PRIMARY KEY,
    UyeID INT,
    FilmID INT,
    Puan TINYINT,
    FOREIGN KEY (UyeID) REFERENCES Uye(UyeID),
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID)
);

-- Gosterim Tablosu
CREATE TABLE  Gosterim (
    GosterimID INT AUTO_INCREMENT PRIMARY KEY,
    FilmID INT,
    SalonID INT,
    GosterimTarihi DATETIME,
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID),
    FOREIGN KEY (SalonID) REFERENCES Salon(SalonID)
);

-- Kategori Tablosu
CREATE TABLE  Kategori (
    KategoriID INT AUTO_INCREMENT PRIMARY KEY,
    KategoriAdi VARCHAR(50)
);

-- FilmKategori Tablosu
CREATE TABLE  FilmKategori (
    FilmID INT,
    KategoriID INT,
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID),
    FOREIGN KEY (KategoriID) REFERENCES Kategori(KategoriID),
    PRIMARY KEY (FilmID, KategoriID)
);

-- KampanyaBilet Tablosu
CREATE TABLE  KampanyaBilet (
    KampanyaID INT,
    BiletID INT,
    FOREIGN KEY (KampanyaID) REFERENCES Kampanya(KampanyaID),
    FOREIGN KEY (BiletID) REFERENCES Bilet(BiletID),
    PRIMARY KEY (KampanyaID, BiletID)
);

-- Reklam Tablosu
CREATE TABLE  Reklam (
    ReklamID INT AUTO_INCREMENT PRIMARY KEY,
    ReklamAdi VARCHAR(100),
    BaslangicTarihi DATETIME,
    BitisTarihi DATETIME
);

-- Sponsor Tablosu
CREATE TABLE  Sponsor (
    SponsorID INT AUTO_INCREMENT PRIMARY KEY,
    SponsorAdi VARCHAR(100),
    Iletisim VARCHAR(100)
);

-- ReklamSponsor Tablosu
CREATE TABLE  ReklamSponsor (
    ReklamID INT,
    SponsorID INT,
    FOREIGN KEY (ReklamID) REFERENCES Reklam(ReklamID),
    FOREIGN KEY (SponsorID) REFERENCES Sponsor(SponsorID),
    PRIMARY KEY (ReklamID, SponsorID)
);
