-- ==============================
-- TUGAS 2 DATABASE PERPUSTAKAAN
-- ==============================

-- 1. BUAT DATABASE
CREATE DATABASE perpustakaan_lengkap;
USE perpustakaan_lengkap;

-- ==============================
-- 2. TABEL KATEGORI
-- ==============================
CREATE TABLE kategori_buku (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL UNIQUE,
    deskripsi TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==============================
-- 3. TABEL PENERBIT
-- ==============================
CREATE TABLE penerbit (
    id_penerbit INT AUTO_INCREMENT PRIMARY KEY,
    nama_penerbit VARCHAR(100) NOT NULL,
    alamat TEXT,
    telepon VARCHAR(15),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==============================
-- 4. TABEL BUKU (RELASI)
-- ==============================
CREATE TABLE buku (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    kode_buku VARCHAR(20) UNIQUE NOT NULL,
    judul VARCHAR(200) NOT NULL,
    id_kategori INT,
    id_penerbit INT,
    pengarang VARCHAR(100),
    tahun_terbit INT,
    harga DECIMAL(10,2),
    stok INT,
    FOREIGN KEY (id_kategori) REFERENCES kategori_buku(id_kategori),
    FOREIGN KEY (id_penerbit) REFERENCES penerbit(id_penerbit)
);

-- ==============================
-- 5. INSERT KATEGORI
-- ==============================
INSERT INTO kategori_buku (nama_kategori, deskripsi) VALUES
('Programming', 'Buku pemrograman'),
('Database', 'Buku database'),
('Web Design', 'Desain web'),
('Networking', 'Jaringan komputer'),
('AI', 'Artificial Intelligence');

-- ==============================
-- 6. INSERT PENERBIT
-- ==============================
INSERT INTO penerbit (nama_penerbit, alamat, telepon, email) VALUES
('Informatika', 'Bandung', '0811', 'info@inf.com'),
('Erlangga', 'Jakarta', '0812', 'erl@erl.com'),
('Andi', 'Yogyakarta', '0813', 'andi@andi.com'),
('Gramedia', 'Jakarta', '0814', 'gram@gram.com'),
('Graha Ilmu', 'Yogyakarta', '0815', 'graha@graha.com');

-- ==============================
-- 7. INSERT BUKU (15 DATA)
-- ==============================
INSERT INTO buku (kode_buku, judul, id_kategori, id_penerbit, pengarang, tahun_terbit, harga, stok) VALUES
('BK-001','Belajar PHP',1,1,'Budi',2023,75000,10),
('BK-002','MySQL Dasar',2,5,'Andi',2022,90000,5),
('BK-003','Laravel Advanced',1,1,'Siti',2024,120000,8),
('BK-004','UI UX Design',3,3,'Dedi',2023,85000,12),
('BK-005','Jaringan Komputer',4,2,'Rina',2023,100000,3),
('BK-006','AI Dasar',5,4,'Ahmad',2024,130000,7),
('BK-007','Python Programming',1,1,'Budi',2023,95000,9),
('BK-008','PostgreSQL',2,5,'Yani',2024,110000,6),
('BK-009','CSS Modern',3,3,'Siti',2023,80000,4),
('BK-010','Cyber Security',4,2,'Rina',2023,115000,2),
('BK-011','Machine Learning',5,4,'Ahmad',2024,140000,5),
('BK-012','JavaScript',1,1,'Budi',2023,90000,11),
('BK-013','Database Lanjut',2,5,'Andi',2024,125000,6),
('BK-014','HTML CSS',3,3,'Dedi',2022,70000,8),
('BK-015','Networking Pro',4,2,'Rina',2024,120000,3);

-- ==============================
-- 8. QUERY JOIN
-- ==============================

-- 1. Tampilkan buku + kategori + penerbit
SELECT 
    b.judul,
    k.nama_kategori,
    p.nama_penerbit
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;

-- 2. Jumlah buku per kategori
SELECT k.nama_kategori, COUNT(*) AS jumlah
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
GROUP BY k.nama_kategori;

-- 3. Jumlah buku per penerbit
SELECT p.nama_penerbit, COUNT(*) AS jumlah
FROM buku b
JOIN penerbit p ON b.id_penerbit = p.id_penerbit
GROUP BY p.nama_penerbit;

-- 4. Detail lengkap buku
SELECT *
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;