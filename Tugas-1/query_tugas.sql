-- =========================================
-- TUGAS 1: EKSPLORASI DATABASE PERPUSTAKAAN
-- =========================================

-- =========================
-- 1. STATISTIK BUKU (5 QUERY)
-- =========================

-- 1. Total buku
SELECT COUNT(*) AS total_buku 
FROM buku;

-- 2. Total nilai inventaris (harga × stok)
SELECT SUM(harga * stok) AS total_nilai_inventaris 
FROM buku;

-- 3. Rata-rata harga buku
SELECT AVG(harga) AS rata_rata_harga 
FROM buku;

-- 4. Buku termahal
SELECT judul, harga 
FROM buku 
ORDER BY harga DESC 
LIMIT 1;

-- 5. Buku dengan stok terbanyak
SELECT judul, stok 
FROM buku 
ORDER BY stok DESC 
LIMIT 1;


-- =========================
-- 2. FILTER & PENCARIAN (5 QUERY)
-- =========================

-- 6. Buku kategori Programming dengan harga < 100000
SELECT * 
FROM buku 
WHERE kategori = 'Programming' 
AND harga < 100000;

-- 7. Buku dengan judul mengandung "PHP" atau "MySQL"
SELECT * 
FROM buku 
WHERE judul LIKE '%PHP%' 
OR judul LIKE '%MySQL%';

-- 8. Buku terbit tahun 2024
SELECT * 
FROM buku 
WHERE tahun_terbit = 2024;

-- 9. Buku dengan stok antara 5 - 10
SELECT * 
FROM buku 
WHERE stok BETWEEN 5 AND 10;

-- 10. Buku dengan pengarang "Budi Raharjo"
SELECT * 
FROM buku 
WHERE pengarang = 'Budi Raharjo';


-- =========================
-- 3. GROUPING & AGREGASI (3 QUERY)
-- =========================

-- 11. Jumlah buku dan total stok per kategori
SELECT 
    kategori, 
    COUNT(*) AS jumlah_buku,
    SUM(stok) AS total_stok
FROM buku 
GROUP BY kategori;

-- 12. Rata-rata harga per kategori
SELECT 
    kategori, 
    AVG(harga) AS rata_rata_harga
FROM buku 
GROUP BY kategori;

-- 13. Kategori dengan nilai inventaris terbesar
SELECT 
    kategori,
    SUM(harga * stok) AS total_nilai
FROM buku
GROUP BY kategori
ORDER BY total_nilai DESC
LIMIT 1;


-- =========================
-- 4. UPDATE DATA (2 QUERY)
-- =========================

-- 14. Naikkan harga buku Programming 5%
UPDATE buku
SET harga = harga * 1.05
WHERE kategori = 'Programming';

-- 15. Tambah stok 10 untuk buku dengan stok < 5
UPDATE buku
SET stok = stok + 10
WHERE stok < 5;


-- =========================
-- 5. LAPORAN KHUSUS (2 QUERY)
-- =========================

-- 16. Buku yang perlu restocking (stok < 5)
SELECT * 
FROM buku 
WHERE stok < 5;

-- 17. 5 buku termahal
SELECT * 
FROM buku 
ORDER BY harga DESC 
LIMIT 5;