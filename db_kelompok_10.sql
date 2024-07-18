-- Buat Database
CREATE DATABASE db_kelompok_10;

-- Gunakan Database
USE db_kelompok_10;

-- Create Table members
CREATE TABLE tbl_members (
  id_anggota INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  alamat VARCHAR(255),
  telepon VARCHAR(15)
);

-- Create Table users
CREATE TABLE tbl_users (
  id_pengguna INT AUTO_INCREMENT PRIMARY KEY,
  id_anggota INT,
  nama_pengguna VARCHAR(50) NOT NULL UNIQUE,
  kata_sandi VARCHAR(255) NOT NULL,

  -- Relasi dengan tabel members melalui id_anggota
  FOREIGN KEY (id_anggota) REFERENCES tbl_members(id_anggota)
);

-- Create Table events
CREATE TABLE tbl_events (
  id_acara INT AUTO_INCREMENT PRIMARY KEY,
  nama_acara VARCHAR(100) NOT NULL,
  tanggal_acara DATE NOT NULL,
  lokasi_acara VARCHAR(255)
);

-- Create Table registrations
CREATE TABLE tbl_registrations (
  id_registrasi INT AUTO_INCREMENT PRIMARY KEY,
  id_pengguna INT,
  id_acara INT,
  status VARCHAR(50),

  -- Relasi dengan tabel users dan events melalui id_pengguna dan id_acara
  FOREIGN KEY (id_pengguna) REFERENCES tbl_users(id_pengguna),
  FOREIGN KEY (id_acara) REFERENCES tbl_events(id_acara)
);

-- Create Table articles
CREATE TABLE tbl_articles (
  id_artikel INT AUTO_INCREMENT PRIMARY KEY,
  judul_artikel VARCHAR(100) NOT NULL,
  isi_artikel TEXT NOT NULL,
  tanggal_terbit DATE NOT NULL
);

-- Create Table comments
CREATE TABLE tbl_comments (
  id_komentar INT AUTO_INCREMENT PRIMARY KEY,
  id_artikel INT,
  id_pengguna INT,
  komentar TEXT NOT NULL,
  tanggal_komentar DATE NOT NULL,

  -- Relasi dengan tabel articles dan users melalui id_artikel dan id_pengguna
  FOREIGN KEY (id_artikel) REFERENCES tbl_articles(id_artikel),
  FOREIGN KEY (id_pengguna) REFERENCES tbl_users(id_pengguna)
);

-- Insert Data ke dalam Tabel members
INSERT INTO tbl_members (nama, alamat, telepon) VALUES
('Andika Tulus Pangestu', 'Jl. Merdeka No. 1, Tegal', '081234567890'),
('Mohamad Ali', 'Jl. Sudirman No. 10, Jakarta', '082345678901'),
('Haikal Akhalul Azhar', 'Jl. Pahlawan No. 5, Bandung', '083456789012'),
('Dewi Lestari', 'Jl. Kembang No. 8, Yogyakarta', '084567890123'),
('Eko Prasetyo', 'Jl. Melati No. 12, Surabaya', '085678901234'),
('Fani Rizki', 'Jl. Kenanga No. 6, Semarang', '086789012345'),
('Gita Wulandari', 'Jl. Cempaka No. 7, Medan', '087890123456'),
('Hadi Wijaya', 'Jl. Anggrek No. 9, Bali', '088901234567'),
('Ika Sari', 'Jl. Mawar No. 3, Malang', '089012345678'),
('Joni Prabowo', 'Jl. Dahlia No. 4, Palembang', '090123456789');

-- Insert Data ke dalam Tabel users
INSERT INTO tbl_users (id_anggota, nama_pengguna, kata_sandi) VALUES
(1, 'andika', 'password1'),
(2, 'ali', 'password2'),
(3, 'haikal', 'password3'),
(4, 'dewi', 'password4'),
(5, 'eko', 'password5'),
(6, 'fani', 'password6'),
(7, 'gita', 'password7'),
(8, 'hadi', 'password8'),
(9, 'ika', 'password9'),
(10, 'joni', 'password10');

-- Insert Data ke dalam Tabel events
INSERT INTO tbl_events (nama_acara, tanggal_acara, lokasi_acara) VALUES
('Workshop Teknologi', '2024-08-01', 'Hotel Grand Tegal'),
('Seminar Pendidikan', '2024-08-05', 'Universitas Jakarta'),
('Pelatihan Coding', '2024-08-10', 'Gedung Serbaguna Bandung'),
('Konferensi IT', '2024-08-15', 'Balai Kartini Jakarta'),
('Hackathon Nasional', '2024-08-20', 'Institut Teknologi Surabaya'),
('Pameran Teknologi', '2024-08-25', 'Grand City Mall Surabaya'),
('Forum Akademik', '2024-08-30', 'Universitas Negeri Semarang'),
('Diskusi Publik', '2024-09-05', 'Gedung Balai Kota Medan'),
('Training Profesional', '2024-09-10', 'Hotel Santika Yogyakarta'),
('Webinar Teknologi', '2024-09-15', 'Kampus ITB Bandung');

-- Insert Data ke dalam Tabel registrations
INSERT INTO tbl_registrations (id_pengguna, id_acara, status) VALUES
(1, 1, 'terdaftar'),
(2, 2, 'terdaftar'),
(3, 3, 'terdaftar'),
(4, 4, 'terdaftar'),
(5, 5, 'terdaftar'),
(6, 6, 'terdaftar'),
(7, 7, 'terdaftar'),
(8, 8, 'terdaftar'),
(9, 9, 'terdaftar'),
(10, 10, 'terdaftar');

-- Insert Data ke dalam Tabel articles
INSERT INTO tbl_articles (judul_artikel, isi_artikel, tanggal_terbit) VALUES
('Inovasi Teknologi Terkini', 'Artikel mengenai inovasi terbaru dalam teknologi...', '2024-07-01'),
('Tren Pendidikan Online', 'Artikel tentang tren terbaru dalam pendidikan online...', '2024-07-05'),
('Strategi Pengembangan Karir', 'Artikel mengenai strategi efektif untuk pengembangan karir...', '2024-07-10'),
('Manfaat Pelatihan Coding', 'Artikel yang menjelaskan manfaat dari pelatihan coding...', '2024-07-15'),
('Teknologi di Era Digital', 'Artikel tentang teknologi yang berkembang pesat di era digital...', '2024-07-20'),
('Perkembangan IT di Indonesia', 'Artikel tentang perkembangan industri IT di Indonesia...', '2024-07-25'),
('Keamanan Siber', 'Artikel mengenai pentingnya keamanan siber dan cara menghindarinya...', '2024-08-01'),
('Pendidikan STEM', 'Artikel tentang pentingnya pendidikan STEM dalam dunia modern...', '2024-08-05'),
('Teknologi Blockchain', 'Artikel mengenai penerapan teknologi blockchain...', '2024-08-10'),
('Aplikasi Mobile Terbaru', 'Artikel tentang aplikasi mobile terbaru dan inovatif...', '2024-08-15');

-- Insert Data ke dalam Tabel comments
INSERT INTO tbl_comments (id_artikel, id_pengguna, komentar, tanggal_komentar) VALUES
(1, 1, 'Artikel yang sangat informatif!', '2024-07-02'),
(2, 2, 'Saya setuju dengan pendapat di artikel ini.', '2024-07-06'),
(3, 3, 'Banyak informasi bermanfaat, terima kasih.', '2024-07-11'),
(4, 4, 'Artikel ini membantu saya dalam pelatihan.', '2024-07-16'),
(5, 5, 'Tulisan yang sangat menarik.', '2024-07-21'),
(6, 6, 'Luar biasa, banyak wawasan baru.', '2024-07-26'),
(7, 7, 'Informatif dan mudah dipahami.', '2024-08-02'),
(8, 8, 'Sangat membantu dalam penelitian.', '2024-08-06'),
(9, 9, 'Artikel ini memberikan perspektif baru.', '2024-08-11'),
(10, 10, 'Terima kasih atas informasinya.', '2024-08-16');

-- DATA KELOMPOK 10 ( Buat View untuk menampilkan data akun )
CREATE VIEW v_accounts AS
SELECT tbl_members.id_anggota, tbl_members.nama, tbl_users.nama_pengguna, tbl_users.kata_sandi
FROM tbl_members
JOIN tbl_users ON tbl_members.id_anggota = tbl_users.id_anggota;