-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jul 2021 pada 15.44
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kemanisan`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `jumlah_beli` ()  BEGIN
SELECT sum(if(id_produk = 36, jumlah, 0)) as beli 
FROM db_kemanisan.rb_penjualan_detail;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `jumlah_jual` ()  BEGIN
SELECT sum(if(id_produk = 36, jumlah, 0)) as beli 
FROM db_kemanisan.rb_penjualan_detail;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(5) NOT NULL,
  `tema` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tema_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi_agenda` text COLLATE latin1_general_ci NOT NULL,
  `tempat` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pengirim` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `tgl_posting` date NOT NULL,
  `jam` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dibaca` int(5) NOT NULL DEFAULT 1,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id_album` int(5) NOT NULL,
  `jdl_album` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `album_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `keterangan` text COLLATE latin1_general_ci NOT NULL,
  `gbr_album` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `hits_album` int(5) NOT NULL DEFAULT 1,
  `tgl_posting` date NOT NULL,
  `jam` time NOT NULL,
  `hari` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `background`
--

CREATE TABLE `background` (
  `id_background` int(5) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `background`
--

INSERT INTO `background` (`id_background`, `gambar`) VALUES
(1, 'green');

-- --------------------------------------------------------

--
-- Struktur dari tabel `banner`
--

CREATE TABLE `banner` (
  `id_banner` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `username` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `judul` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sub_judul` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `youtube` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `judul_seo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `headline` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `utama` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `isi_berita` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `keterangan_gambar` text COLLATE latin1_general_ci NOT NULL,
  `hari` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibaca` int(5) NOT NULL DEFAULT 1,
  `tag` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `status` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id_berita`, `id_kategori`, `username`, `judul`, `sub_judul`, `youtube`, `judul_seo`, `headline`, `aktif`, `utama`, `isi_berita`, `keterangan_gambar`, `hari`, `tanggal`, `jam`, `gambar`, `dibaca`, `tag`, `status`) VALUES
(692, 31, 'AdminKemanisan', 'Minuman Kekinian Serba Brown Sugar, Berapa Kalorinya?', '-', '-', 'minuman-kekinian-serba-brown-sugar-berapa-kalorinya', 'N', 'N', 'N', '<p><strong>Liputan6.com, Jakarta</strong>&nbsp;Minuman kekinian serba&nbsp;<a href=\"https://www.liputan6.com/tag/brown-sugar\" target=\"_blank\"><em>brown sugar</em></a>&nbsp;(gula merah) sedang populer di kalangan anak muda. Tak heran, kedai kopi atau teh memasukkan menu tambahan &#39;brown sugar&#39; dalam menu minumannya.</p>\r\n\r\n<p>Lantas berapa kalori&nbsp;<em><a href=\"https://www.liputan6.com/showbiz/read/4097598/gain-brown-eyed-girls-mengaku-pernah-derita-mysophobia-apa-itu\" target=\"_blank\">brown sugar</a></em>? Data Food and Drug Administration mencatat,&nbsp;<em>brown sugar</em>, yang juga dikenal sebagai&nbsp;<em>raw sugar</em>, mengandung kalori lebih sedikit dibanding gula pasir putih.&nbsp;</p>\r\n\r\n<p>Namun, perbedaannya hanya sedikit. Satu sendok teh (4 gram)&nbsp;<em>brown sugar</em>&nbsp;menghasilkan 15 kalori, sedangkan jumlah gula pasir putih dalam takaran serupa memiliki kandungan 16,3 kalori.</p>\r\n\r\n<p><a href=\"https://www.liputan6.com/tekno/read/3931800/gemas-xiaomi-hadirkan-mi-9-se-edisi-brown-bear\" target=\"_blank\"><em>Brown sugar</em></a>&nbsp;merupakan sejenis gula yang dalam proses pembuatannya dibubuhi molase. Molase berupa cairan dari tetes tebu saat membuat gula pasir. Warnanya kecokelatan seperti gula palem, memiliki wangi karamel, dan rasanya legit.</p>\r\n\r\n<hr />\r\n<h2>Kandungan Brown Sugar dalam Minuman</h2>\r\n\r\n<p><a href=\"https://www.liputan6.com/health/read/4143025/minuman-kekinian-serba-brown-sugar-berapa-kalorinya#\"><img alt=\"Kamu Tea Brown Sugar Boba\" src=\"https://cdn1-production-images-kly.akamaized.net/4Qwz4eF9z0_eDfpLHAkCViSpFeA=/640x853/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2875012/original/070471900_1565149532-f9b73750-de18-456b-938e-dc9d75837a01.jpg\" style=\"height:853px; width:640px\" /></a></p>\r\n\r\n<p>Brown Sugar Boba</p>\r\n\r\n<p>Jumlah kalori&nbsp;<em>brown sugar</em>&nbsp;yang ditambahkan ke dalam minuman tentunya bertambah. Dokter Theresia Rina Yunita dari&nbsp;<em>KlikDokter</em>&nbsp;menulis beberapa temuan kandungan&nbsp;<em>brown sugar</em>&nbsp;pada minuman.</p>\r\n\r\n<p>Adapun temuan lengkapnya sebagai berikut:</p>\r\n\r\n<p>1. Segelas&nbsp;<em>brown sugar</em>&nbsp;<em>boba milk tea</em>&nbsp;mengandung 92,5 gram gula (setara dengan 18,5 sendok teh)</p>\r\n\r\n<p>2. Segelas&nbsp;<em>passion fruit green tea</em>&nbsp;(gula 100 persen) mengandung 43 gram gula (setara dengan 8,5 sendok teh)</p>\r\n\r\n<p>3. Segelas&nbsp;<em>winter melon tea</em>&nbsp;mengandung 80 gram gula (setara dengan 16 sendok)</p>\r\n\r\n<p>4. Segelas&nbsp;<em>jasmine green tea with fruit</em>&nbsp;mengandung 42 gram gula (setara dengan 8,5 sendok teh)</p>\r\n\r\n<p>5. Segelas&nbsp;<em>bubble milk tea</em>&nbsp;(gula 100 persen) mengandung 102,5 gram gula (setara dengan 20,5 sendok teh)</p>\r\n\r\n<hr />\r\n<h2>Anjuran Gula Sehari</h2>\r\n\r\n<p><a href=\"https://www.liputan6.com/health/read/4143025/minuman-kekinian-serba-brown-sugar-berapa-kalorinya#\"><img alt=\"Kamu Tea Brown Sugar Boba\" src=\"https://cdn1-production-images-kly.akamaized.net/OTHR6ZOtORTUT7l5e3BtxyxiKxo=/640x853/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2875011/original/061018500_1565149532-f9b73750-de18-456b-938e-dc9d75837a01.jpg\" style=\"height:853px; width:640px\" /></a></p>\r\n\r\n<p>Kamu Tea Brown Sugar Boba</p>\r\n\r\n<p>Menilik jumlah kandungan gula di atas termasuk tinggi. Sebagaimana Peraturan Menteri Kesehatan RI Nomor 30 Tahun 2013 tentang Pencantuman Informasi Kandungan Gula, Garam dan Lemak Serta Pesan Kesehatan Pada Pangan Olahan dan Pangan Siap Saji, anjuran konsumsi gula per orang sehari adalah 10 persen dari total energi (200 kkal) atau setara empat sendok makan per orang per hari (50 gram/orang/hari).</p>\r\n\r\n<p>&quot;Agar tidak berlebihan gula, usahakan untuk memesan minuman&nbsp;<em>brown sugar</em>&nbsp;dengan kadar manis yang lebih sedikit alias<em>&nbsp;less sugar.</em>&nbsp;Cobalah perlahan mengurangi kadar gulanya menjadi 70 persen, kemudian 50 persen, hingga 30 persen,&quot; saran Theresia, dikutip laman&nbsp;<em>KlikDokter</em>.</p>\r\n\r\n<p>&quot;Ini dapat membuat Anda perlahan terbiasa dengan rasa yang kurang manis. Pada akhirnya, konsumsi gula dan kencanduan minuman&nbsp;<em>brown sugar</em>&nbsp;bisa dikendalikan.&quot;</p>\r\n', 'Minuman Kekinian Serba Brown Sugar, Berapa Kalorinya?', 'Selasa', '2021-07-20', '20:09:11', '070471900_1565149532-f9b73750-de18-456b-938e-dc9d75837a01.jpg', 0, 'khasiat-gula-merah', 'Y'),
(688, 19, 'AdminKemanisan', 'Petani Milenial yang Sukses Kreasikan Gula Aren Cair dan Bakwan Kering', 'Kreasi Gula', '-', 'petani-milenial-yang-sukses-kreasikan-gula-aren-cair-dan-bakwan-kering', 'Y', 'Y', 'Y', '<p>Siti Wulandari, petani milenial binaan Polbangtan Yogyakarta yang bergerak di bidang olahan hasil pertanian membaca peluang usaha dalam olahan dan pemasaran gula aren di tengah pandemi Covid-19 yang mematikan semua sektor perekonomian.</p>\r\n\r\n<p>Gula aren berbeda dengan gula Jawa. Selain aromanya lebih khas, umumnya&nbsp;gula aren&nbsp;berwarna lebih gelap dari gula&nbsp;Jawa. Namun demikian seringkali gula aren sering disebut gula merah. Gula ini terbuat dari cairan nira yang dikumpulkan dari pohon aren. Memiliki tekstur yang lebih mudah dihancurkan dan terdapat butiran-butiran kecil yang menyerupai kristal.</p>\r\n\r\n<p>Untuk menambah minat konsumen,&nbsp;Siti&nbsp;mengatakan, dirinya&nbsp;mulai berkreasi dengan menjual gula aren dalam bentuk cair. Tanpa diduga, ternyata peminat gula aren cair cukup banyak.&nbsp;&ldquo;Selain&nbsp;praktis juga memudahkan konsumen untuk dijadikan campuran olahan-olahan masakan,&rdquo; ujarnya, Minggu (2/5/2021).</p>\r\n\r\n<p>Gula aren cair yang dipasarkan secara online sudah merambah dari Yogyakarta ke Surabaya, Madiun, Kediri, Malang, Semarang, Solo, Mataram, Bali, Jepara, Jambi, Sumatra, dan Kalimantan Selatan.</p>\r\n\r\n<p><img alt=\"\" src=\"https://surabayapagi.com/po-content/uploads/Siti_Foto_2.jpg\" style=\"height:354px; width:450px\" /></p>\r\n\r\n<p>Seiring dengan banyaknya permintaan, Siti memberlakukan sistem pre order (PO). Dalam sehari,&nbsp;ia&nbsp;bisa menjual gula aren cair sebanyak 50 botol isi 500 ml, gula aren padat 400 kg/minggu dan gula aren semut 10 kg (50 bungkus)/minggu.&nbsp;Selama masa pandemi Covid-19, omset yang diperoleh Siti mencapai Rp&nbsp;20-25 juta.</p>\r\n\r\n<p>Selain menekuni usaha gula aren, Siti juga membuat produk olahan makanan yaitu bakwan kering lengkap dengan bumbu sambalnya. Saat ini pemasaran bakwan kering ini masih seputaran Yogyakarta.</p>\r\n\r\n<p>Bakwan kering dengan isian sayuran dan telur ini bisa bertahan hingga 5 hari di suhu ruang. Setiap kemasan 175 gram ini di banderol dengan harga Rp6.000. Selama bulan puasa ini Siti tiap hari berhasil menjual 60 bungkus bakwan kering.&nbsp;</p>\r\n\r\n<p>Dengan kreativitas dan pantang menyerah, Siti bisa membuktikan bahwa pandemi Covid-19 bukan sebagai penghalang untuk mendapatkan rejeki.</p>\r\n\r\n<p>Sementara itu menurut Menteri Pertanian,&nbsp;Syahrul Yasin Limpo sudah waktunya petani tidak hanya mengerjakan aktivitas on farm, tapi mampu menuju ke off farm, terutama pasca panen dan olahannya. Banyak yang bisa dikerjakan untuk menaikkan nilai pertanian, khususnya pasca panen.&nbsp;&ldquo;Tuntutannya adalah petani harus berinovasi. Buat terobosan agar hadir produk-produk baru,&quot;&nbsp;katanya.</p>\r\n', '-', 'Minggu', '2021-07-04', '19:15:09', 'Produk2.jpg', 1, 'kreasi-gula', 'Y'),
(689, 31, 'AdminKemanisan', '11 Khasiat Gula Jawa untuk Kesehatan', '-', '-', '11-khasiat-gula-jawa-untuk-kesehatan', 'N', 'N', 'N', '<p>Selama ini gula Jawa atau gula merah hanya dianggap sebagai sekadar pemanis makanan atau minuman padahal juga berkhasiat untuk kesehatan.( Istockphoto/Getty Images/zulfikarilyas)<br />\r\n<br />\r\nJakarta, CNN Indonesia -- Selama ini&nbsp;gula Jawa atau gula merah hanya dianggap sebagai sekadar pemanis makanan atau minuman.<br />\r\nNamun tahukah Anda kalau ternyata gula Jawa juga punya khasiat kesehatan?<br />\r\n<br />\r\nGula jawa adalah gula yang dihasilkan dengan pengolahan secara tradisional dari cairan pohon aren (gula aren).<br />\r\n<br />\r\n<br />\r\nGula yang dihasilkan tidak murni. Warnanya kuning tua hingga kecoklatan dan selalu ada rasa sampingan yang sering berbau harum dan terasa enak, sehingga gula jawa dalam pengobatan lebih disukai daripada gula kristal pabrik yang lebih murni.<br />\r\n<br />\r\nMengutip buku Petunjuk dan Saran Pengobatan Tradisional Tanaman Berkhasiat Indonesia dari J. Kloppenburgh-Versteegh, dibanding pemanis lainnya, gula jawa tergolong sehat untuk dikonsumsi dan bermanfaat. Gula jawa yang bermanfaat memiliki kandungan vitamin C, kalium, fosfor, magnesium, kalsium, dan zat besi di dalamnya.<br />\r\n<br />\r\nSelain itu, ada pula kandungan sejumlah zat filonutrien seperti polifenol, flavonoid, antosianin serta antioksidan. Zat-zat filonutrien tersebut dapat meningkatkan kekebalan tubuh, menambah energi pada tubuh, serta menangkal zat kanker.<br />\r\n<br />\r\nBerikut khasiat gula Jawa:<br />\r\n1. Atasi ngompol pada anak<br />\r\nAnak yang baru berusia satu hingga lima tahun dapat diberi obat berupa ramuan yang terbuat dari tujuh biji duwet yang dihancurkan dengan sedikit gula jawa dan direbus dalam dua cangkir air sampai airnya tersisa setengah. Ramuan ini cukup ampuh untuk mengatasi ngompol.<br />\r\n<br />\r\n2. Mengobati bisul<br />\r\nUntuk &#39;mematangkan&#39; bisul, oleskan racikan kembang telang biru yang ditumbuk dan tambahkan gula jawa pada area yang sakit.</p>\r\n\r\n<p><strong>3. Gangguan perut pada anak yang menyusu</strong><br />\r\nAmbillah tujuh lembar daun waru lengis muda, lalu remas dengan satu gelas air sehingga menjadiseperti selai. Tambahkan gula jawa dengan takaran sebesar biji kacang. Lalu saring ramuan ini dengan kain dan berikan pada anak. Ulangi pemberian ramuan ini hingga sembuh.</p>\r\n\r\n<p><strong>4. Obat merangsang nafsu makan</strong><br />\r\nAnak yang sering demam dan tidak mempunyai nafsu makan dapat diberi bubur yang dibuat dari perut umbi temu lawak yang dicampurkan dengan air dan rebus serta gula merah. Biarkan sampai mengendap.</p>\r\n\r\n<p><strong>5. Mengobati suara serak</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Gunakan segenggam daun randu yang ditumbuk halus lalu saring dan tambahkan gula jawa. Embunkan selama beberapa waktu. Ramuan ini sangat baik untuk mengatasi suara serak dan batuk.</p>\r\n\r\n<p><strong>6. Obat batuk</strong><br />\r\nSetiap hari, makanlah tiga buah pace (mengkudu) yang diperas melalui kain dan ditambah sedikit gula aren/gula jawa agar rasanya enak.<img src=\"https://sps.springserve.com/i?clid=spm&amp;paid=sps&amp;dvid=v&amp;avid=Adsparc_Player&amp;plid={{DEMAND_TAG_ID}}&amp;caid=cnnindonesia.com_AdSparc&amp;kv1={{SIZE}}&amp;kv2=cnnindonesia.com&amp;publisherId=cnnindonesia.com_AdSparc&amp;kv4={{IP}}&amp;siteId={{SUPPLY_TAG_ID}}&amp;priceBid={{BID_PRICE}}&amp;kv3={{UUID}}&amp;kv9={{DURATION}}&amp;kv11={{CACHEBUSTER}}&amp;kv13={{CONTENT_ID}}&amp;kv15={{COUNTRY}}&amp;kv16={{LAT}}&amp;kv17={{LON}}&amp;kv18={{APP_BUNDLE}}&amp;kv19={{DEVICE_ID}}&amp;kv25={{APP_NAME}}&amp;kv27={{USER_AGENT}}&amp;kv28={{DEVICE_MODEL}}_{{DEVICE_MAKE}}&amp;kv29=[ERRORCODE]&amp;kv30=[CONTENTPLAYHEAD]_[ADPLAYHEAD]&amp;kv33=[ASSETURI]&amp;kv34=[VASTVERSIONS]&amp;kv35=[ifa_type]&amp;kv36=[IFA]&amp;kv37=[CLIENTUA]&amp;kv38=[SERVERUA]&amp;kv39=[DEVICEUA]&amp;kv40=[DEVICEIP]&amp;kv41=[LATLONG]&amp;kv42=[DOMAIN]&amp;kv43=[PAGEURL]&amp;kv44=[PLAYERSTATE]&amp;kv45=[PLAYERSIZE]&amp;kv46=[REGULATIONS]&amp;kv47=[ADTYPE]&amp;kv48=[TRANSACTIONID]&amp;kv49=[BREAKPOSITION]&amp;kv50=[APPNAME]&amp;kv51=[PLACEMENTTYPE]&amp;kv54=[LAT]&amp;kv24=Desktop_Video\" /></p>\r\n\r\n<p><strong>7. Mengobati demam usai melahirkan</strong><br />\r\nMinumlah asam lawak sebesar telur burung dara dengan air dan gula merah. Asam bekerja sebagai pencahar dan merangsang sirkulasi darah ke bagian bawah tubuh.</p>\r\n\r\n<p><strong>8. Obat pencahar</strong><br />\r\nObat pencahar yang baik dan tidak berbahaya adalah buah pruim yang dibakar dan diberi gula aren.</p>\r\n\r\n<p><strong>9. Melancarkan buang air besar</strong><br />\r\nJika mengalami masalah mengejan keras saat buang air besar, minumlah seduhan beberapa batang tanaman patikan cina lengkap dengan akarnya serta gula merah.</p>\r\n\r\n<p><strong>10. Mengobati sariawan dalam mulut pada anak</strong><br />\r\nAmbil segenggam bunga belimbing wuluh lalu rebus dalam sedikit air dengan gula merah sampai kental. Tambahkan sedikit brandewijn. Taruh sedikit sirup pada sepotong kain dan besihkan mulut anak dengan kain tersebut.</p>\r\n\r\n<p><strong>11. Mengatasi jerawat batu</strong><br />\r\nBuatlah seperti adonan bubur dari sabun, gula ren, dan asem lawak. Lalu olekan ke area jerawat.</p>\r\n', '11 Khasiat Gula Jawa untuk Kesehatan', 'Selasa', '2021-07-20', '20:29:51', '027467600_1486368608-Gula31.jpg', 0, 'khasiat-gula-merah', 'Y'),
(686, 21, 'AdminKemanisan', 'Harga Tebu Terkini, Juli 2021', 'Harga Tebu di pasar indonesia terbaru', '-', 'harga-tebu-terkini-juli-2021', 'Y', 'Y', 'Y', '<p><strong>JAKARTA, KOMPAS.com</strong>&nbsp;- Asosiasi&nbsp;<a href=\"https://www.kompas.com/tag/petani-tebu\" target=\"_self\">Petani Tebu</a>&nbsp;Rakyat Indonesia (APTRI) berharap pemerintah bisa memberikan perhatian khusus kepada para&nbsp;<a href=\"https://www.kompas.com/tag/petani-tebu\" target=\"_self\">petani tebu</a>.</p>\r\n\r\n<p>Salah satunya adalah dengan menaikkan harga pembelian tebu di tingkat petani yang selama 5 tahun belakangan membutuhkan biaya produksi yang cukup tinggi.</p>\r\n\r\n<p>&quot;Biaya produksi naik sementara kenaikan harga dalam 5 tahun terakhir belum ada. Kami berharap pada musim giling tahun ini ada kebijaksanaan dari Menteri Perdagangan. Mimpi kami semoga harga naik jadi Rp 11.500 per kilogram di tingkat petani,&quot; ujar Ketua Umum Asosiasi Petani Tebu Rakyat Indonesia (APTRI) Soemitro Samadikoem dalam acara Rakernas APTRI yang disiarkan secara virtual, Jumat (9/4/2021).</p>\r\n\r\n<p><strong>Baca juga:&nbsp;<a href=\"https://money.kompas.com/read/2021/04/07/170927726/tidak-dapat-pasokan-gula-rafinasi-sejumlah-industri-mamin-tutup-operasi\" target=\"_self\">Tidak Dapat Pasokan Gula Rafinasi, Sejumlah Industri Mamin Tutup Operasi</a></strong></p>\r\n\r\n<p>Soemitro mengakui sebenarnya para petani pada dasarnya ingin&nbsp;<a href=\"https://www.kompas.com/tag/harga-gula\" target=\"_self\">harga gula</a>&nbsp;bisa murah dengan cara meningkatkan produksi tebu. Namun menurut dia, hal ini susah dicapai karena banyak faktor yang tidak mendukung.</p>\r\n\r\n<p>Misalnya saja untuk mendapatkan pupuk bersubsidi, para petani tebu mengaku sulit. Begitupun dengan pupuk non-subsidi.</p>\r\n\r\n<p>&quot;Sekali lagi, maaf bila keinginan kami terlalu tinggi, namun itu wajar karena sejak 2016 haha gula di tingkat petani masih Rp 9.600,&quot; ucap dia.</p>\r\n', 'Harga_Tebu_Terkini', 'Minggu', '2021-07-04', '15:54:07', 'lahan_tebu.jpg', 1, 'harga-tebu', 'Y'),
(687, 21, 'AdminKemanisan', 'Kiprah Bisnis Gula Aren Jufrizal', 'Cerita Bisnis', '-', 'kiprah-bisnis-gula-aren-jufrizal', 'Y', 'Y', 'Y', '<p><strong>Gula aren semakin diminati pasar. Tak hanya di dalam negeri, pasar ekspor bernilai milyaran rupiah pun siap menanti. &nbsp;Jufrizal salah satu produsen yang jeli mengembangkan produk komoditi ini hingga ke pasar global.</strong></p>\r\n\r\n<p>Kandungan gula aren yang dinilai lebih baik dari gula pasir ataupun gula merah/jawa &nbsp;belakangan ini menjadi kian populer. Selain menjadi pemanis bagi kopi, gula aren juga menjadi bahan baku utama membuat boba yang sedang tren di kalangan pencinta minuman kekinian. Gula aren yang terbuat dari sari atau nira pohon aren dinilai lebih manis dan aromanya lebih kuat dibanding gula jawa.</p>\r\n\r\n<p>Gula aren mengandung antioksidan, kalsium, zinc, zat besi dan potassium juga mengandung serat inulin yang berfungsi &nbsp;menjaga sistem pencernaan karena sifatnya memperlambat penyerapan glukosa dalam tubuh. Gula aren juga aman bagi penderita diabetes karena kadar indeks glikemik yang rendah.</p>\r\n\r\n<p>Dalam perkembangannya gula aren semakin banyak diminati&nbsp; pasar. Tak hanya &nbsp;membidik segmen konsumen perorangan&nbsp; dan industri makanan minuman (mamin) di Indonesia,&nbsp; pasar global pun kini menjadi target pasar bagi para produsen gula aren di tanah air.</p>\r\n\r\n<p>Namun dalam menghadapi pasar global tentu perlu kesiapan dalam hal inovasi produk maupun cara pemasarannya. Dibutuhkan kepandaian membangun kerjasama dengan para<em>&nbsp;stakeholder&nbsp;</em>di dalam negeri maupun dengan pihak di negara tujuan ekspor.</p>\r\n\r\n<p><img alt=\"\" src=\"http://pelakubisnis.com/wp-content/uploads/2020/08/foto-jufrizal-gula-aren-300x239.jpg\" style=\"height:319px; width:400px\" /></p>\r\n\r\n<p>Muhamad Jufrizal bersama Kepala Dinas Perindustrian dan Perdagangan Kota Bogor, Ganjar Gunawan AP yang tengah berkunjung ke kantor LP5MP/Foto: Dok. Pribadi</p>\r\n\r\n<p>Seperti Muhamad Jufrizal, Ketua &nbsp;LP5MP (Lembaga Pengkajian Pemantapan Pelaksanaan Pemberdayaan Masyarakat-red) salah satu penggiat usaha gula aren di Bogor yang telah berhasil membawa produksi arennya menembus pasar ekspor. Mengawali bisnis gula aren sekitar tahun 2011.&nbsp; Saat itu ia baru merintis penanaman pohon aren di Taman Nasional Gunung Haliman Salak, Kebandungan Sukabumi, Jawa Barat. Program penanaman pohon aren ini tak lain ide dari MS Kaban semasa menjabat sebagai Menteri Kehutanan RI. &nbsp;&nbsp;Terjadi sinergi antara dirinya &nbsp;sebagai professional dengan petani setempat menggunakan lahan milik Kementerian Kehutanan. &ldquo;Rencananya kami akan gunakan lahan itu untuk tanaman aren, cokelat dan kemiri. Namun dari hasil&nbsp;<em>meeting</em>&nbsp;dengan masyarakat di sekitar resort, ternyata mereka lebih berkenan kita fokus mengambil hasil nira aren,&rdquo;ungkap Jufrizal kepada pelakubisnis.com.</p>\r\n\r\n<p>Di atas resort 3000 hektar milik negara tersebut, bersama para petani setempat Jufrizal&nbsp;&nbsp; mengambil hasil nira aren. Awalnya hanya berperan sebagai marketing dengan membeli langsung dari petani setempat sudah dalam bentuk gula aren cetak berbungkus daun. Saat itu penetrasi awal ia coba masuk ke pasar-pasar tradisional di wilayah Bogor dan sekitarnya.</p>\r\n\r\n<p>Pada proses penetrasi pasar, di tengah jalan Jufrizal menemukan banyak temuan-temuan baru di lapangan. Menjual gula aren cetak dengan kemasan daun ternyata tampilannya terlihat sangat &nbsp;sederhana dan kurang&nbsp;<em>marketable</em>. Muncul permintaan akan gula semut &ndash;gula aren bubuk&mdash;yang berkualitas. Lalu, ia pun melakukan riset bagaimana bisa menghasilkan gula semut yang berkualitas. &ldquo;Saya beli mesin giling tapi waktu itu pengeringan masih alamiah menggunakan matahari. Dijemur di belakang ruko lama saya. Benar-benar tradisional sampai akhirnya dapat ijin BPOM. Banyak sertifikat kami dapat, dari ijin edar PIRT dan dapat sertifikat halal. Alhasil&nbsp; hingga saat ini kami punya gula aren bubuk, cetak dan cair,&rdquo;papar Sarjana Teknik Industri ini seraya menambahkan, kerjasama kemitraan dengan petani di Sukabumi hingga saat ini sistem&nbsp; beli putus.</p>\r\n\r\n<p>Seiring berjalannya waktu terbukti lebih dari 3 tahun pihaknya berhasil menemukan proses teknologi cetakan gula aren yang keras namun lunak di dalam. Hingga sekarang&nbsp; gula aren yang diproduksinya terkenal tahan lama.</p>\r\n\r\n<p><img alt=\"\" src=\"http://pelakubisnis.com/wp-content/uploads/2020/08/cap-musang-aren-298x300.jpg\" style=\"height:300px; width:298px\" /></p>\r\n\r\n<p>Gula Aren Cap Musang diminati pasar Indonesia bagian timur/Foto: Dok. Pribadi</p>\r\n\r\n<p>Kini banyak merek keluaran LP5MP sudah beredar di pasaran. Ada gula aren merek Cap Musang yang sudah dijual ke banyak ritel di tanah air bahkan sampai ada di Gelael Timika, Papua, Gelael Lampung, Makasar dan beberapa daerah lain di Indonesia.</p>\r\n\r\n<p>Sejauh ini yang membuat usahanya unggul karena Jufrizal sudah memiliki banyak surat ijin dan sertifikat yang membuatnya lebih mudah untuk membesarkan usahanya.</p>\r\n\r\n<p>Singkat cerita 23 Mei 2013, ia menandatangani&nbsp;<em>MoU (memorandum of understanding</em>&ndash;<em>red)</em>&nbsp;yang menyebutkan bahwa ia diperbolehkan memanfaatkan lahan dan memberdayakan masyarakat di Balai Taman Nasional Haliman Salak, Sukabumi &nbsp;untuk meningkatkan kesejahteraan masyarakat sekitar hutan dan sanggup mengelola dan menjaga konservasi lingkungan hidup sekitar hutan.</p>\r\n\r\n<p>Milestone, puncaknya di tahun 2015 ketika usahanya naik kelas. &nbsp;Ia membagi&nbsp;<em>milestone</em>&nbsp;nya ke dalam dua fase. Fase pertama adalah fase merintis usaha, masa bertahan dan masa pengenalan produk ke pasar. &nbsp;Kemudian di fase berikutnya masuk ke masa pandemic namun diakuinya sudah banyak respon dari pasar global. &nbsp;&nbsp;Alhasil, dari kelas UMKM sekarang usahanya &nbsp;sudah di posisi&nbsp; kelas menengah. Karena sudah di posisi kelas menengah bawah selama 5 tahun masa-masa bertahan, sekarang saatnya mulai berkembang.</p>\r\n\r\n<p>Sejumlah sertifikat dari lembaga terkait pun diperoleh. Persisnya Pebruari 2015 ia mendapatkan ijin edar sebagai Pangan Industri Rumah Tangga (PIRT) dari Dinas Kesehatan Kota Bogor. Setahun kemudian mendapat Izin Usaha Industri dari pemerintah Kota Bogor sebagai produsen gula aren yang merupakan salah satu syarat utama mendapat ijin edar dari BPOM.</p>\r\n\r\n<p>Dan per tanggal 31 Mei 2016 ia berhasil mengantongi Serfifikasi Pertanian Organik dari&nbsp;<em>LSO INOFICE (Indonesian Organic Farming Certification)</em>&nbsp;yakni, lembaga sertifikasi pangan organic terhadap lahan petani aren di luar kawasan Taman Nasional Gunung Halimun Salak. Di tahun 2016 juga ia mendapat pengakuan dari pemerintah Jepang bahwa gula LP5MP cocok untuk penderita diabetes.</p>\r\n\r\n<p>Selain itu, &nbsp;gula aren yang produksinya konon terkenal karena teknologi yang ditawarkan terjamin mutu dan tahan lama. &ldquo;Gula cetak &nbsp;kami sebenarnya bisa tahan hingga dua tahun dengan kondisi suhu ruang. Namun sesuai kebijakan dari pemerintah, &nbsp;kami hanya bisa cantumkan kadaluarsa mencapai 1 tahun dengan kondisi suhu ruang,&rdquo;ungkapnya.</p>\r\n\r\n<p>Gula Aren Cetak produksi LP5MP juga diminati para Barista Jakarta. &nbsp;Salah seorang Barista dan seorang narasumber dari &nbsp;perusahaan distribusi mengatakan, &nbsp;Gula Aren Cetak produksi LP5MP berstandar pada kekerasan (tidak mudah lembek), kadar air dibawah 5% dan terpenting lagi ketika mau dibuatkan menjadi gula aren cair, lama pemanasan dan takaran air serta lamanya waktu memasak memenuhi standar pemanis kopi/minuman, dan anehnya konstan selama 2 tahun terakhir rutin order.</p>\r\n\r\n<p>Tak heran bila saat ini usaha gula arennya sudah sampai&nbsp; ke Australia. &nbsp;Saat itu ia dikirim pemerintah untuk melakukan studi sekaligus memperkenalkan gula aren ke Institute for International Trade, The University of Adelaide, Australia. Karena di negara kanguru ini umumnya masih menggunakan gula kelapa (gula merah). Ada skup kerjasama dengan Australia melalui&nbsp;<em>Japan-Australia Economic Partnership Agreement (JAEPA),</em>&nbsp;mengajak kerjasama pengusaha UKM Indonesia untuk &nbsp;membuka pasar ke Australia. Di sana pengusaha Indonesia melakukan studi banding selama 1 bulan untuk mempelajari standar pangan di negara tersebut seperti apa dan bagaimana masuk ke pasar ekspor Australia. Dalam kegiatan ini pengusaha UKM Indonesia mendapat rekomendasi dan pendampingan dari BPOM.</p>\r\n\r\n<p>Perlu diketahui, Jufrizal merupakan UMKM gula aren yang pembimbingan dari BPOM Pusat.&nbsp; Ia juga mendapat ijin berproduksi untuk kebutuhan segmen industri dengan sistem kerjasama&nbsp;<em>OEM (Original Equipment Manufacturers-red)</em>&nbsp;untuk merek apa saja.</p>\r\n\r\n<p><img alt=\"\" src=\"http://pelakubisnis.com/wp-content/uploads/2020/08/gula-aren6-201x300.jpg\" style=\"height:300px; width:201px\" /></p>\r\n\r\n<p>Gula Semut Silva Arenga/Foto: Dok.Pribadi</p>\r\n\r\n<p>Tahun 2017 lalu sebenarnya ia mendapat peluang besar di pasar ekspor. Dimana pasar &nbsp;Tiongkok sempat meminta gula aren dari tempatnya sekitar 20 ton, namun peluang tersebut hilang karena pihak Tiongkok memintanya untuk mencampur gula aren dengan gula rafinasi. &ldquo;Itu yang tidak bisa saya penuhi,&rdquo;tukasnya.</p>\r\n\r\n<p>Dari tempatnya di Ruko Millenium, Tanah Baru Kota Bogor ia membangun banyak item produk gula aren dari gula semut kemasan sachet, kemasan 1 kg, gula aren cair, gula aren cetak hingga bentuk curah &nbsp;dengan menggunakan merek Cap Musang, Cap 99, Cap Silva Arenga dan beberapa merek pesanan (OEM) untuk pasar ekspor seperti ke Malaysia.</p>\r\n\r\n<p>Selain pasar ekspor yang mulai fokus dijajaki pihaknya, Jufrizal juga berkomitmen mengisi segmen pasar di tanah air. Saat ini karena pandemic, kontribusi pasar industri (B2B) &nbsp;masih terbilang sedikit tak sebanding dengan segmen&nbsp;<em>business to customer &ndash;</em>B2C&mdash;yang kontribusinya &nbsp;lebih besar dibanding segmen B2B. &ldquo;Saat ini B2C lebih banyak. Kami buka toko, lewat online, perbandingannya dengan B2B sangat jauh. &nbsp;Situasi pandemic membuat kerjasama B2B banyak tertunda. Seperti mitra industri kecap di Jawa Timur, kami sudah kontrak untuk 5 tahun akhirnya sekarang gak jalan. &nbsp;Biasanya order sampai 50kg, sekarang berhenti,&rdquo;ungkap Jufrizal.</p>\r\n\r\n<p>Diakuinya, di era pandemic seperti sekarang kalau bicara omset, jawabnya sangat fluktuatif. Yang jelas saat ini skala usahanya sudah masuk ke skala menengah yang minimal membutuhkan modal Rp 1&nbsp; milyar. &ldquo;Sebenarnya potensi pasar bisa mencapai Rp600 juta &ndash; 1 milyar/bulan. Saya sudah terima order mencapai Rp1 milyar di masa pandemic ini. Sebelum pandemic &nbsp;malah hanya sekitar Rp 150 juta/bulan, dari semua segmen. Sekarang meningkat Rp1 milyar/bulan. Sudah banyak PO &ndash;<em>pre order</em>&mdash;yang harus kami olah. Sekarang saya sedang menunggu permodalan dari pemerintah untuk naik skala modal. Karena kami harus berani&nbsp;<em>cash</em>&nbsp;untuk belanja modal,&rdquo;papar alumnus Institut Teknik Indonesia (ITI) Serpong Jurusan Teknik Industri ini .</p>\r\n\r\n<p>Untuk saat ini bila bicara modal, menurutnya paling tidak dari asset yang dimiliki seperti jumlah alat-alat, hanya sekitar &nbsp;Rp 1milyar. &nbsp;&ldquo;Masih kecil, harusnya sekarang harus punya modal Rp 5 milyar utk merespon pasar. Seperti Australia saja mereka maunya kita tiap bulan bisa ekspor, Untuk pasar Australia ini sebenarnya tidak terlalu banyak. Cuma gengsinya lumayan bisa masuk kesana. Saya hitung, satu tahun untuk pasar Australia mungkin bisa Rp 1,8 milyar,&rdquo;jelas Jufrizal.</p>\r\n\r\n<p><img alt=\"\" src=\"http://pelakubisnis.com/wp-content/uploads/2020/08/gula-aren5-300x300.jpg\" style=\"height:300px; width:300px\" /></p>\r\n\r\n<p>Gula Aren Cair Silva Arenga banyak digunakan untuk segmen kafe dan resto/Foto: Dok.Pribadi</p>\r\n\r\n<p>Sedangkan &nbsp;saat ini &nbsp;pabrik baru menyanggupi setahun 120 ton dari kapasitas terpasang. Pernah sampai &nbsp;dua shift karena mengejar pesanan B2B yang memesan dalam jumlah banyak dalam waktu singkat. &ldquo;Di tengah pandemic permintaan banyak. Per hari minimal 2 ton untuk cetak.&nbsp; Sekarang sudah &nbsp;mulai menggeliat lagi setelah beberapa bulan sempat kosong. Sampai sekarang segmen B2C saja yang banyak. Untuk segmen B2B paling sekarang ini sekitar 200kg sekali ambil. Seperti kafe-kafe itu biasanya mereka mintanya gula aren cair dan gula aren cetak,&rdquo;kata Jufrizal seraya menyebut permintaan kafe-kafe masih sekitar 10 &ndash; 20 kg/bulan.</p>\r\n\r\n<p>Pengembangan bisnis ke depan rencananya pertama akan melakukan pengembangan pasar ke Australia. Kedua, mengembangkan pasar untuk &nbsp;Eropa dan Amerika. Ketiga mengembangkan gula cetak ke industri-industri lokal yang membutuhkan bahan baku gula aren. Jika dana Rp 5 milyar sudah ada, Jufrizal punya mimpi besar membangun etanol hand sanitizer. &ldquo;Jadi dari pohon aren, &nbsp;airnya bisa untuk proses etanol yang bisa digunakan untuk pangan dan energi,&rdquo;pungkas mantan professional PT Gillete Indonesia ini. []Siti Ruslina</p>\r\n', 'Kisah Pengusaha', 'Minggu', '2021-07-04', '15:54:21', 'gula-aren-silva-774x445.jpg', 1, 'cerita-bisnis', 'Y'),
(690, 31, 'AdminKemanisan', 'Cek Fakta Kesehatan: Gula Merah Lebih Sehat Ketimbang Gula Pasir?', '-', '-', 'cek-fakta-kesehatan-gula-merah-lebih-sehat-ketimbang-gula-pasir', 'Y', 'Y', 'Y', '<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://www.liputan6.com/health/read/4285415/cek-fakta-kesehatan-gula-merah-lebih-sehat-ketimbang-gula-pasir#\"><img alt=\"gula merah\" src=\"https://cdn1-production-images-kly.akamaized.net/Ls1Soeux2c5vNztGO-qJf9jEM2M=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1673994/original/088498900_1502277139-gula_merah.JPG\" style=\"height:360px; width:640px\" /></a></p>\r\n\r\n<p>Gula merah dianggap lebih sehat dibanding gula pasir, benarkah?</p>\r\n\r\n<p><strong>Liputan6.com, Jakarta</strong>&nbsp;<a href=\"https://www.liputan6.com/tag/gula-merah\" target=\"_blank\">Gula merah</a>&nbsp;(<em>brown sugar</em>) kerap dianggap lebih sehat dibanding&nbsp;<a href=\"https://www.liputan6.com/tag/gula-pasir\" target=\"_blank\">gula pasir</a>. Apalagi tren minuman kekinian pun menambahkan gula merah. Tak ayal, minuman serba&nbsp;<em>brown sugar</em>&nbsp;disukai anak muda.</p>\r\n\r\n<p>Certified Nutrition and Wellness Consultant Nutrifood Aldis Ruslialdi menjelaskan, gula merah maupun gula pasir kandungan kalorinya sama.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Setiap satu sendok teh gula pasir dan&nbsp;<a href=\"https://hot.liputan6.com/read/4195321/10-manfaat-gula-merah-untuk-stamina-nutrisinya-bantu-jaga-agar-tetap-stabil\" target=\"_blank\">gula merah</a>&nbsp;mengandung 16 kalori, sedangkan gula merah 15 kalori. Kalori paling tinggi terdapat pada gula batu sebesar 25 kalori.</p>\r\n\r\n<p>&quot;Gula merah lebih sehat daripada gula pasir itu mitos ya. Dari sisi kalorinya hampir sama,&quot; jelas Aldis saat sesi&nbsp;<em>Training Class Nutrifood</em>&nbsp;beberapa hari lalu, ditulis Senin (22/6/2020).</p>\r\n\r\n<p>Dampak dari gula sendiri, lanjut Aldis terkait sindrom metabolik, yang mana terjadi gangguan kesehatan secara bersamaan. Asupan kalori yang tinggi pada jenis gula, seperti gula pasir dan gula merah berisiko diabetes.</p>\r\n\r\n<p>&quot;Yang berbahaya di sini ka asupan kalorinya. Jadi, sebenarnya sama aja sih&nbsp;<em>impact</em>-nya, mau gula merah dan&nbsp;<a href=\"https://www.liputan6.com/bisnis/read/4268523/tekan-harga-gula-pasir-bulog-gelar-operasi-pasar-di-waingapu\" target=\"_blank\">gula pasir</a>,&quot; lanjut Aldis.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<h2>Batasi Asupan Gula</h2>\r\n\r\n<p><a href=\"https://www.liputan6.com/health/read/4285415/cek-fakta-kesehatan-gula-merah-lebih-sehat-ketimbang-gula-pasir#\"><img alt=\"Gula Pasir\" src=\"https://cdn1-production-images-kly.akamaized.net/LEwYYPcMQKQkqdQamk5yQW8X12o=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1498511/original/088191400_1486368771-Gula10.jpg\" style=\"height:360px; width:640px\" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Batasi asupan gula. (iStockphoto)</p>\r\n\r\n<p>Aldis menambahkan, agar aman sebaiknya batasi asupan gula. Hal ini bertujuan agar kadar gula darah tetap stabil.</p>\r\n\r\n<p>&quot;Batasi asupan gula maksimal 50 gram atau setara 4 sendok makan gula per hari. Semua jenis gula yang dianggap lebih baik itu mengandung kalori yang hampir sama,&quot; ujarnya.</p>\r\n\r\n<p>&quot;Tentu saja berbahaya bila dikonsumsi berlebihan, sehingga dapat meningkatkan gula darah dengan cepat.&quot;</p>\r\n\r\n<p>Berdasarkan data&nbsp;United States Department of Agriculture (USDA) perbandingan kalori gula per satu sendok teh di antaranya, gula pasir 16 kalori, gula batu 25 kalori, gula merah 15 kalori, gula halus 10 kalori, icing sugar 10 kalori, dan gula palma atau gula aren</p>\r\n\r\n<hr />\r\n<h2>Gula Rendah Kalori</h2>\r\n\r\n<p><a href=\"https://www.liputan6.com/health/read/4285415/cek-fakta-kesehatan-gula-merah-lebih-sehat-ketimbang-gula-pasir#\"><img alt=\"Gula Pasir\" src=\"https://cdn0-production-images-kly.akamaized.net/c2FPZNW3r_CoSdWBpjM9lxYZECU=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1498501/original/027467600_1486368608-Gula3.jpg\" style=\"height:360px; width:640px\" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Gula rendah kalori. (iStockphoto)</p>\r\n\r\n<p>Untuk mengontrol gula darah, Aldis menyampaikan, Anda bisa mulai mengurangi takaran gula. Apalagi kalau suka makanan dan minuman yang manis.</p>\r\n\r\n<p>&quot;Kalau suka<em>&nbsp;ngemil</em>&nbsp;kue manis, sebaiknya ganti dengan ngemil buah-buahan. Selain itu, perbanyak minum air putih,&quot; terangnya.</p>\r\n\r\n<p>&quot;Pengen mencegah kelebihan gula ya bisa menggantinya dengan gula rendah kalori. Gula rendah kalori juga enggak bikin gigi karies, dan bisa membantu mengendalikan berat badan.&quot;</p>\r\n\r\n<p>Tak hanya mengurangi konsumsi gula, supaya lebih sehat, Aldis menyarankan, terapkan pola makan seimbang dan olahraga teratur.</p>\r\n', 'Cek Fakta Kesehatan: Gula Merah Lebih Sehat Ketimbang Gula Pasir?', 'Selasa', '2021-07-20', '19:58:10', '027467600_1486368608-Gula3.jpg', 0, 'khasiat-gula-merah', 'Y'),
(691, 40, 'AdminKemanisan', 'Serba Gula Merah, 5 Resep Kue Jajanan Pasar yang Manisnya Bikin Nagih', '-', '-', 'serba-gula-merah-5-resep-kue-jajanan-pasar-yang-manisnya-bikin-nagih', 'N', 'Y', 'Y', '<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Serba Gula Merah, 5 Resep Kue Jajanan Pasar yang Manisnya Bikin Nagih\" src=\"https://cdn.idntimes.com/content-images/community/2020/07/img-20200722-012337-f46a1ee207429255ae106711a63c4500_600x400.jpg\" />instagram.com/tiaswidodo</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Gula merah adalah salah satu rempah pelengkap dalam makanan. Tidak hanya makanan yang gurih-gurih, tapi, gula merah juga sering digunakan dalam pembuatan&nbsp;<a href=\"https://www.idntimes.com/tag/kue\" rel=\"noopener\" target=\"_blank\" title=\"kue di Yummy App\">kue</a>.</p>\r\n\r\n<p>Bahkan, bisa dibilang&nbsp;<a href=\"https://www.yummy.co.id/blog/cari/gula%20merah?utm_source=IDNTimesRecipe\" rel=\"noopener\" target=\"_blank\" title=\"gula merah\">gula merah</a>&nbsp;adalah salah satu bahan baku yang hampir selalu digunakan untuk jajanan pasar yang memiliki rasa manis. Nah, berikut resep kue jajanan pasar yang menggunakan gula merah dan bisa kamu bikin sendiri!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>1. Kue mangkuk gula merah</h2>\r\n\r\n<p><img alt=\"Serba Gula Merah, 5 Resep Kue Jajanan Pasar yang Manisnya Bikin Nagih\" src=\"https://cdn.idntimes.com/content-images/community/2020/07/106043541-269387420991448-7033989092383182323-n-61289103332af5d5f92b73507121d933.jpg\" />instagram.com/gisry</p>\r\n\r\n<p><strong>Bahan-bahan:&nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li>200 gr gula merah dihaluskan</li>\r\n	<li>200 ml air</li>\r\n	<li>3 helai daun pandan</li>\r\n	<li>1/4 sdt garam</li>\r\n	<li>1/4 sdt vanilla bubuk</li>\r\n	<li>2 butir kuning telur</li>\r\n	<li>1/2 sdt soda kue</li>\r\n	<li>50 gr gula pasir</li>\r\n	<li>1/4 sdt&nbsp;<em>baking powder</em></li>\r\n	<li>250 gr tepung segitiga biru</li>\r\n	<li>100 ml minyak goreng</li>\r\n</ul>\r\n\r\n<p><strong>Cara membuat:&nbsp;</strong></p>\r\n\r\n<p>1. Rebus air, gula merah, daun pandan, garam, vanilli bubuk sampai mendidih atau hingga larut. Lalu, disaring, sisihkan.&nbsp;</p>\r\n\r\n<p>2.&nbsp;<em>Mixer</em>&nbsp;kuning telur, gula pasir,&nbsp;<em>baking powder,</em>&nbsp;soda kue sampai putih mengembang dengan kecepatan tinggi.&nbsp;</p>\r\n\r\n<p>3. Lalu, masukkan secara bergantian larutan gula merah dan tepung terigu,&nbsp;<em>mixer</em>&nbsp;dengan kecepatan rendah.&nbsp;</p>\r\n\r\n<p>4. Jika sudah rata, masukkan minyak dan aduk lagi hingga rata. Siapkan loyang&nbsp;<em>cup</em>&nbsp;yang sudah diolesi margarin.&nbsp;</p>\r\n\r\n<p>5. Tuangkan adonan ke dalam&nbsp;<em>cup,</em>&nbsp;lalu, kukus selama 20 menit di dandang yang sebelumnya sudah dipanaskan. Angkat dan sajikan.&nbsp;</p>\r\n', 'Serba Gula Merah, 5 Resep Kue Jajanan Pasar yang Manisnya Bikin Nagih', 'Selasa', '2021-07-20', '20:04:24', '106043541-269387420991448-7033989092383182323-n-61289103332af5d5f92b73507121d933.jpg', 0, 'kreasi-gula', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `download`
--

CREATE TABLE `download` (
  `id_download` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nama_file` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL,
  `hits` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `download`
--

INSERT INTO `download` (`id_download`, `judul`, `nama_file`, `tgl_posting`, `hits`) VALUES
(11, 'Total Biaya Pembuatan Aplikasi Simpeg', 'Contoh_File_Download_1.txt', '2014-09-23', 8),
(12, 'Type atau Jenis Join di MySQL', 'Contoh_File_Download_1.txt', '2014-09-23', 68),
(13, 'Kegiatan Monev Tgl. 14-17 Oktober 2014 (SAKPA)', 'Contoh_File_Download_1.txt', '2014-09-23', 34),
(14, 'Pembayaran Tunjangan Remunerasi', 'Contoh_File_Download_1.txt', '2014-09-23', 24),
(15, 'Target PNBP Umum & PNBP Fungsional TA.2015', 'Contoh_File_Download_1.txt', '2014-09-23', 3),
(16, 'Pelaksanaan Disiplin Pasca Idul Fitri 1435', 'Contoh_File_Download_1.txt', '2014-09-23', 90),
(17, 'Kegiatan Akurasi Data Semester I TA. 2014', 'Contoh_File_Download_1.txt', '2014-09-23', 14),
(18, 'Rapat Koordinasi dan Konsultasi', 'Contoh_File_Download_1.txt', '2014-09-23', 5),
(19, 'Lomba dan Penilaian SIMPEG dan E-DOCu', 'Contoh_File_Download_1.txt', '2014-09-23', 90),
(20, 'Pemanggilan Peserta Bimtek Hakim Tahun 2014', 'Contoh_File_Download_1.txt', '2014-09-23', 33),
(21, 'Penyusunan PAGU Indikatif Tahun Anggaran 2015', 'Contoh_File_Download_1.txt', '2014-09-23', 57),
(22, 'Revisi Tata Cara Restore Backup SAKPA13 Audited', 'Contoh_File_Download_1.txt', '2014-09-23', 44);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id_gallery` int(5) NOT NULL,
  `id_album` int(5) NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `jdl_gallery` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gallery_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `keterangan` text COLLATE latin1_general_ci NOT NULL,
  `gbr_gallery` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `id_album`, `username`, `jdl_gallery`, `gallery_seo`, `keterangan`, `gbr_gallery`) VALUES
(238, 30, 'admin', 'Lautan Penonton', 'lautan-penonton', 'Lebih kurang dari 50.000 penonton yang memadati Stadion Gelora Bung Karno menyaksikan aksi Kantata Barock.\r\n', ''),
(237, 30, 'admin', 'Mengenang WS. Rendra', 'mengenang-ws-rendra', 'Konser didedikasikan buat salah satu anggota Kantata Takwa, WS. Rendra. Suasana kemeriahan para artis pendukung.\r\n', ''),
(240, 31, 'admin', 'Doa Bersamaaa', 'doa-bersamaaa', '<p>Mengingat agresi yang militer yang dilancarkan Israel merupakan pelanggaran hukum humaniter internasional. Menyusul banyak warga sipil yang telah menjadi korban akibat pertempuran yang dilakukan Israel dan Hamas. Sebelumnya, Sekretaris Jendral Perserikatan Bangsa - Bangsa (PBB) Ban Ki-moon dan Menteri Luar Negeri Amerika Serikat (AS) John Kerry melakukan pertemuan di Kairo, Mesir. Pertemuan di bertujuan untuk mendesak agar konflik yang terjadi di Gaza segera dihentikan.cbcvb</p>\r\n', ''),
(239, 30, 'admin', 'Semangat Kantata', 'semangat-kantata', 'Semangat para macan-macan tua Kantata, seolah mmemberi penyadaran baru dan bagai api yang tak pernah padam.\r\n', ''),
(236, 30, 'admin', 'Iwan Fals', 'iwan-fals', 'Iwan Fals yang tergabung dalam Kantata Barock bersama Setiawan Djodi dan Sawong Jabo menghibur penggemarnya di GBK.\r\n', ''),
(235, 30, 'admin', 'Iwan dan Oemar Bakrie', 'iwan-dan-oemar-bakrie', 'Aksi penonton yang mirip dengan Iwan Fals dan sang guru Oemar Bakrie\r\n', ''),
(234, 30, 'admin', 'Bento...Bento..!!', 'bentobento', 'Bento...Bento...Bentok...!! ....Asyikkk... begitu teriak Setiawan Djody dan Sawung Jabo yang ikuti ribuan penonton.\r\n', ''),
(232, 29, 'admin', 'Karpet Raksasa dari Bunga 008', 'karpet-raksasa-dari-bunga-008', 'sdasdasd', ''),
(233, 30, 'admin', 'Sujud Syukur', 'sujud-syukur', 'Seluruh awak Kantata Barock melakukan sujud syukur di penghujung acara.<br />\r\n', ''),
(231, 29, 'admin', 'Karpet Raksasa dari Bunga 007', 'karpet-raksasa-dari-bunga-007', '', ''),
(230, 29, 'admin', 'Karpet Raksasa dari Bunga 006', 'karpet-raksasa-dari-bunga-006', '', ''),
(229, 29, 'admin', 'Karpet Raksasa dari Bunga 005', 'karpet-raksasa-dari-bunga-005', '', ''),
(228, 29, 'admin', 'Karpet Raksasa dari Bunga 004', 'karpet-raksasa-dari-bunga-004', '', ''),
(227, 29, 'admin', 'Karpet Raksasa dari Bunga 003', 'karpet-raksasa-dari-bunga-003', '', ''),
(225, 29, 'admin', 'Karpet Raksasa dari Bunga 001', 'karpet-raksasa-dari-bunga-001', '', ''),
(226, 29, 'admin', 'Karpet Raksasa dari Bunga 002', 'karpet-raksasa-dari-bunga-002', '', ''),
(224, 28, 'admin', 'Favorit', 'favorit', 'Mainan adalah barang favorit yang senantiasa diburu para pembeli. Selain murah, pilihannya pun berbagai jenis.\r\n', ''),
(223, 28, 'admin', 'Suasana Pasar Asemka', 'suasana-pasar-asemka', 'Pasar Asemka, Jakarta, merupakan pasar grosir yang banyak menyediakan berbagai aksesoris seperti kalung, cincin, Souvenir pernakahan, dan lainnya. Di Pasara Asemka anda akan dimanjakan dengan beragam barang yang dibandrol dengan harga murah meriah dan biasanya dijual grosiran.<br />\r\n', ''),
(222, 28, 'admin', 'Petasan', 'petasan', 'Petasan aneka jenis juga dijajakan di Pasar Asemka, Jakarta.\r\n', ''),
(221, 28, 'admin', 'Merah Marun', 'merah-marun', 'Salah satu suvenir pernikahan nan cantik yang dijual di Pasar Asemka, Jakarta.\r\n', ''),
(220, 28, 'admin', 'Menata Cincin', 'menata-cincin', 'Seorang pedagang cincin aksesoris sedang merapihkan letak cincin agar lebih menarik di Pasar Asemka, Jakarta.\r\n', ''),
(219, 28, 'admin', 'Suvenir', 'suvenir', 'Aneka Souvenir Pernikahan yang dijual di Pasar Asemka, Jakarta.\r\n', ''),
(218, 28, 'admin', 'Seorang Wanita Pedagang', 'seorang-wanita-pedagang', 'Seorang wanita sedang menunggu kios aksesorisnya.\r\n', ''),
(217, 28, 'admin', 'Suasana Pasar', 'suasana-pasar', 'Suasana di Pasar Asemka yang senantiasa ramai. Dan pengunjung bebas memilih berbagai jenis aksesoris.\r\n', ''),
(216, 28, 'admin', 'Pedagang', 'pedagang', 'Seorang pedagang sedang membungkus souvenir penikahan yang akan dijual ataupun pesanan dari pelanggangnnya.\r\n', ''),
(254, 1, 'admin', 'Screenshot 1 ', 'screenshot-1-', 'Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 ', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `halamanstatis`
--

CREATE TABLE `halamanstatis` (
  `id_halaman` int(5) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `judul_seo` varchar(100) NOT NULL,
  `isi_halaman` text NOT NULL,
  `tgl_posting` date NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `dibaca` int(5) NOT NULL DEFAULT 1,
  `jam` time NOT NULL,
  `hari` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `halamanstatis`
--

INSERT INTO `halamanstatis` (`id_halaman`, `judul`, `judul_seo`, `isi_halaman`, `tgl_posting`, `gambar`, `username`, `dibaca`, `jam`, `hari`) VALUES
(46, 'Tentang Kami', 'tentang-kami', '<p>Kemanisan adalah aplikasi jual beli gula merah berbasis web, semua produsen gula merah yang bergabung bersama kami, bisa menjual dan mempromosikan produk mereka disini, kami juga akan memberikan informasi penting yang berkaitan dengan industri ini, jangan takut mencoba bisnis ini dan jadilah agen gula merah yang sukses bersama kami, karna kami selalu memberikan saran dan masukkan di program mentor dan diskusi.</p>\r\n', '2014-04-07', 'logo_kemanisan_resmi1.png', 'admin', 101, '13:10:57', 'Senin'),
(48, 'Alamat Perusahaan', 'alamat-perusahaan', '<p>Kemanisan adalah aplikasi jual beli gula merah berbasis web, semua produsen gula merah yang bergabung bersama kami, bisa menjual dan mempromosikan produk mereka disini, kami juga akan memberikan informasi penting yang berkaitan dengan industri ini, jangan takut mencoba bisnis ini dan jadilah agen gula merah yang sukses bersama kami, karna kami selalu memberikan saran dan masukkan di program mentor dan diskusi.</p>\r\n', '2014-04-07', 'logo_kemanisan_resmi.png', 'admin', 50, '13:32:28', 'Senin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `header`
--

CREATE TABLE `header` (
  `id_header` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `header`
--

INSERT INTO `header` (`id_header`, `judul`, `url`, `gambar`, `tgl_posting`) VALUES
(31, 'Header3', '', 'header3.jpg', '2011-04-06'),
(32, 'Header2', '', 'header1.jpg', '2011-04-06'),
(33, 'Header1', '', 'header2.jpg', '2011-04-06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hubungi`
--

CREATE TABLE `hubungi` (
  `id_hubungi` int(5) NOT NULL,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `dibaca` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `lampiran` varchar(255) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `hubungi`
--

INSERT INTO `hubungi` (`id_hubungi`, `nama`, `email`, `subjek`, `pesan`, `tanggal`, `jam`, `dibaca`, `lampiran`) VALUES
(39, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', '::1', 'Kami memiliki komitmen untuk memberikan layanan terbaik kepada Anda dan selalu berusaha untuk menyediakan produk dan layanan terbaik yang Anda butuhkan. Apabila untuk alasan tertentu Anda merasa tidak puas dengan pelayanan kami, Anda dapat menyampaikan kritik dan saran Anda kepada kami. Kami akan menidaklanjuti masukan yang Anda berikan dan bila perlu mengambil tindakan untuk mencegah masalah yang sama terulang kembali.', '2017-01-23', '21:56:12', 'Y', ''),
(35, 'yusri renor', 'aciafifah@gmail.com', 'pertanyaan', 'bagaimana cara mengunduh nomor ujian fak. pertanian', '2014-01-19', '00:00:00', 'Y', ''),
(36, 'Lusi Rahmawati', 'robby.prihandaya@gmail.com', 'xvgxcvxc', 'gbvibviubuibiub', '2014-07-02', '00:00:00', 'Y', ''),
(38, 'Udin Sedunia', 'udin.sedunia@gmail.com', 'Ip Pengirim : 120.177.28.244', 'Silahkan menghubungi kami melalui private message melalui form yang berada pada bagian kanan halaman ini. Kritik dan saran Anda sangat penting bagi kami untuk terus meningkatkan kualitas produk dan layanan yang kami berikan kepada Anda.', '2015-06-02', '00:00:00', 'Y', ''),
(40, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', '::1', 'Kami memiliki komitmen untuk memberikan layanan terbaik kepada Anda dan selalu berusaha untuk menyediakan produk dan layanan terbaik yang Anda butuhkan. Apabila untuk alasan tertentu Anda merasa tidak puas dengan pelayanan kami, Anda dapat menyampaikan kritik dan saran Anda kepada kami. Kami akan menidaklanjuti masukan yang Anda berikan dan bila perlu mengambil tindakan untuk mencegah masalah yang sama terulang kembali.', '2017-01-25', '09:54:45', 'Y', ''),
(41, 'Robby Prihandaya', 'todaynews.co.id@gmail.coms', '::1', 'asdasdasd', '2018-05-04', '19:33:01', 'Y', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas`
--

CREATE TABLE `identitas` (
  `id_identitas` int(5) NOT NULL,
  `nama_website` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `facebook` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rekening` varchar(100) NOT NULL,
  `no_telp` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `meta_deskripsi` varchar(250) NOT NULL,
  `meta_keyword` varchar(250) NOT NULL,
  `favicon` varchar(50) NOT NULL,
  `maps` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `identitas`
--

INSERT INTO `identitas` (`id_identitas`, `nama_website`, `email`, `url`, `facebook`, `rekening`, `no_telp`, `meta_deskripsi`, `meta_keyword`, `favicon`, `maps`) VALUES
(1, 'Kemanisan - Aplikasi Jual Beli Gula Merah', 'Kemanisan@gmail.com', 'http://localhost/Project_Akhir/Template1/administrator/identitaswebsite', 'https://www.instagram.com/faizmuazzam_/', '123456788', '082377823390', 'Bukakapak adalah marketplace yang menawarkan pengalaman belanja online yang cepat, aman dan nyaman dengan kategori produk yang paling lengkap di Indonesia', 'Bukakapak, Marketplace, Belanja online, Toko online', 'logo_kemanisan_resmi.png', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.1969107839027!2d101.4334664146185!3d-2.0770755375854657!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e2da390958191a5%3A0x1dec6a3653b9ab48!2sBlackExpo!5e0!3m2!1sid!2sid!4v1602350979207!5m2!1sid!2sid');

-- --------------------------------------------------------

--
-- Struktur dari tabel `iklanatas`
--

CREATE TABLE `iklanatas` (
  `id_iklanatas` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `iklanatas`
--

INSERT INTO `iklanatas` (`id_iklanatas`, `judul`, `username`, `url`, `gambar`, `tgl_posting`) VALUES
(48, 'Gula Jawa Khualitas No 1', 'slide', 'https://www.instagram.com/faizmuazzam_/', 'Produk9.jpg', '2021-07-04'),
(49, 'Produk Gula Merah Tebu, Terbaik di Madiun', 'default', 'https://www.instagram.com/faizmuazzam_/', 'Produk7.jpg', '2021-07-04'),
(47, 'Gula Tebu Tulungagung Kualitas No 1', 'slide', 'https://www.instagram.com/faizmuazzam_/', 'Produk3.jpg', '2021-07-04'),
(50, 'Gula Aren Arumanis, Gula Aren No 1 di Jakarta', 'default', 'https://www.instagram.com/faizmuazzam_/', 'Produk8.jpg', '2021-07-04'),
(51, 'Gula Aren Arum Manis, Gula Aren No 1 Di Jakarta ', 'default', 'https://www.instagram.com/faizmuazzam_/', 'Produk11.jpg', '2021-07-04'),
(52, 'Gula Kelapa', 'default', 'https://www.instagram.com/faizmuazzam_/', 'Produk4.jpg', '2021-07-04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `iklantengah`
--

CREATE TABLE `iklantengah` (
  `id_iklantengah` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `iklantengah`
--

INSERT INTO `iklantengah` (`id_iklantengah`, `judul`, `username`, `url`, `gambar`, `tgl_posting`) VALUES
(1, 'Iklan Home No 1', 'admin', 'http://www.401xd.com/', '1.jpg', '2020-07-05'),
(2, 'Iklan Home No 2', 'admin', 'http://www.401xd.com/', '2.jpg', '2020-07-05'),
(3, 'Iklan Home No 3', 'admin', 'http://www.401xd.com/', '3.jpg', '2020-07-05'),
(4, 'Iklan Bawah Detail Berita', 'admin', 'http://www.401xd.com/', 'home.jpg', '2015-03-17'),
(5, 'Iklan dibawah Detail Video', 'admin', 'http://www.401xd.com/', 'home.jpg', '2015-03-18'),
(6, 'Iklan dibawah Detail Berita Foto', 'admin', 'http://www.401xd.com/', 'home.swf', '2015-03-19'),
(7, 'Iklan dibawah Halaman Download', 'admin', 'http://www.401xd.com/', 'home.jpg', '2015-03-17'),
(8, 'Iklan dibawah detail agenda', 'admin', 'http://www.401xd.com/', 'home.jpg', '2015-03-21'),
(9, 'Iklan dibawah halaman statis', 'admin', 'http://www.401xd.com/', '', '2015-03-21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `katajelek`
--

CREATE TABLE `katajelek` (
  `id_jelek` int(11) NOT NULL,
  `kata` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `ganti` varchar(60) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `katajelek`
--

INSERT INTO `katajelek` (`id_jelek`, `kata`, `username`, `ganti`) VALUES
(4, 'sex', '', 's**'),
(2, 'bajingan', '', 'b*******'),
(3, 'bangsat', '', 'b******'),
(5, 'fuck', 'admin', 'f**k'),
(6, 'pantat', 'admin', 'p****t');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `kategori_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `sidebar` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `username`, `kategori_seo`, `aktif`, `sidebar`) VALUES
(19, 'Teknologi', '', 'teknologi', 'Y', 2),
(2, 'Olahraga', '', 'olahraga', 'Y', 4),
(21, 'Ekonomi', '', 'ekonomi', 'Y', 7),
(22, 'Politik', '', 'politik', 'N', 0),
(23, 'Hiburan', '', 'hiburan', 'Y', 3),
(31, 'Kesehatan ', '', 'kesehatan-', 'Y', 5),
(36, 'Komunitas', '', 'komunitas', 'N', 0),
(34, 'Seni & Budaya', '', 'seni--budaya', 'N', 0),
(37, 'Sekitar Kita', '', 'sekitar-kita', 'N', 0),
(39, 'Internasional', '', 'internasional', 'Y', 1),
(40, 'Kuliner', '', 'kuliner', 'Y', 0),
(41, 'Metropolitan', '', 'metropolitan', 'Y', 6),
(42, 'Dunia Islam', '', 'dunia-islam', 'N', 0),
(44, 'Wisata', '', 'wisata', 'N', 0),
(46, 'Daerah', '', 'daerah', 'N', 0),
(47, 'Gaya Hidup', '', 'gaya-hidup', 'Y', 0),
(48, 'Hukum', '', 'hukum', 'Y', 0),
(52, 'Sejarah Indonesia', 'admin', 'sejarah-indonesia', 'N', 0),
(53, 'Tokoh', 'admin', 'tokoh', 'N', 0),
(54, 'Tutorial', 'admin', 'tutorial', 'N', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(5) NOT NULL,
  `id_berita` int(5) NOT NULL,
  `nama_komentar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi_komentar` text COLLATE latin1_general_ci NOT NULL,
  `tgl` date NOT NULL,
  `jam_komentar` time NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `id_berita`, `nama_komentar`, `url`, `isi_komentar`, `tgl`, `jam_komentar`, `aktif`, `email`) VALUES
(84, 650, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', 'Nice  story, Roy suryo dan Susilo bambang yudhoyono memang cucak rowo. :)   ', '2012-01-05', '00:15:45', 'Y', 'robby.prihandaya@gmail.com'),
(88, 650, 'Udin Sedunia', 'www.belajarkonseling.com', ' hm...  kae.x  perlu  juga  ne  bantuan  dari  para  konselor...:)		   ', '2012-01-13', '20:09:07', 'Y', 'www.belajarkonseling.com'),
(90, 650, 'Rizal Faizal', 'www.rizal-online.co.cc', ' asyik  aja  dehh...   ', '2012-02-25', '15:01:40', 'Y', 'www.rizal-online.co.cc'),
(91, 645, 'Eka Praja W', 'komputerkampus.com', ' makin  parah  aja  nih  ...\r\nmudah2n  bisa  berbenah  negeri  ku  yg  q  banggakan   ', '2012-03-08', '20:06:07', 'Y', 'komputerkampus.com'),
(137, 650, 'Lukmanul Hakim', '', ' saya  yakin  PHP  juga  bisa  bertahan  sampai  2030   ', '2013-01-19', '18:56:25', 'Y', 'lukmanul.haskim@gmai;.com'),
(146, 645, 'Tommy Utama', 'tommy.utama@gmail.com', ' Calon  hakim  agung  Muhammad  Daming  Sanusi  menyatakan,  hukuman  mati  tidak  layak  diberlakukan  bagi  pelaku  pemerkosaan.   ', '2014-07-21', '21:03:04', 'Y', 'tommy.utama@gmail.com'),
(147, 655, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', 'Mudah-mudahan  windows  8.2  tampilannya  lebih  keren  lagi  dari  windows  8.1 sebelumnya  yang  kurang  enak  di gunakan.  heheheee   ', '2014-07-22', '08:33:04', 'Y', 'robby.prihandaya@gmail.com'),
(144, 650, 'Tommy Utama', 'tommy.utama@gmail.com', 'Pengamat  politik  dari  Charta  Politika,  Yunarto  Wijaya  mempertanyakan  dasar  keputusan  SBY  menunjuk  Roy  Suryo  sebagai  Menpora.   ', '2014-07-21', '20:59:16', 'Y', 'tommy.utama@gmail.com'),
(143, 650, 'Udin Sedunia', 'udin.sedunia@gmail.com', 'Menurut  Yunarto,  Roy  selama  ini  lebih  dikenal  sebagai  pakar  foto  digital  dan  video  serta  dosen  di  sebuah  perguruan  tinggi  negeri.   ', '2014-07-21', '20:57:52', 'Y', 'udin.sedunia@gmail.com'),
(148, 662, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', 'pantat negara yahudi yang sangat perlu untuk dihancurkan /  musnahkan  dan  bantai  seluruh  warga israel..!!!   ', '2014-07-24', '09:29:20', 'Y', 'robby.prihandaya@gmail.com'),
(149, 662, 'Edo Ikfianda', 'edomuhammad90@gmail.com', 'Setelah membentuk Timnas, PSSI versi KLB pimpinan La Nyalla Mahmud Matalitti menunjuk Alfred Riedl sebagai pelatihnya.', '2014-08-09', '17:34:35', 'Y', 'edomuhammad90@gmail.com'),
(152, 650, 'Dewi Safitriir', 'dewi_safitri@gmail.com', 'Peremimpin  tertinggi  Iran,  Ayatollah  Ali  Khamenei  menyampaikan  pernyataan  kontroversial  terkait  ketegangan  di  Gaza.Israele.   ', '2014-08-17', '17:46:28', 'Y', 'dewi_safitri@gmail.com'),
(153, 662, 'Robby Prihandaya', 'ww.phpmu.com', 'Anda penyuka Transformer? Tentu hal yang paling menarik saat menonton film Transformer salah satunya adalah saat adegan transformasi yang begitu keren dari sebuah mobil atau truk menjadi robot yang gagah.\r\n\r\nAnda penyuka Transformer? Tentu hal yang paling menarik saat menonton film Transformer salah satunya adalah saat adegan transformasi yang begitu keren dari sebuah mobil atau truk menjadi robot yang gagah.', '2015-03-25', '06:10:12', 'Y', 'robby.prihandaya@gmail.com'),
(154, 642, 'Tommy Utama', 'tommyutama.com', ' Para  pengunjuk  rasa  membawa  bendera-bendera  Palestina  dan  foro-foto  pemimpin  tertinggi  Iran,  Ayatollah  Ali  Khamenei.   ', '2016-11-24', '10:24:15', 'Y', 'tommy.utama@gmail.com'),
(164, 656, 'Robby Prihandaya', 'https://phpmu.com', 'Komentar paling pedas Khamenei adalah Iran tidak pernah mengenal Israel. Negara ini juga secara terang-terangan mendukung Hamas. Hamas sendiri sudah dimasukan ke dalam daftar hitam terorisme oleh Israel.', '2018-04-20', '10:41:54', 'Y', 'robby.prihandaya@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentarvid`
--

CREATE TABLE `komentarvid` (
  `id_komentar` int(5) NOT NULL,
  `id_video` int(5) NOT NULL,
  `nama_komentar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi_komentar` text COLLATE latin1_general_ci NOT NULL,
  `tgl` date NOT NULL,
  `jam_komentar` time NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `komentarvid`
--

INSERT INTO `komentarvid` (`id_komentar`, `id_video`, `nama_komentar`, `url`, `isi_komentar`, `tgl`, `jam_komentar`, `aktif`) VALUES
(107, 160, 'Prabowo Subianto', 'Prabowo@gmail.com', ' Your  email  address  will  not  be  published.  Required  fields  are  marked', '2014-07-21', '13:29:29', 'Y'),
(108, 163, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', ' Kita  memang  harus  selamatkan  hutan  indonesia,  walau  apapun  yang  terjadi.   ', '2014-07-21', '13:31:10', 'Y'),
(109, 160, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', ' Swarakalibata  V.3 sekarang  hadir  dengan  tampilan  baru  yang  pastinya  sudah  jauh  lebih  maju  dari  versi  sebelumnya.', '2014-07-21', '21:09:31', 'Y'),
(112, 166, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', 'Exclusive Di IDAFF Acedemy - &quot;Social Blogging Mastery 2&quot; - Workshop 2 Hari Yang Akan Merubah Hidup Anda Di Tahun 2017. Di Bongkar Oleh Ahlinya Cara Paling Mudah Memiliki Penghasillan Sampingan Lewat Internet Hingga Jutaan Rupiah Setiap Bulannya.', '2017-01-25', '09:40:01', 'Y'),
(113, 166, 'Dewiit Safitri', 'dewiit.safitri@gmail.com', 'Pemimpin tertinggi Iran, Ayatollah Ali Khamenei menyampaikan pernyataan kontroversial terkait ketegangan di Gaza. Khamenei mendorong agar Palestina terus melawan Israel. &quot;Salah satu cara untuk menghentikan rezim kurang ajar ini adalah melanjutkan perlawanan dan dan perjuangan bersenjata harus diperluas ke Tepi Barat,&quot; sebut Khamenei, seperti dikutip dari IRNA.', '2017-01-25', '09:40:55', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `logo`
--

CREATE TABLE `logo` (
  `id_logo` int(5) NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `logo`
--

INSERT INTO `logo` (`id_logo`, `gambar`) VALUES
(15, 'Kemanisan.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `nama_menu` varchar(30) NOT NULL,
  `link` varchar(100) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `position` enum('Top','Bottom') DEFAULT 'Bottom',
  `urutan` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `id_parent`, `nama_menu`, `link`, `aktif`, `position`, `urutan`) VALUES
(117, 157, 'Download', 'download', 'Ya', 'Top', 23),
(115, 0, 'Alamat Kami', 'halaman/detail/alamat-perusahaan', 'Ya', 'Top', 3),
(113, 0, 'Tentang Kami', 'halaman/detail/tentang-kami', 'Ya', 'Bottom', 2),
(112, 22, 'Dalam Negeri', '#', 'Ya', 'Bottom', 20),
(151, 0, 'Semua Produk', 'produk', 'Ya', 'Bottom', 5),
(18, 157, 'Video', 'playlist', 'Ya', 'Bottom', 24),
(116, 0, 'Hubungi Kami', 'hubungi', 'Ya', 'Top', 4),
(118, 157, 'Acara', 'agenda', 'Ya', 'Bottom', 21),
(119, 0, 'Index Berita', 'berita/indeks_berita', 'Ya', 'Top', 1),
(121, 0, 'Konsultasi', 'konsultasi', 'Ya', 'Bottom', 11),
(124, 0, 'Penulis', 'kontributor', 'Ya', 'Bottom', 12),
(126, 22, 'Luar Negeri', '#', 'Ya', 'Bottom', 21),
(147, 0, 'Testimoni', 'testimoni', 'Ya', 'Bottom', 13),
(152, 0, 'Semua Agen', 'produk/reseller', 'Ya', 'Bottom', 6),
(155, 0, 'Laporan Orders', 'members/orders_report', 'Ya', 'Bottom', 9),
(157, 0, 'Lainnya', '#', 'Ya', 'Bottom', 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(5) NOT NULL,
  `nama_modul` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `static_content` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `publish` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `status` enum('user','admin') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `urutan` int(5) NOT NULL,
  `link_seo` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `username`, `link`, `static_content`, `gambar`, `publish`, `status`, `aktif`, `urutan`, `link_seo`) VALUES
(2, 'Manajemen User', 'admin', 'manajemenuser', '', '', 'Y', 'user', 'Y', 0, ''),
(18, 'Berita', 'admin', 'listberita', '', '', 'Y', 'user', 'Y', 0, ''),
(71, 'Background Website', 'admin', 'background', '', '', 'N', 'admin', 'N', 0, ''),
(10, 'Manajemen Modul', 'admin', 'manajemenmodul', '', '', 'Y', 'user', 'Y', 0, ''),
(31, 'Kategori Berita ', 'admin', 'kategorikategori', '', '', 'Y', 'user', 'Y', 0, ''),
(33, 'Jajak Pendapat', 'admin', 'jajakpendapat', '', '', 'Y', 'user', 'Y', 0, ''),
(34, 'Tag Berita', 'admin', 'tagberita', '', '', 'Y', 'user', 'Y', 0, ''),
(35, 'Komentar Berita', 'admin', 'komentarberita', '', '', 'Y', 'user', 'Y', 0, ''),
(41, 'Agenda', 'admin', 'agenda', '', '', 'Y', 'user', 'Y', 0, ''),
(43, 'Berita Foto', 'admin', 'album', '', '', 'Y', 'user', 'Y', 0, ''),
(44, 'Galeri Berita Foto', 'admin', 'gallery', '', '', 'Y', 'user', 'Y', 0, ''),
(45, 'Template Website', 'admin', 'templatewebsite', '', '', 'Y', 'user', 'Y', 0, ''),
(46, 'Sensor Kata', 'admin', 'sensorkomentar', '', '', 'Y', 'user', 'Y', 0, ''),
(61, 'Identitas Website', 'admin', 'identitaswebsite', '', '', 'Y', 'user', 'Y', 0, ''),
(57, 'Menu Website', 'admin', 'menuwebsite', '', '', 'Y', 'user', 'Y', 0, ''),
(59, 'Halaman Baru', 'admin', 'halamanbaru', '', '', 'Y', 'user', 'Y', 0, ''),
(62, 'Video', 'admin', 'video', '', '', 'Y', 'user', 'Y', 0, ''),
(63, 'Playlist Video', 'admin', 'playlist', '', '', 'Y', 'user', 'Y', 0, ''),
(64, 'Tag Video', 'admin', 'tagvideo', '', '', 'Y', 'user', 'Y', 0, ''),
(65, 'Komentar Video', 'admin', 'komentarvideo', '', '', 'Y', 'user', 'Y', 0, ''),
(66, 'Logo Website', 'admin', 'logowebsite', '', '', 'Y', 'user', 'Y', 0, ''),
(67, 'Iklan Sidebar', 'admin', 'iklansidebar', '', '', 'N', 'admin', 'N', 0, ''),
(68, 'Iklan Home', 'admin', 'iklanhome', '', '', 'N', 'admin', 'N', 0, ''),
(69, 'Iklan Atas', 'admin', 'iklanatas', '', '', 'N', 'admin', 'N', 0, ''),
(70, 'Pesan Masuk', 'admin', 'pesanmasuk', '', '', 'Y', 'user', 'Y', 0, ''),
(72, 'Sekilas Info', 'admin', 'sekilasinfo', '', '', 'N', 'admin', 'N', 0, ''),
(73, 'Yahoo Messanger', 'admin', 'ym', '', '', 'N', 'admin', 'N', 0, ''),
(74, 'Download Area', 'admin', 'download', '', '', 'Y', 'admin', 'Y', 0, ''),
(75, 'Alamat Kontak', 'admin', 'alamat', '', '', 'Y', 'admin', 'Y', 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_alamat`
--

CREATE TABLE `mod_alamat` (
  `id_alamat` int(5) NOT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mod_alamat`
--

INSERT INTO `mod_alamat` (`id_alamat`, `alamat`) VALUES
(1, '<strong>Haloo!</strong>, Kami berkomitmen memberikan layanan terbaik untuk Anda,&nbsp;menyediakan produk dan layanan terbaik yang Anda butuhkan. Apabila untuk alasan tertentu Anda merasa tidak puas dengan pelayanan kami dapat menyampaikan kritik dan saran.<br />\r\n<br />\r\nKami akan menidaklanjuti masukan yang Anda berikan dan bila perlu mengambil tindakan untuk mencegah masalah yang sama terulang kembali.\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_ym`
--

CREATE TABLE `mod_ym` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `ym_icon` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `mod_ym`
--

INSERT INTO `mod_ym` (`id`, `nama`, `username`, `ym_icon`) VALUES
(1, 'Semanis Janjimu', 'kemanisan', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasangiklan`
--

CREATE TABLE `pasangiklan` (
  `id_pasangiklan` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `playlist`
--

CREATE TABLE `playlist` (
  `id_playlist` int(5) NOT NULL,
  `jdl_playlist` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `playlist_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gbr_playlist` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `playlist`
--

INSERT INTO `playlist` (`id_playlist`, `jdl_playlist`, `username`, `playlist_seo`, `gbr_playlist`, `aktif`) VALUES
(56, 'Playlist Video 1', 'admin', 'playlist-video-1', '', 'Y'),
(57, 'Playlist Video 2', 'admin', 'playlist-video-2', '', 'Y'),
(61, 'Playlist Video 4', 'admin', 'playlist-video-4', '', 'Y'),
(60, 'Playlist Video 3', 'admin', 'playlist-video-3', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `poling`
--

CREATE TABLE `poling` (
  `id_poling` int(5) NOT NULL,
  `pilihan` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `status` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `rating` int(5) NOT NULL DEFAULT 0,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_bonus`
--

CREATE TABLE `rb_bonus` (
  `id_bonus` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `status` enum('1','2') NOT NULL,
  `waktu_bonus` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_bonus`
--

INSERT INTO `rb_bonus` (`id_bonus`, `username`, `nominal`, `status`, `waktu_bonus`) VALUES
(8, 'arsenio', 100000, '1', '2017-04-10 23:55:38'),
(7, 'robby', 100000, '1', '2017-04-10 23:55:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_kategori_produk`
--

CREATE TABLE `rb_kategori_produk` (
  `id_kategori_produk` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `kategori_seo` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_kategori_produk`
--

INSERT INTO `rb_kategori_produk` (`id_kategori_produk`, `nama_kategori`, `kategori_seo`) VALUES
(1, 'Gula Jawa (Kelapa)', 'manis-merah--jawa'),
(2, 'Gula Aren', 'merah-manis--aren'),
(6, 'Gula Merah Tebu', 'merah--manis-tebu'),
(9, 'Gula Putih Tebu', 'putih-manis--tebu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_kategori_produk_sub`
--

CREATE TABLE `rb_kategori_produk_sub` (
  `id_kategori_produk_sub` int(11) NOT NULL,
  `id_kategori_produk` int(11) NOT NULL,
  `nama_kategori_sub` varchar(255) NOT NULL,
  `kategori_seo_sub` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_kategori_produk_sub`
--

INSERT INTO `rb_kategori_produk_sub` (`id_kategori_produk_sub`, `id_kategori_produk`, `nama_kategori_sub`, `kategori_seo_sub`) VALUES
(1, 2, 'Bubuk', 'bubuk'),
(2, 2, 'Padat', 'Padat'),
(3, 1, 'Bubuk', 'bubuk'),
(4, 1, 'Padat', 'padat'),
(5, 6, 'Bubuk', 'bubuk'),
(6, 6, 'Padat', 'padat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_keterangan`
--

CREATE TABLE `rb_keterangan` (
  `id_keterangan` int(5) NOT NULL,
  `id_reseller` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal_posting` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_keterangan`
--

INSERT INTO `rb_keterangan` (`id_keterangan`, `id_reseller`, `keterangan`, `tanggal_posting`) VALUES
(1, 2, '<b>Informasi dari Reseller :</b><p></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec scelerisque condimentum mattis. Suspendisse potenti. Proin vitae elementum nisi. Aliquam eu pretium risus. Nam varius efficitur consectetur. Aenean vestibulum felis sed mollis faucibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin venenatis est sit amet eleifend vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer id nunc eu odio ultrices pulvinar non feugiat felis.&nbsp; dfsdfsdf</p><p>Duis consequat urna sapien, porta gravida diam venenatis at. Duis at ornare enim, ac accumsan eros. Sed in finibus metus. Etiam blandit tristique orci, sit amet congue dui facilisis id. Donec fermentum diam at orci viverra placerat. Sed nunc lorem, cursus nec vestibulum hendrerit, tempus et libero. ertert</p>', '2017-03-31'),
(2, 6, '<p>asdasdasd</p>', '2019-09-07'),
(3, 1, '<p>ZXZXZX</p>', '2019-09-07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_konfirmasi_pembayaran`
--

CREATE TABLE `rb_konfirmasi_pembayaran` (
  `id_konfirmasi_pembayaran` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `total_transfer` varchar(20) NOT NULL,
  `id_rekening` int(11) NOT NULL,
  `nama_pengirim` varchar(255) NOT NULL,
  `tanggal_transfer` date NOT NULL,
  `bukti_transfer` varchar(255) NOT NULL,
  `waktu_konfirmasi` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_konfirmasi_pembayaran`
--

INSERT INTO `rb_konfirmasi_pembayaran` (`id_konfirmasi_pembayaran`, `id_penjualan`, `total_transfer`, `id_rekening`, `nama_pengirim`, `tanggal_transfer`, `bukti_transfer`, `waktu_konfirmasi`) VALUES
(1, 14, 'Rp 3,605,000', 2, 'Robby Prihandaya', '2017-06-01', 'Transfer_Member_PHP.png', '2017-06-01 17:17:55'),
(2, 58, 'Rp 700,000', 1, 'ttt', '2018-09-12', '', '2018-09-12 14:43:39'),
(3, 68, 'Rp 1,332,900', 1, 'Reseller Utama', '2018-12-26', '234.JPG', '2018-12-26 08:19:57'),
(4, 91, 'Rp 399,000', 1, 'Murni Jaya', '2019-03-22', 'Screenshot_20190227-155933_BCA_mobile.jpg', '2019-03-22 06:28:27'),
(5, 117, 'Rp 114,000', 1, 'Umar Lapakers', '2020-06-28', '', '2020-06-28 08:44:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_konfirmasi_pembayaran_konsumen`
--

CREATE TABLE `rb_konfirmasi_pembayaran_konsumen` (
  `id_konfirmasi_pembayaran` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `total_transfer` varchar(20) NOT NULL,
  `id_rekening` int(11) NOT NULL,
  `nama_pengirim` varchar(255) NOT NULL,
  `tanggal_transfer` date NOT NULL,
  `bukti_transfer` varchar(255) NOT NULL,
  `waktu_konfirmasi` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_konfirmasi_pembayaran_konsumen`
--

INSERT INTO `rb_konfirmasi_pembayaran_konsumen` (`id_konfirmasi_pembayaran`, `id_penjualan`, `total_transfer`, `id_rekening`, `nama_pengirim`, `tanggal_transfer`, `bukti_transfer`, `waktu_konfirmasi`) VALUES
(2, 19, 'Rp 1,278,000', 1, 'Robby Prihandaya', '2017-06-02', '00011.jpg', '2017-06-02 15:19:40'),
(3, 43, 'Rp 4,799,000', 0, 'Dewiit Safitri ', '2017-06-04', '0755.png', '2017-06-04 11:27:01'),
(5, 47, 'Rp 728,000', 1, 'Agus Raharjo', '2017-06-07', '1.png', '2017-06-07 21:06:06'),
(6, 57, 'Rp 945,900', 1, 'Robby Prihandaya', '2018-12-11', '', '2018-12-11 14:01:05'),
(7, 57, 'Rp 945,900', 1, 'Robby Prihandaya', '2018-12-11', '', '2018-12-11 14:02:22'),
(8, 57, 'Rp 945,900', 1, 'Robby Prihandaya', '2018-12-11', 'zhe_mandiri_logo.png', '2018-12-11 14:03:11'),
(9, 61, 'Rp 110,900', 1, 'Robby Prihandaya', '2018-12-23', 'bukti_transfer_phpmu1.jpeg', '2018-12-23 07:39:30'),
(10, 85, 'Rp 776,000', 2, 'Robby Prihandaya', '2019-03-21', 'bukti_transfer3.jpg', '2019-03-21 12:04:31'),
(11, 86, 'Rp 141,000', 1, 'Robby Prihandaya', '2019-03-21', 'IMG-20190217-WA0002.jpg', '2019-03-21 12:09:00'),
(12, 87, 'Rp 82,000', 1, 'Muhammad Arsenio', '2019-03-21', 'IMG-20190115-WA0013.jpg', '2019-03-21 12:11:56'),
(13, 106, 'Rp 776,000', 1, 'Robby Prihandaya', '2019-07-03', 'Screenshot.png', '2019-07-03 07:45:36'),
(14, 133, 'Rp 5,288,000', 0, 'Gunawan', '2020-10-11', 'favicon.png', '2020-10-11 23:59:25'),
(15, 130, 'Rp 22,449,000', 0, 'Gunawan', '2020-10-12', 'favicon1.png', '2020-10-12 00:00:29'),
(16, 129, 'Rp 100,000', 0, 'robby', '2020-10-12', 'favicon2.png', '2020-10-12 00:50:50'),
(17, 141, 'Rp 10,586,000', 0, 'gunawan 1', '2020-10-12', 'favicon3.png', '2020-10-12 01:02:31'),
(18, 140, 'Rp 5,277,000', 0, 'ter', '2020-10-12', 'favicon4.png', '2020-10-12 01:02:46'),
(19, 143, 'Rp 42,304,000', 0, 'Gunawan', '2020-10-14', 'mycoding.png', '2020-10-14 00:10:12'),
(20, 153, 'Rp 51,000', 0, 'Faiz Muazzam', '2021-07-03', '1_-_Copy.png', '2021-07-03 20:46:56'),
(21, 154, 'Rp 306,000', 0, 'Faiz Muazzam', '2021-07-04', '', '2021-07-04 12:12:38'),
(22, 155, 'Rp 156,000', 0, 'Faizmuazzam', '2021-07-04', '', '2021-07-04 12:23:28'),
(23, 158, 'Rp 1,500,000', 0, 'Faiz Muazzam', '2021-07-04', '', '2021-07-04 13:05:23'),
(24, 162, 'Rp 1,500,000', 0, 'FaizMuazzam', '2021-07-04', '', '2021-07-04 20:13:16'),
(25, 164, 'Rp 210,000', 0, 'FaizMuazzam', '2021-07-11', '', '2021-07-11 19:46:32'),
(26, 164, 'Rp 210,000', 0, 'Kemanisan', '2021-07-20', '', '2021-07-20 16:39:42'),
(27, 172, 'Rp 117,000', 0, 'Kemanisan', '2021-07-20', '', '2021-07-20 16:40:15'),
(28, 174, 'Rp 177,000', 0, 'FaizMuazzam', '2021-07-20', '', '2021-07-20 16:55:18'),
(29, 176, 'Rp 45,000', 0, 'AgenKemanisan', '2021-07-20', '', '2021-07-20 18:21:00'),
(30, 177, 'Rp 55,000', 0, 'FaizMuazzam', '2021-07-20', '', '2021-07-20 18:24:53'),
(31, 177, 'Rp 55,000', 0, 'Faiz Muazzam', '2021-07-20', '', '2021-07-20 18:36:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_konsumen`
--

CREATE TABLE `rb_konsumen` (
  `id_konsumen` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` text NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(60) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `alamat_lengkap` text NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kota_id` int(11) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tanggal_daftar` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_konsumen`
--

INSERT INTO `rb_konsumen` (`id_konsumen`, `username`, `password`, `nama_lengkap`, `email`, `jenis_kelamin`, `tanggal_lahir`, `tempat_lahir`, `alamat_lengkap`, `kecamatan`, `kota_id`, `no_hp`, `foto`, `tanggal_daftar`) VALUES
(28, 'UserKemanisan', 'faf9515530e13bc3762b9b3b17487b38a5cbb49cbead9ddbffa78efc6e5e8edcdb86a6b1de45f07aaa78b34fbc5ca7792f8feb1463de81f7258f8adc4322ad88', 'UserKemanisan', 'faizmuazzam.fm7@gmail.com', 'Laki-laki', '2000-11-18', 'London', 'Sambidoplang', 'Sumbergempol', 492, '081335088111', '', '2021-07-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_kota`
--

CREATE TABLE `rb_kota` (
  `kota_id` int(11) NOT NULL,
  `provinsi_id` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_kota`
--

INSERT INTO `rb_kota` (`kota_id`, `provinsi_id`, `nama_kota`) VALUES
(17, 1, 'Badung'),
(32, 1, 'Bangli'),
(94, 1, 'Buleleng'),
(114, 1, 'Denpasar'),
(128, 1, 'Gianyar'),
(161, 1, 'Jembrana'),
(170, 1, 'Karangasem'),
(197, 1, 'Klungkung'),
(447, 1, 'Tabanan'),
(27, 2, 'Bangka'),
(28, 2, 'Bangka Barat'),
(29, 2, 'Bangka Selatan'),
(30, 2, 'Bangka Tengah'),
(56, 2, 'Belitung'),
(57, 2, 'Belitung Timur'),
(334, 2, 'Pangkal Pinang'),
(106, 3, 'Cilegon'),
(232, 3, 'Lebak'),
(331, 3, 'Pandeglang'),
(402, 3, 'Serang'),
(403, 3, 'Serang'),
(455, 3, 'Tangerang'),
(456, 3, 'Tangerang'),
(457, 3, 'Tangerang Selatan'),
(62, 4, 'Bengkulu'),
(63, 4, 'Bengkulu Selatan'),
(64, 4, 'Bengkulu Tengah'),
(65, 4, 'Bengkulu Utara'),
(175, 4, 'Kaur'),
(183, 4, 'Kepahiang'),
(233, 4, 'Lebong'),
(294, 4, 'Muko Muko'),
(379, 4, 'Rejang Lebong'),
(397, 4, 'Seluma'),
(39, 5, 'Bantul'),
(135, 5, 'Gunung Kidul'),
(210, 5, 'Kulon Progo'),
(419, 5, 'Sleman'),
(501, 5, 'Yogyakarta'),
(151, 6, 'Jakarta Barat'),
(152, 6, 'Jakarta Pusat'),
(153, 6, 'Jakarta Selatan'),
(154, 6, 'Jakarta Timur'),
(155, 6, 'Jakarta Utara'),
(189, 6, 'Kepulauan Seribu'),
(77, 7, 'Boalemo'),
(88, 7, 'Bone Bolango'),
(129, 7, 'Gorontalo'),
(130, 7, 'Gorontalo'),
(131, 7, 'Gorontalo Utara'),
(361, 7, 'Pohuwato'),
(50, 8, 'Batang Hari'),
(97, 8, 'Bungo'),
(156, 8, 'Jambi'),
(194, 8, 'Kerinci'),
(280, 8, 'Merangin'),
(293, 8, 'Muaro Jambi'),
(393, 8, 'Sarolangun'),
(442, 8, 'Sungaipenuh'),
(460, 8, 'Tanjung Jabung Barat'),
(461, 8, 'Tanjung Jabung Timur'),
(471, 8, 'Tebo'),
(22, 9, 'Bandung'),
(23, 9, 'Bandung'),
(24, 9, 'Bandung Barat'),
(34, 9, 'Banjar'),
(54, 9, 'Bekasi'),
(55, 9, 'Bekasi'),
(78, 9, 'Bogor'),
(79, 9, 'Bogor'),
(103, 9, 'Ciamis'),
(104, 9, 'Cianjur'),
(107, 9, 'Cimahi'),
(108, 9, 'Cirebon'),
(109, 9, 'Cirebon'),
(115, 9, 'Depok'),
(126, 9, 'Garut'),
(149, 9, 'Indramayu'),
(171, 9, 'Karawang'),
(211, 9, 'Kuningan'),
(252, 9, 'Majalengka'),
(332, 9, 'Pangandaran'),
(376, 9, 'Purwakarta'),
(428, 9, 'Subang'),
(430, 9, 'Sukabumi'),
(431, 9, 'Sukabumi'),
(440, 9, 'Sumedang'),
(468, 9, 'Tasikmalaya'),
(469, 9, 'Tasikmalaya'),
(37, 10, 'Banjarnegara'),
(41, 10, 'Banyumas'),
(49, 10, 'Batang'),
(76, 10, 'Blora'),
(91, 10, 'Boyolali'),
(92, 10, 'Brebes'),
(105, 10, 'Cilacap'),
(113, 10, 'Demak'),
(134, 10, 'Grobogan'),
(163, 10, 'Jepara'),
(169, 10, 'Karanganyar'),
(177, 10, 'Kebumen'),
(181, 10, 'Kendal'),
(196, 10, 'Klaten'),
(209, 10, 'Kudus'),
(249, 10, 'Magelang'),
(250, 10, 'Magelang'),
(344, 10, 'Pati'),
(348, 10, 'Pekalongan'),
(349, 10, 'Pekalongan'),
(352, 10, 'Pemalang'),
(375, 10, 'Purbalingga'),
(377, 10, 'Purworejo'),
(380, 10, 'Rembang'),
(386, 10, 'Salatiga'),
(398, 10, 'Semarang'),
(399, 10, 'Semarang'),
(427, 10, 'Sragen'),
(433, 10, 'Sukoharjo'),
(445, 10, 'Surakarta (Solo)'),
(472, 10, 'Tegal'),
(473, 10, 'Tegal'),
(476, 10, 'Temanggung'),
(497, 10, 'Wonogiri'),
(498, 10, 'Wonosobo'),
(31, 11, 'Bangkalan'),
(42, 11, 'Banyuwangi'),
(51, 11, 'Batu'),
(74, 11, 'Blitar'),
(75, 11, 'Blitar'),
(80, 11, 'Bojonegoro'),
(86, 11, 'Bondowoso'),
(133, 11, 'Gresik'),
(160, 11, 'Jember'),
(164, 11, 'Jombang'),
(178, 11, 'Kediri'),
(179, 11, 'Kediri'),
(222, 11, 'Lamongan'),
(243, 11, 'Lumajang'),
(247, 11, 'Madiun'),
(248, 11, 'Madiun'),
(251, 11, 'Magetan'),
(256, 11, 'Malang'),
(255, 11, 'Malang'),
(289, 11, 'Mojokerto'),
(290, 11, 'Mojokerto'),
(305, 11, 'Nganjuk'),
(306, 11, 'Ngawi'),
(317, 11, 'Pacitan'),
(330, 11, 'Pamekasan'),
(342, 11, 'Pasuruan'),
(343, 11, 'Pasuruan'),
(363, 11, 'Ponorogo'),
(369, 11, 'Probolinggo'),
(370, 11, 'Probolinggo'),
(390, 11, 'Sampang'),
(409, 11, 'Sidoarjo'),
(418, 11, 'Situbondo'),
(441, 11, 'Sumenep'),
(444, 11, 'Surabaya'),
(487, 11, 'Trenggalek'),
(489, 11, 'Tuban'),
(492, 11, 'Tulungagung'),
(61, 12, 'Bengkayang'),
(168, 12, 'Kapuas Hulu'),
(176, 12, 'Kayong Utara'),
(195, 12, 'Ketapang'),
(208, 12, 'Kubu Raya'),
(228, 12, 'Landak'),
(279, 12, 'Melawi'),
(364, 12, 'Pontianak'),
(365, 12, 'Pontianak'),
(388, 12, 'Sambas'),
(391, 12, 'Sanggau'),
(395, 12, 'Sekadau'),
(415, 12, 'Singkawang'),
(417, 12, 'Sintang'),
(18, 13, 'Balangan'),
(33, 13, 'Banjar'),
(35, 13, 'Banjarbaru'),
(36, 13, 'Banjarmasin'),
(43, 13, 'Barito Kuala'),
(143, 13, 'Hulu Sungai Selatan'),
(144, 13, 'Hulu Sungai Tengah'),
(145, 13, 'Hulu Sungai Utara'),
(203, 13, 'Kotabaru'),
(446, 13, 'Tabalong'),
(452, 13, 'Tanah Bumbu'),
(454, 13, 'Tanah Laut'),
(466, 13, 'Tapin'),
(44, 14, 'Barito Selatan'),
(45, 14, 'Barito Timur'),
(46, 14, 'Barito Utara'),
(136, 14, 'Gunung Mas'),
(167, 14, 'Kapuas'),
(174, 14, 'Katingan'),
(205, 14, 'Kotawaringin Barat'),
(206, 14, 'Kotawaringin Timur'),
(221, 14, 'Lamandau'),
(296, 14, 'Murung Raya'),
(326, 14, 'Palangka Raya'),
(371, 14, 'Pulang Pisau'),
(405, 14, 'Seruyan'),
(432, 14, 'Sukamara'),
(19, 15, 'Balikpapan'),
(66, 15, 'Berau'),
(89, 15, 'Bontang'),
(214, 15, 'Kutai Barat'),
(215, 15, 'Kutai Kartanegara'),
(216, 15, 'Kutai Timur'),
(341, 15, 'Paser'),
(354, 15, 'Penajam Paser Utara'),
(387, 15, 'Samarinda'),
(96, 16, 'Bulungan (Bulongan)'),
(257, 16, 'Malinau'),
(311, 16, 'Nunukan'),
(450, 16, 'Tana Tidung'),
(467, 16, 'Tarakan'),
(48, 17, 'Batam'),
(71, 17, 'Bintan'),
(172, 17, 'Karimun'),
(184, 17, 'Kepulauan Anambas'),
(237, 17, 'Lingga'),
(302, 17, 'Natuna'),
(462, 17, 'Tanjung Pinang'),
(21, 18, 'Bandar Lampung'),
(223, 18, 'Lampung Barat'),
(224, 18, 'Lampung Selatan'),
(225, 18, 'Lampung Tengah'),
(226, 18, 'Lampung Timur'),
(227, 18, 'Lampung Utara'),
(282, 18, 'Mesuji'),
(283, 18, 'Metro'),
(355, 18, 'Pesawaran'),
(356, 18, 'Pesisir Barat'),
(368, 18, 'Pringsewu'),
(458, 18, 'Tanggamus'),
(490, 18, 'Tulang Bawang'),
(491, 18, 'Tulang Bawang Barat'),
(496, 18, 'Way Kanan'),
(14, 19, 'Ambon'),
(99, 19, 'Buru'),
(100, 19, 'Buru Selatan'),
(185, 19, 'Kepulauan Aru'),
(258, 19, 'Maluku Barat Daya'),
(259, 19, 'Maluku Tengah'),
(260, 19, 'Maluku Tenggara'),
(261, 19, 'Maluku Tenggara Barat'),
(400, 19, 'Seram Bagian Barat'),
(401, 19, 'Seram Bagian Timur'),
(488, 19, 'Tual'),
(138, 20, 'Halmahera Barat'),
(139, 20, 'Halmahera Selatan'),
(140, 20, 'Halmahera Tengah'),
(141, 20, 'Halmahera Timur'),
(142, 20, 'Halmahera Utara'),
(191, 20, 'Kepulauan Sula'),
(372, 20, 'Pulau Morotai'),
(477, 20, 'Ternate'),
(478, 20, 'Tidore Kepulauan'),
(1, 21, 'Aceh Barat'),
(2, 21, 'Aceh Barat Daya'),
(3, 21, 'Aceh Besar'),
(4, 21, 'Aceh Jaya'),
(5, 21, 'Aceh Selatan'),
(6, 21, 'Aceh Singkil'),
(7, 21, 'Aceh Tamiang'),
(8, 21, 'Aceh Tengah'),
(9, 21, 'Aceh Tenggara'),
(10, 21, 'Aceh Timur'),
(11, 21, 'Aceh Utara'),
(20, 21, 'Banda Aceh'),
(59, 21, 'Bener Meriah'),
(72, 21, 'Bireuen'),
(127, 21, 'Gayo Lues'),
(230, 21, 'Langsa'),
(235, 21, 'Lhokseumawe'),
(300, 21, 'Nagan Raya'),
(358, 21, 'Pidie'),
(359, 21, 'Pidie Jaya'),
(384, 21, 'Sabang'),
(414, 21, 'Simeulue'),
(429, 21, 'Subulussalam'),
(68, 22, 'Bima'),
(69, 22, 'Bima'),
(118, 22, 'Dompu'),
(238, 22, 'Lombok Barat'),
(239, 22, 'Lombok Tengah'),
(240, 22, 'Lombok Timur'),
(241, 22, 'Lombok Utara'),
(276, 22, 'Mataram'),
(438, 22, 'Sumbawa'),
(439, 22, 'Sumbawa Barat'),
(13, 23, 'Alor'),
(58, 23, 'Belu'),
(122, 23, 'Ende'),
(125, 23, 'Flores Timur'),
(212, 23, 'Kupang'),
(213, 23, 'Kupang'),
(234, 23, 'Lembata'),
(269, 23, 'Manggarai'),
(270, 23, 'Manggarai Barat'),
(271, 23, 'Manggarai Timur'),
(301, 23, 'Nagekeo'),
(304, 23, 'Ngada'),
(383, 23, 'Rote Ndao'),
(385, 23, 'Sabu Raijua'),
(412, 23, 'Sikka'),
(434, 23, 'Sumba Barat'),
(435, 23, 'Sumba Barat Daya'),
(436, 23, 'Sumba Tengah'),
(437, 23, 'Sumba Timur'),
(479, 23, 'Timor Tengah Selatan'),
(480, 23, 'Timor Tengah Utara'),
(16, 24, 'Asmat'),
(67, 24, 'Biak Numfor'),
(90, 24, 'Boven Digoel'),
(111, 24, 'Deiyai (Deliyai)'),
(117, 24, 'Dogiyai'),
(150, 24, 'Intan Jaya'),
(157, 24, 'Jayapura'),
(158, 24, 'Jayapura'),
(159, 24, 'Jayawijaya'),
(180, 24, 'Keerom'),
(193, 24, 'Kepulauan Yapen (Yapen Waropen)'),
(231, 24, 'Lanny Jaya'),
(263, 24, 'Mamberamo Raya'),
(264, 24, 'Mamberamo Tengah'),
(274, 24, 'Mappi'),
(281, 24, 'Merauke'),
(284, 24, 'Mimika'),
(299, 24, 'Nabire'),
(303, 24, 'Nduga'),
(335, 24, 'Paniai'),
(347, 24, 'Pegunungan Bintang'),
(373, 24, 'Puncak'),
(374, 24, 'Puncak Jaya'),
(392, 24, 'Sarmi'),
(443, 24, 'Supiori'),
(484, 24, 'Tolikara'),
(495, 24, 'Waropen'),
(499, 24, 'Yahukimo'),
(500, 24, 'Yalimo'),
(124, 25, 'Fakfak'),
(165, 25, 'Kaimana'),
(272, 25, 'Manokwari'),
(273, 25, 'Manokwari Selatan'),
(277, 25, 'Maybrat'),
(346, 25, 'Pegunungan Arfak'),
(378, 25, 'Raja Ampat'),
(424, 25, 'Sorong'),
(425, 25, 'Sorong'),
(426, 25, 'Sorong Selatan'),
(449, 25, 'Tambrauw'),
(474, 25, 'Teluk Bintuni'),
(475, 25, 'Teluk Wondama'),
(60, 26, 'Bengkalis'),
(120, 26, 'Dumai'),
(147, 26, 'Indragiri Hilir'),
(148, 26, 'Indragiri Hulu'),
(166, 26, 'Kampar'),
(187, 26, 'Kepulauan Meranti'),
(207, 26, 'Kuantan Singingi'),
(350, 26, 'Pekanbaru'),
(351, 26, 'Pelalawan'),
(381, 26, 'Rokan Hilir'),
(382, 26, 'Rokan Hulu'),
(406, 26, 'Siak'),
(253, 27, 'Majene'),
(262, 27, 'Mamasa'),
(265, 27, 'Mamuju'),
(266, 27, 'Mamuju Utara'),
(362, 27, 'Polewali Mandar'),
(38, 28, 'Bantaeng'),
(47, 28, 'Barru'),
(87, 28, 'Bone'),
(95, 28, 'Bulukumba'),
(123, 28, 'Enrekang'),
(132, 28, 'Gowa'),
(162, 28, 'Jeneponto'),
(244, 28, 'Luwu'),
(245, 28, 'Luwu Timur'),
(246, 28, 'Luwu Utara'),
(254, 28, 'Makassar'),
(275, 28, 'Maros'),
(328, 28, 'Palopo'),
(333, 28, 'Pangkajene Kepulauan'),
(336, 28, 'Parepare'),
(360, 28, 'Pinrang'),
(396, 28, 'Selayar (Kepulauan Selayar)'),
(408, 28, 'Sidenreng Rappang/Rapang'),
(416, 28, 'Sinjai'),
(423, 28, 'Soppeng'),
(448, 28, 'Takalar'),
(451, 28, 'Tana Toraja'),
(486, 28, 'Toraja Utara'),
(493, 28, 'Wajo'),
(25, 29, 'Banggai'),
(26, 29, 'Banggai Kepulauan'),
(98, 29, 'Buol'),
(119, 29, 'Donggala'),
(291, 29, 'Morowali'),
(329, 29, 'Palu'),
(338, 29, 'Parigi Moutong'),
(366, 29, 'Poso'),
(410, 29, 'Sigi'),
(482, 29, 'Tojo Una-Una'),
(483, 29, 'Toli-Toli'),
(53, 30, 'Bau-Bau'),
(85, 30, 'Bombana'),
(101, 30, 'Buton'),
(102, 30, 'Buton Utara'),
(182, 30, 'Kendari'),
(198, 30, 'Kolaka'),
(199, 30, 'Kolaka Utara'),
(200, 30, 'Konawe'),
(201, 30, 'Konawe Selatan'),
(202, 30, 'Konawe Utara'),
(295, 30, 'Muna'),
(494, 30, 'Wakatobi'),
(73, 31, 'Bitung'),
(81, 31, 'Bolaang Mongondow (Bolmong)'),
(82, 31, 'Bolaang Mongondow Selatan'),
(83, 31, 'Bolaang Mongondow Timur'),
(84, 31, 'Bolaang Mongondow Utara'),
(188, 31, 'Kepulauan Sangihe'),
(190, 31, 'Kepulauan Siau Tagulandang Biaro (Sitaro)'),
(192, 31, 'Kepulauan Talaud'),
(204, 31, 'Kotamobagu'),
(267, 31, 'Manado'),
(285, 31, 'Minahasa'),
(286, 31, 'Minahasa Selatan'),
(287, 31, 'Minahasa Tenggara'),
(288, 31, 'Minahasa Utara'),
(485, 31, 'Tomohon'),
(12, 32, 'Agam'),
(93, 32, 'Bukittinggi'),
(116, 32, 'Dharmasraya'),
(186, 32, 'Kepulauan Mentawai'),
(236, 32, 'Lima Puluh Koto/Kota'),
(318, 32, 'Padang'),
(321, 32, 'Padang Panjang'),
(322, 32, 'Padang Pariaman'),
(337, 32, 'Pariaman'),
(339, 32, 'Pasaman'),
(340, 32, 'Pasaman Barat'),
(345, 32, 'Payakumbuh'),
(357, 32, 'Pesisir Selatan'),
(394, 32, 'Sawah Lunto'),
(411, 32, 'Sijunjung (Sawah Lunto Sijunjung)'),
(420, 32, 'Solok'),
(421, 32, 'Solok'),
(422, 32, 'Solok Selatan'),
(453, 32, 'Tanah Datar'),
(40, 33, 'Banyuasin'),
(121, 33, 'Empat Lawang'),
(220, 33, 'Lahat'),
(242, 33, 'Lubuk Linggau'),
(292, 33, 'Muara Enim'),
(297, 33, 'Musi Banyuasin'),
(298, 33, 'Musi Rawas'),
(312, 33, 'Ogan Ilir'),
(313, 33, 'Ogan Komering Ilir'),
(314, 33, 'Ogan Komering Ulu'),
(315, 33, 'Ogan Komering Ulu Selatan'),
(316, 33, 'Ogan Komering Ulu Timur'),
(324, 33, 'Pagar Alam'),
(327, 33, 'Palembang'),
(367, 33, 'Prabumulih'),
(15, 34, 'Asahan'),
(52, 34, 'Batu Bara'),
(70, 34, 'Binjai'),
(110, 34, 'Dairi'),
(112, 34, 'Deli Serdang'),
(137, 34, 'Gunungsitoli'),
(146, 34, 'Humbang Hasundutan'),
(173, 34, 'Karo'),
(217, 34, 'Labuhan Batu'),
(218, 34, 'Labuhan Batu Selatan'),
(219, 34, 'Labuhan Batu Utara'),
(229, 34, 'Langkat'),
(268, 34, 'Mandailing Natal'),
(278, 34, 'Medan'),
(307, 34, 'Nias'),
(308, 34, 'Nias Barat'),
(309, 34, 'Nias Selatan'),
(310, 34, 'Nias Utara'),
(319, 34, 'Padang Lawas'),
(320, 34, 'Padang Lawas Utara'),
(323, 34, 'Padang Sidempuan'),
(325, 34, 'Pakpak Bharat'),
(353, 34, 'Pematang Siantar'),
(389, 34, 'Samosir'),
(404, 34, 'Serdang Bedagai'),
(407, 34, 'Sibolga'),
(413, 34, 'Simalungun'),
(459, 34, 'Tanjung Balai'),
(463, 34, 'Tapanuli Selatan'),
(464, 34, 'Tapanuli Tengah'),
(465, 34, 'Tapanuli Utara'),
(470, 34, 'Tebing Tinggi'),
(481, 34, 'Toba Samosir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_pembayaran_bonus`
--

CREATE TABLE `rb_pembayaran_bonus` (
  `id_pembayaran_bonus` int(10) NOT NULL,
  `username` varchar(60) NOT NULL,
  `nominal_bayar` int(10) NOT NULL,
  `waktu_bayar` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_pembayaran_bonus`
--

INSERT INTO `rb_pembayaran_bonus` (`id_pembayaran_bonus`, `username`, `nominal_bayar`, `waktu_bayar`) VALUES
(1, 'arsenio', 50000, '2017-04-11'),
(2, 'robby', 70000, '2017-04-11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_pembelian`
--

CREATE TABLE `rb_pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `kode_pembelian` varchar(50) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `waktu_beli` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_pembelian`
--

INSERT INTO `rb_pembelian` (`id_pembelian`, `kode_pembelian`, `id_supplier`, `waktu_beli`) VALUES
(1, 'PO-0001', 1, '2017-05-23 10:13:05'),
(2, 'PO-0002', 2, '2017-05-24 07:05:11'),
(3, 'PO-0003', 1, '2017-05-27 14:58:50'),
(5, 'PO-0004', 1, '2017-05-30 09:30:02'),
(6, 'PO-0005', 1, '2017-06-01 10:29:39'),
(8, 'PO-0006', 1, '2019-02-20 07:44:57'),
(9, 'PO-2007', 2, '2019-03-21 10:01:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_pembelian_detail`
--

CREATE TABLE `rb_pembelian_detail` (
  `id_pembelian_detail` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_pesan` int(11) NOT NULL,
  `jumlah_pesan` int(11) NOT NULL,
  `satuan` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_pembelian_detail`
--

INSERT INTO `rb_pembelian_detail` (`id_pembelian_detail`, `id_pembelian`, `id_produk`, `harga_pesan`, `jumlah_pesan`, `satuan`) VALUES
(1, 1, 1, 260000, 100, 'pcs'),
(2, 1, 2, 455000, 150, 'pcs'),
(3, 2, 1, 255000, 235, 'pcs'),
(5, 2, 2, 3000000, 58, 'pcs'),
(9, 3, 1, 600000, 3, 'pcs'),
(7, 3, 2, 3000000, 43, 'pcs'),
(12, 5, 6, 320000, 25, 'unit'),
(13, 5, 5, 6990000, 10, 'unit'),
(14, 5, 4, 1000000, 45, 'unit'),
(16, 6, 13, 45900, 16, 'pcs'),
(17, 6, 12, 490000, 12, 'unit'),
(18, 6, 11, 8299000, 10, 'pcs'),
(19, 6, 9, 584000, 15, 'unit'),
(20, 6, 8, 275000, 6, 'unit'),
(21, 6, 7, 879000, 11, 'unit'),
(22, 6, 3, 14998000, 1, 'unit'),
(23, 6, 0, 0, 0, ''),
(26, 8, 13, 55000, 8, 'pcs'),
(27, 9, 13, 55000, 13, 'pcs');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_pencairan_bonus`
--

CREATE TABLE `rb_pencairan_bonus` (
  `id_pencairan_bonus` int(11) NOT NULL,
  `id_reseller` int(11) NOT NULL,
  `bonus_referral` int(11) NOT NULL,
  `waktu_pencairan` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_pencairan_bonus`
--

INSERT INTO `rb_pencairan_bonus` (`id_pencairan_bonus`, `id_reseller`, `bonus_referral`, `waktu_pencairan`) VALUES
(7, 10, 0, '2020-10-12 00:16:05'),
(8, 10, 4, '2020-10-12 01:07:22'),
(9, 10, 6, '2020-10-12 01:07:28'),
(10, 10, 120340, '2021-07-03 12:02:41'),
(11, 10, 0, '2021-07-03 12:02:47'),
(16, 12, 100000, '2021-07-04 12:47:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_pencairan_reward`
--

CREATE TABLE `rb_pencairan_reward` (
  `id_pencairan_reward` int(11) NOT NULL,
  `id_reseller` int(11) NOT NULL,
  `id_reward` int(11) NOT NULL,
  `reward_date` varchar(10) NOT NULL,
  `waktu_pencairan` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_pencairan_reward`
--

INSERT INTO `rb_pencairan_reward` (`id_pencairan_reward`, `id_reseller`, `id_reward`, `reward_date`, `waktu_pencairan`) VALUES
(5, 2, 1, '2019-03', '2019-03-22 09:12:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_penjualan`
--

CREATE TABLE `rb_penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `kode_transaksi` varchar(50) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `id_penjual` int(11) NOT NULL DEFAULT 0,
  `status_pembeli` enum('reseller','konsumen') NOT NULL,
  `status_penjual` enum('admin','reseller') NOT NULL,
  `kurir` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `waktu_transaksi` datetime NOT NULL,
  `proses` enum('0','1','2') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_penjualan`
--

INSERT INTO `rb_penjualan` (`id_penjualan`, `kode_transaksi`, `id_pembeli`, `id_penjual`, `status_pembeli`, `status_penjual`, `kurir`, `service`, `ongkir`, `waktu_transaksi`, `proses`) VALUES
(2, 'TRX-0002', 2, 1, 'reseller', 'admin', '', '', 0, '2017-05-28 08:23:40', '1'),
(3, 'TRX-0003', 3, 1, 'reseller', 'admin', '', '', 0, '2017-05-28 09:00:33', '1'),
(4, 'TRX-0004', 2, 1, 'reseller', 'admin', '', '', 0, '2017-05-30 10:50:55', '1'),
(12, 'TRX-20170531115350', 1, 1, 'konsumen', 'reseller', '', '', 0, '2017-05-31 11:53:50', '0'),
(14, 'TRX-20170601121916', 2, 1, 'reseller', 'admin', '', '', 0, '2017-06-01 12:19:16', '1'),
(15, 'TRX-20170601171840', 2, 1, 'reseller', 'admin', '', '', 0, '2017-06-01 17:18:40', '1'),
(20, 'TRX-20170602152730', 1, 1, 'konsumen', 'reseller', '', '', 0, '2017-06-02 15:27:30', '0'),
(73, 'TRX-20190216111223', 1, 2, 'konsumen', 'reseller', 'pos', 'Express Next Day Barang', 17000, '2019-02-16 11:12:51', '0'),
(74, 'TRX-20190216112320', 1, 2, 'konsumen', 'reseller', 'jne', 'YES', 17000, '2019-02-16 11:23:38', '0'),
(42, 'TRX-20170604112343', 3, 1, 'reseller', 'admin', '', '', 0, '2017-06-04 11:23:47', '1'),
(43, 'TRX-20170604112516', 3, 3, 'konsumen', 'reseller', '', '', 0, '2017-06-04 11:25:16', '1'),
(75, 'TRX-20190220070740', 2, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2019-02-20 07:07:40', '1'),
(76, 'TRX-20190220070746', 2, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2019-02-20 07:07:46', '1'),
(77, 'TRX-20190220072137', 2, 1, 'reseller', 'admin', '', '', 0, '2019-02-20 07:21:37', '1'),
(53, 'TRX-20180725083202', 1, 2, 'konsumen', 'reseller', 'pos', 'Paket Kilat Khusus', 76500, '2018-07-25 08:32:02', '0'),
(79, 'TRX-20190223150806', 1, 2, 'konsumen', 'reseller', 'pos', 'Express Next Day Barang', 34000, '2019-02-23 15:08:06', '1'),
(58, 'TRX-20180912144318', 2, 1, 'reseller', 'admin', '', '', 0, '2018-09-12 14:43:18', '2'),
(61, 'TRX-20181223070005', 1, 2, 'konsumen', 'reseller', 'tiki', 'ONS', 10000, '2018-12-23 07:00:16', '2'),
(62, 'TRX-20181223080117', 1, 2, 'konsumen', 'reseller', 'pos', 'Paket Kilat Khusus', 8000, '2018-12-23 08:01:17', '0'),
(63, 'TRX-20181223080145', 26, 2, 'konsumen', 'reseller', 'tiki', 'ONS', 17000, '2018-12-23 08:09:17', '0'),
(67, 'TRX-20181226072823', 2, 1, 'reseller', 'admin', '', '', 0, '2018-12-26 07:28:23', '1'),
(68, 'TRX-20181226073542', 2, 1, 'reseller', 'admin', '', '', 0, '2018-12-26 07:35:42', '2'),
(81, 'TRX-20190321080106', 2, 1, 'reseller', 'admin', '', 'TRX-20190220072137', 0, '2019-03-21 08:01:06', '1'),
(167, 'ANDRO-2021070167', 28, 12, 'konsumen', 'reseller', '-', 'Via_Android', 0, '0000-00-00 00:00:00', '1'),
(82, 'TRX-20190321114415', 2, 1, 'reseller', 'admin', '', '', 0, '2019-03-21 11:44:15', '1'),
(83, 'TRX-20190321115249', 2, 1, 'reseller', 'admin', '', 'TRX-20190321114415', 0, '2019-03-21 11:52:49', '1'),
(85, 'TRX-20190321120328', 1, 2, 'konsumen', 'reseller', 'jne', 'YES', 17000, '2019-03-21 12:03:28', '1'),
(86, 'TRX-20190321120745', 1, 2, 'konsumen', 'reseller', 'pos', 'Paket Kilat Khusus', 11000, '2019-03-21 12:07:45', '1'),
(87, 'TRX-20190321121109', 2, 2, 'konsumen', 'reseller', 'pos', 'Express Next Day Barang', 17000, '2019-03-21 12:11:09', '2'),
(162, 'TRX-20210704200851', 28, 12, 'konsumen', 'reseller', '', '', 0, '2021-07-04 20:09:26', '1'),
(163, 'TRX-20210704201751', 12, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2021-07-04 20:17:51', '1'),
(164, 'TRX-20210711194557', 28, 12, 'konsumen', 'reseller', 'jne', 'CTC', 60000, '2021-07-11 19:45:57', '2'),
(165, 'TRX-20210712164000', 12, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2021-07-12 16:40:00', '1'),
(166, 'ANDRO-2021070166', 28, 12, 'konsumen', 'reseller', '-', 'Via_Android', 0, '0000-00-00 00:00:00', '1'),
(95, 'TRX-20190324101735', 3, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2019-03-24 10:17:35', '1'),
(96, 'TRX-20190324101739', 3, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2019-03-24 10:17:39', '1'),
(97, 'TRX-20190324101743', 3, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2019-03-24 10:17:43', '1'),
(98, 'TRX-20190324101747', 3, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2019-03-24 10:17:47', '1'),
(99, 'TRX-20190324101751', 3, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2019-03-24 10:17:51', '1'),
(100, 'TRX-20190324110240', 1, 1, 'konsumen', 'reseller', '', '', 0, '2019-03-24 11:16:41', '0'),
(101, 'TRX-20190325103704', 1, 2, 'konsumen', 'reseller', 'pos', 'Express Next Day Barang', 17000, '2019-03-25 10:38:02', '0'),
(105, 'TRX-20190703062416', 1, 1, 'konsumen', 'reseller', 'pos', 'Express Sameday Barang', 18000, '2019-07-03 06:24:16', '0'),
(106, 'TRX-20190703074508', 1, 2, 'konsumen', 'reseller', 'pos', 'Express Next Day Barang', 17000, '2019-07-03 07:45:08', '2'),
(107, 'TRX-20190817071150', 1, 3, 'konsumen', 'reseller', '', '', 0, '2019-08-17 07:11:50', '0'),
(108, 'TRX-20190831204112', 1, 3, 'konsumen', 'reseller', 'tiki', 'REG', 216000, '2019-08-31 20:41:12', '0'),
(109, 'TRX-20190901064338', 1, 1, 'konsumen', 'reseller', '', '', 0, '2019-09-01 06:52:03', '0'),
(110, 'TRX-20191203113328', 1, 2, 'konsumen', 'reseller', '', '', 0, '2019-12-03 11:33:40', '0'),
(111, 'TRX-20191203113402', 1, 2, 'konsumen', 'reseller', 'pos', 'Paket Kilat Khusus', 11000, '2019-12-03 11:34:02', '1'),
(112, 'TRX-20191203114327', 1, 2, 'konsumen', 'reseller', 'pos', 'Express Next Day Barang', 17000, '2019-12-03 11:43:27', '1'),
(140, 'TRX-20201012004011', 27, 10, 'konsumen', 'reseller', '', '', 0, '2020-10-12 00:40:11', '1'),
(114, 'TRX-20200612101356', 1, 2, 'konsumen', 'reseller', 'jne', 'REG', 11000, '2020-06-12 10:16:06', '0'),
(115, 'TRX-20200625165712', 1, 3, 'konsumen', 'reseller', 'tiki', 'ECO', 50000, '2020-06-25 16:57:12', '0'),
(116, 'TRX-20200625165750', 1, 3, 'konsumen', 'reseller', '', '', 0, '2020-06-25 16:57:50', '0'),
(168, 'ANDRO-2021070168', 28, 12, 'konsumen', 'reseller', '-', 'Via_Android', 0, '0000-00-00 00:00:00', '1'),
(141, 'TRX-20201012010139', 27, 10, 'konsumen', 'reseller', 'tiki', 'REG', 32000, '2020-10-12 01:01:39', '1'),
(121, 'TRX-20200703172915', 1, 2, 'konsumen', 'reseller', '', '', 0, '2020-07-03 17:29:29', '0'),
(125, 'TRX-20200707133923', 1, 2, 'konsumen', 'reseller', 'cod', 'Cash on delivery', 500, '2020-07-07 13:39:23', '0'),
(128, 'TRX-20200707135033', 1, 2, 'konsumen', 'reseller', 'jne', 'YES', 10000, '2020-07-07 13:50:33', '0'),
(129, 'TRX-20200707140121', 1, 2, 'konsumen', 'reseller', '', '', 0, '2020-07-07 14:01:42', '2'),
(130, 'TRX-20201011234546', 27, 3, 'konsumen', 'reseller', '', '', 0, '2020-10-11 23:45:46', '2'),
(131, 'TRX-20201011235304', 10, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2020-10-11 23:53:04', '1'),
(133, 'TRX-20201011235649', 27, 10, 'konsumen', 'reseller', 'jne', 'REG', 11000, '2020-10-11 23:56:49', '1'),
(142, 'TRX-20201014000642', 10, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2020-10-14 00:06:42', '1'),
(143, 'TRX-20201014000849', 27, 10, 'konsumen', 'reseller', 'jne', 'REG', 88000, '2020-10-14 00:08:49', '1'),
(144, 'TRX-20201015211456', 27, 2, 'konsumen', 'reseller', 'jne', 'Cash on delivery', 500, '2020-10-15 21:14:56', '0'),
(147, 'TRX-20201015214738', 27, 2, 'konsumen', 'reseller', 'tiki', 'ECO', 10000, '2020-10-15 21:47:38', '0'),
(149, 'TRX-20201015215733', 27, 10, 'konsumen', 'reseller', 'jne', 'CTC', 12000, '2020-10-15 21:57:33', '0'),
(151, 'TRX-20210703190245', 11, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2021-07-03 19:02:45', '1'),
(152, 'TRX-20210703195242', 12, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2021-07-03 19:52:42', '1'),
(153, 'TRX-20210703204540', 28, 12, 'konsumen', 'reseller', 'jne', 'CTC', 6000, '2021-07-03 20:45:56', '1'),
(154, 'TRX-20210704115910', 28, 12, 'konsumen', 'reseller', 'jne', 'CTC', 6000, '2021-07-04 12:03:50', '1'),
(155, 'TRX-20210704122031', 28, 12, 'konsumen', 'reseller', 'jne', 'CTC', 6000, '2021-07-04 12:20:31', '1'),
(156, 'TRX-20210704125038', 12, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2021-07-04 12:50:38', '1'),
(158, 'TRX-20210704130336', 28, 12, 'konsumen', 'reseller', '', '', 0, '2021-07-04 13:04:04', '1'),
(159, 'TRX-20210704130847', 12, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2021-07-04 13:08:47', '1'),
(161, 'TRX-20210704131403', 28, 12, 'konsumen', 'reseller', 'jne', 'CTC', 60000, '2021-07-04 13:14:03', '1'),
(169, 'ANDRO-2021070169', 28, 12, 'konsumen', 'reseller', '-', 'Via_Android', 0, '0000-00-00 00:00:00', '1'),
(170, 'ANDRO-2021070170', 28, 12, 'konsumen', 'reseller', '-', 'Via_Android', 0, '0000-00-00 00:00:00', '1'),
(171, 'ANDRO-2021070171', 28, 12, 'konsumen', 'reseller', '-', 'Via_Android', 0, '0000-00-00 00:00:00', '1'),
(172, 'ANDRO-2021070172', 28, 12, 'konsumen', 'reseller', '-', 'Via_Android', 0, '0000-00-00 00:00:00', '1'),
(174, 'TRX-20210720164633', 28, 12, 'konsumen', 'reseller', '', '', 0, '2021-07-20 16:46:33', '1'),
(175, 'TRX-20210720165713', 28, 12, 'konsumen', 'reseller', '', '', 0, '2021-07-20 16:57:13', '1'),
(176, 'TRX-20210720181623', 28, 12, 'konsumen', 'reseller', 'jne', 'CTC', 18000, '2021-07-20 18:16:23', '1'),
(177, 'TRX-20210720182258', 28, 12, 'konsumen', 'reseller', 'cod', 'Cash on delivery', 1000, '2021-07-20 18:23:29', '2'),
(178, 'TRX-20210720203548', 12, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2021-07-20 20:35:48', '1'),
(179, 'TRX-20210720203615', 12, 1, 'reseller', 'admin', '', 'Stok Otomatis (Pribadi)', 0, '2021-07-20 20:36:15', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_penjualan_detail`
--

CREATE TABLE `rb_penjualan_detail` (
  `id_penjualan_detail` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `satuan` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_penjualan_detail`
--

INSERT INTO `rb_penjualan_detail` (`id_penjualan_detail`, `id_penjualan`, `id_produk`, `jumlah`, `diskon`, `harga_jual`, `satuan`) VALUES
(238, 167, 37, 10, 0, 9000, 'Kg'),
(237, 165, 37, 100, 0, 0, 'Kg'),
(3, 2, 2, 3, 50000, 3200000, 'pcs'),
(5, 2, 1, 1, 0, 650000, 'pcs'),
(7, 3, 1, 2, 0, 650000, 'pcs'),
(8, 3, 2, 50, 120000, 3200000, 'pcs'),
(9, 4, 11, 5, 0, 8500000, 'pcs'),
(10, 4, 12, 10, 0, 500000, 'unit'),
(11, 4, 13, 15, 0, 55000, 'pcs'),
(12, 4, 9, 12, 0, 625000, 'unit'),
(13, 4, 8, 3, 0, 300000, 'unit'),
(14, 4, 7, 7, 0, 900000, 'unit'),
(15, 4, 6, 1, 0, 330000, 'unit'),
(16, 4, 5, 8, 0, 7100000, 'unit'),
(29, 10, 13, 1, 0, 65000, 'pcs'),
(126, 69, 1, 1, 0, 70000, 'pcs'),
(30, 10, 2, 1, 0, 3500000, 'pcs'),
(138, 75, 14, 10, 0, 95000, 'pcs'),
(32, 12, 2, 1, 0, 3500000, 'pcs'),
(33, 12, 1, 1, 0, 700000, 'pcs'),
(37, 14, 13, 5, 0, 55000, 'pcs'),
(38, 14, 4, 3, 0, 1110000, 'unit'),
(40, 15, 9, 2, 50000, 625000, 'unit'),
(41, 15, 12, 3, 0, 500000, 'unit'),
(127, 69, 8, 2, 0, 34500, 'unit'),
(137, 74, 1, 1, 0, 70000, 'pcs'),
(46, 19, 12, 1, 0, 608000, 'unit'),
(47, 19, 9, 1, 0, 670000, 'unit'),
(48, 20, 2, 1, 0, 3500000, 'pcs'),
(139, 76, 14, 2, 0, 95000, 'pcs'),
(136, 74, 13, 1, 0, 57000, 'pcs'),
(135, 73, 13, 1, 0, 57000, 'pcs'),
(134, 73, 1, 1, 0, 70000, 'pcs'),
(81, 43, 4, 1, 0, 1299000, 'unit'),
(79, 42, 2, 5, 0, 3200000, 'pcs'),
(80, 42, 4, 7, 0, 1110000, 'unit'),
(82, 43, 2, 1, 0, 3500000, 'pcs'),
(141, 78, 5, 1, 0, 755000, 'unit'),
(140, 77, 13, 10, 0, 60000, 'pcs'),
(142, 78, 14, 1, 0, 100000, 'pcs'),
(143, 79, 14, 1, 0, 100000, 'pcs'),
(144, 79, 4, 1, 0, 40900, 'unit'),
(95, 53, 13, 1, 0, 60000, 'pcs'),
(96, 53, 8, 1, 0, 345000, 'unit'),
(145, 79, 7, 1, 0, 89000, 'unit'),
(146, 79, 12, 1, 0, 23000, 'unit'),
(147, 80, 16, 4, 0, 0, 'asd'),
(103, 58, 6, 10, 0, 70000, 'unit'),
(111, 61, 13, 1, 0, 60000, 'pcs'),
(112, 61, 4, 1, 0, 40900, 'unit'),
(113, 62, 5, 1, 0, 755000, 'unit'),
(114, 63, 1, 1, 0, 70000, 'pcs'),
(115, 63, 12, 1, 0, 23000, 'unit'),
(123, 68, 3, 5, 0, 164980, 'unit'),
(122, 67, 4, 1, 0, 124900, 'unit'),
(124, 68, 9, 8, 0, 63500, 'unit'),
(148, 81, 17, 10, 0, 60000, 'pcs'),
(149, 82, 18, 5, 0, 720000, 'Unit'),
(150, 83, 19, 5, 0, 720000, 'Unit'),
(152, 85, 19, 1, 0, 759000, 'Unit'),
(153, 86, 17, 2, 0, 65000, 'pcs'),
(154, 87, 17, 1, 0, 65000, 'pcs'),
(234, 162, 36, 100, 0, 15000, 'Kg'),
(235, 163, 36, 110, 0, 0, 'Kg'),
(236, 164, 36, 10, 0, 15000, 'Kg'),
(162, 95, 26, 5, 0, 34750000, 'Unit'),
(163, 96, 25, 6, 0, 21449000, 'Unit'),
(164, 97, 24, 2, 0, 21465000, 'Unit'),
(165, 98, 23, 1, 0, 31520000, 'Unit'),
(166, 99, 21, 12, 0, 13000000, 'Unit'),
(167, 100, 12, 1, 0, 66000, 'unit'),
(168, 101, 9, 1, 15000, 68500, 'unit'),
(172, 105, 11, 1, 0, 89000, 'pcs'),
(173, 106, 19, 1, 0, 759000, 'Unit'),
(174, 107, 25, 1, 0, 22449000, 'Unit'),
(175, 107, 21, 2, 0, 16500000, 'Unit'),
(176, 108, 26, 2, 0, 35750000, 'Unit'),
(177, 108, 21, 1, 0, 16500000, 'Unit'),
(178, 109, 11, 1, 0, 89000, 'pcs'),
(179, 109, 10, 1, 0, 59900, 'pcs'),
(180, 109, 12, 2, 0, 66000, 'unit'),
(181, 111, 19, 1, 0, 759000, 'Unit'),
(182, 112, 19, 1, 0, 759000, 'Unit'),
(204, 133, 0, 0, 0, 0, ''),
(184, 114, 14, 1, 0, 100000, 'pcs'),
(185, 115, 26, 1, 0, 35750000, 'Unit'),
(186, 116, 25, 1, 0, 22449000, 'Unit'),
(239, 168, 37, 15, 0, 9000, 'Kg'),
(211, 140, 29, 1, 0, 5277000, 'Unit'),
(191, 121, 14, 1, 0, 100000, 'pcs'),
(195, 125, 14, 1, 0, 100000, 'pcs'),
(198, 128, 14, 1, 0, 100000, 'pcs'),
(199, 129, 14, 1, 0, 100000, 'pcs'),
(200, 130, 25, 1, 0, 22449000, 'Unit'),
(201, 131, 29, 10, 0, 0, 'Unit'),
(203, 133, 29, 1, 0, 5277000, 'Unit'),
(212, 141, 29, 2, 0, 5277000, 'Unit'),
(213, 142, 29, 4, 0, 0, 'Unit'),
(214, 143, 29, 8, 0, 5277000, 'Unit'),
(215, 144, 7, 1, 0, 89000, 'unit'),
(218, 147, 4, 1, 0, 40900, 'unit'),
(220, 149, 29, 1, 0, 5277000, 'Unit'),
(222, 151, 35, 100, 0, 0, 'Pcs'),
(223, 152, 36, 100, 0, 0, 'Kg'),
(224, 153, 36, 3, 0, 15000, 'Kg'),
(226, 154, 36, 20, 0, 15000, 'Kg'),
(227, 155, 36, 10, 0, 15000, 'Kg'),
(228, 156, 36, 33, 0, 0, 'Kg'),
(230, 158, 36, 100, 0, 15000, 'Kg'),
(231, 159, 36, 200, 0, 0, 'Kg'),
(233, 161, 36, 10, 0, 15000, 'Kg'),
(240, 169, 36, 10, 0, 15000, 'Kg'),
(241, 169, 36, 50, 0, 15000, 'Kg'),
(242, 170, 37, 12, 0, 9000, 'Kg'),
(243, 172, 37, 13, 0, 9000, 'Kg'),
(245, 174, 37, 3, 0, 9000, 'Kg'),
(246, 174, 36, 10, 0, 15000, 'Kg'),
(247, 175, 36, 5, 0, 15000, 'Kg'),
(248, 176, 37, 3, 0, 9000, 'Kg'),
(249, 177, 37, 6, 0, 9000, 'Kg'),
(250, 178, 37, 56, 0, 0, 'Kg'),
(251, 179, 36, 75, 0, 0, 'Kg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_penjualan_temp`
--

CREATE TABLE `rb_penjualan_temp` (
  `id_penjualan_detail` int(11) NOT NULL,
  `session` varchar(50) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `diskon` int(11) DEFAULT NULL,
  `harga_jual` int(11) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `waktu_order` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_penjualan_temp`
--

INSERT INTO `rb_penjualan_temp` (`id_penjualan_detail`, `session`, `id_produk`, `jumlah`, `diskon`, `harga_jual`, `satuan`, `waktu_order`) VALUES
(7, 'TRX-20180812160418', 13, 1, 0, 60000, 'pcs', '2018-08-12 16:04:18'),
(8, 'TRX-20180812163525', 11, 1, 0, 8900000, 'pcs', '2018-08-12 16:35:25'),
(10, 'TRX-20180911095555', 6, 1, 0, 75000, 'unit', '2018-09-11 09:55:55'),
(11, 'TRX-20180911104512', 13, 1, 0, 60000, 'pcs', '2018-09-11 10:45:12'),
(12, 'TRX-20180911113613', 8, 1, 0, 34500, 'unit', '2018-09-11 11:36:13'),
(13, 'TRX-20180911114335', 5, 1, 0, 755000, 'unit', '2018-09-11 11:43:35'),
(14, 'TRX-20180911114532', 6, 1, 0, 75000, 'unit', '2018-09-11 11:45:32'),
(15, 'TRX-20180911120326', 5, 1, 0, 755000, 'unit', '2018-09-11 12:03:26'),
(16, 'TRX-20180912152157', 6, 1, 0, 75000, 'unit', '2018-09-12 15:21:57'),
(17, 'TRX-20180912182409', 7, 1, 0, 89000, 'unit', '2018-09-12 18:24:09'),
(18, 'TRX-20181221080543', 5, 1, 0, 755000, 'unit', '2018-12-21 08:05:43'),
(20, 'TRX-20181221080543', 12, 1, 0, 23000, 'unit', '2018-12-21 08:21:19'),
(21, 'TRX-20181222101726', 5, 1, 0, 755000, 'unit', '2018-12-22 10:17:26'),
(22, 'TRX-20181222101726', 11, 1, 0, 89000, 'pcs', '2018-12-22 10:17:44'),
(23, 'TRX-20181222101726', 4, 1, 0, 40900, 'unit', '2018-12-22 10:23:08'),
(33, 'TRX-20190203063622', 9, 1, 0, 53500, 'unit', '2019-02-03 06:36:22'),
(31, 'TRX-20181226094641', 13, 1, 0, 57000, 'pcs', '2018-12-26 09:46:41'),
(43, 'TRX-20190324190938', 14, 1, 0, 100000, 'pcs', '2019-03-24 19:09:38'),
(48, 'TRX-20190326080841', 14, 1, 0, 100000, 'pcs', '2019-03-26 08:08:41'),
(49, 'TRX-20190326150117', 14, 1, 0, 100000, 'pcs', '2019-03-26 15:01:17'),
(54, 'TRX-20191203113328', 19, 1, NULL, 759000, 'Unit', '2019-12-03 11:33:28'),
(55, 'TRX-20191221134255', 25, 1, 0, 22449000, 'Unit', '2019-12-21 13:42:55'),
(64, 'TRX-20201011013137', 9, 2, 15000, 68500, 'unit', '2020-10-11 01:31:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_produk`
--

CREATE TABLE `rb_produk` (
  `id_produk` int(11) NOT NULL,
  `id_produk_perusahaan` int(11) NOT NULL,
  `id_kategori_produk` int(11) NOT NULL,
  `id_kategori_produk_sub` int(11) NOT NULL,
  `id_reseller` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `produk_seo` varchar(255) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_reseller` int(11) NOT NULL,
  `harga_konsumen` int(11) NOT NULL,
  `berat` varchar(50) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_produk`
--

INSERT INTO `rb_produk` (`id_produk`, `id_produk_perusahaan`, `id_kategori_produk`, `id_kategori_produk_sub`, `id_reseller`, `nama_produk`, `produk_seo`, `satuan`, `harga_beli`, `harga_reseller`, `harga_konsumen`, `berat`, `gambar`, `keterangan`, `username`, `waktu_input`) VALUES
(37, 0, 9, 0, 12, 'Konco Ngarit', 'konco-ngarit', 'Kg', 5000, 0, 50000, '1000', 'bio_2.jpg', '<p>Di Tuku Murah, Iso gawe batur kencan yo\'an</p>', 'AgenKemanisan', '2021-07-12 16:40:00'),
(36, 0, 6, 6, 12, 'Gula Merah Tebu Khas Tulungagung', 'gula-merah-tebu-khas-tulungagung', 'Kg', 10000, 0, 15000, '1000', 'gula_merah10.jpg', '<p>Lek Ra Kuat Rasah Tuku, Mulih\'o wae tuku permen</p>', 'AgenKemanisan', '2021-07-03 19:52:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_produk_diskon`
--

CREATE TABLE `rb_produk_diskon` (
  `id_produk_diskon` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_reseller` int(11) NOT NULL,
  `diskon` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_produk_diskon`
--

INSERT INTO `rb_produk_diskon` (`id_produk_diskon`, `id_produk`, `id_reseller`, `diskon`) VALUES
(1, 13, 2, 8000),
(2, 12, 2, 42000),
(3, 9, 2, 15000),
(4, 7, 2, 10000),
(5, 4, 2, 89000),
(7, 2, 2, 100000),
(8, 14, 1, 10),
(9, 14, 2, 0),
(10, 16, 2, 342),
(11, 12, 1, 0),
(12, 11, 1, 0),
(13, 10, 1, 0),
(14, 26, 3, 0),
(15, 25, 3, 0),
(16, 24, 3, 0),
(17, 23, 3, 0),
(18, 21, 3, 0),
(19, 27, 1, 1000),
(20, 29, 10, 0),
(21, 36, 12, 0),
(22, 37, 12, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_provinsi`
--

CREATE TABLE `rb_provinsi` (
  `provinsi_id` int(11) NOT NULL,
  `nama_provinsi` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_provinsi`
--

INSERT INTO `rb_provinsi` (`provinsi_id`, `nama_provinsi`) VALUES
(1, 'Bali'),
(2, 'Bangka Belitung'),
(3, 'Banten'),
(4, 'Bengkulu'),
(5, 'DI Yogyakarta'),
(6, 'DKI Jakarta'),
(7, 'Gorontalo'),
(8, 'Jambi'),
(9, 'Jawa Barat'),
(10, 'Jawa Tengah'),
(11, 'Jawa Timur'),
(12, 'Kalimantan Barat'),
(13, 'Kalimantan Selatan'),
(14, 'Kalimantan Tengah'),
(15, 'Kalimantan Timur'),
(16, 'Kalimantan Utara'),
(17, 'Kepulauan Riau'),
(18, 'Lampung'),
(19, 'Maluku'),
(20, 'Maluku Utara'),
(21, 'Nanggroe Aceh Darussalam (NAD)'),
(22, 'Nusa Tenggara Barat (NTB)'),
(23, 'Nusa Tenggara Timur (NTT)'),
(24, 'Papua'),
(25, 'Papua Barat'),
(26, 'Riau'),
(27, 'Sulawesi Barat'),
(28, 'Sulawesi Selatan'),
(29, 'Sulawesi Tengah'),
(30, 'Sulawesi Tenggara'),
(31, 'Sulawesi Utara'),
(32, 'Sumatera Barat'),
(33, 'Sumatera Selatan'),
(34, 'Sumatera Utara');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_rekening`
--

CREATE TABLE `rb_rekening` (
  `id_rekening` int(5) NOT NULL,
  `nama_bank` varchar(50) NOT NULL,
  `no_rekening` varchar(50) NOT NULL,
  `pemilik_rekening` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_rekening`
--

INSERT INTO `rb_rekening` (`id_rekening`, `nama_bank`, `no_rekening`, `pemilik_rekening`) VALUES
(1, 'Bank BNI Syariah', '123456789', 'PT. Kemanisan Indonesia'),
(2, 'Bank Mandiri Syariah', '123456789', 'PT. Kemanisan Indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_rekening_reseller`
--

CREATE TABLE `rb_rekening_reseller` (
  `id_rekening_reseller` int(11) NOT NULL,
  `id_reseller` int(11) NOT NULL,
  `nama_bank` varchar(50) NOT NULL,
  `no_rekening` varchar(50) NOT NULL,
  `pemilik_rekening` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_rekening_reseller`
--

INSERT INTO `rb_rekening_reseller` (`id_rekening_reseller`, `id_reseller`, `nama_bank`, `no_rekening`, `pemilik_rekening`) VALUES
(1, 2, 'Bank Danamon', '56234234000', 'Syarii Sentral'),
(2, 2, 'Bank BCA', '10823422', 'Syarii Sentral'),
(3, 3, 'Bank Mandiri', '234123123332', 'Kalifah Umayyah'),
(6, 10, 'BNI', '123456789', 'Gunawan'),
(7, 12, 'BRI', '1234567', 'Kemanisan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_reseller`
--

CREATE TABLE `rb_reseller` (
  `id_reseller` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_reseller` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `kota_id` int(11) NOT NULL,
  `alamat_lengkap` text NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `kode_pos` int(7) NOT NULL,
  `keterangan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `referral` varchar(50) NOT NULL,
  `tanggal_daftar` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_reseller`
--

INSERT INTO `rb_reseller` (`id_reseller`, `username`, `password`, `nama_reseller`, `jenis_kelamin`, `kota_id`, `alamat_lengkap`, `no_telpon`, `email`, `kode_pos`, `keterangan`, `foto`, `referral`, `tanggal_daftar`) VALUES
(1, 'reseller1', 'd073f60ff87c6ffe0abd48687b939667c3bdfd019df58d670ed45d230c470b94a0389d825453d40978c48e6f49ddb1368b16c069ab8bf27cfe8a9e1e2c15e954', 'Umar Lapakers', 'Laki-laki', 318, 'Jl. Angkasa Pura Raya, No 456 BG', '681267771355', 'reseller.bukittinggi@gmail.com', 26125, 'Tidak ada keterangan...', 'Mozilla_Firefox.png', '', '2017-05-23 00:00:00'),
(12, 'AgenKemanisan', 'faf9515530e13bc3762b9b3b17487b38a5cbb49cbead9ddbffa78efc6e5e8edcdb86a6b1de45f07aaa78b34fbc5ca7792f8feb1463de81f7258f8adc4322ad88', 'Kemanisan', 'Laki-laki', 492, 'Sumbergempol, Sambidoplang', '081912940523', 'faizmuazzam.fm7@gmail.com', 66291, '', 'logo_kemanisan_resmi2.png', 'AgenKemanisan', '2021-07-03 19:19:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_reseller_cod`
--

CREATE TABLE `rb_reseller_cod` (
  `id_cod` int(11) NOT NULL,
  `id_reseller` int(11) NOT NULL,
  `nama_alamat` varchar(255) NOT NULL,
  `biaya_cod` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_reseller_cod`
--

INSERT INTO `rb_reseller_cod` (`id_cod`, `id_reseller`, `nama_alamat`, `biaya_cod`) VALUES
(1, 1, 'Ulak Karang', 5500),
(2, 1, 'Tunggul Hitam', 6500),
(4, 1, 'Lubuk Begalung', 7600),
(5, 2, 'Ulak Karang', 0),
(6, 2, 'Air Tawar', 500),
(7, 12, '(Alamat Pabrik) Desa. Sambidoplang, Kec. Sumbergempol, Kab. Tulungagung', 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_reward`
--

CREATE TABLE `rb_reward` (
  `id_reward` int(5) NOT NULL,
  `posisi` int(100) NOT NULL,
  `reward` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_setting`
--

CREATE TABLE `rb_setting` (
  `id_setting` int(11) NOT NULL,
  `referral` int(11) NOT NULL,
  `tanggal_pencairan` varchar(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_setting`
--

INSERT INTO `rb_setting` (`id_setting`, `referral`, `tanggal_pencairan`, `aktif`) VALUES
(1, 5, '1', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_supplier`
--

CREATE TABLE `rb_supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(255) NOT NULL,
  `kontak_person` varchar(100) NOT NULL,
  `alamat_lengkap` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat_email` varchar(100) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_supplier`
--

INSERT INTO `rb_supplier` (`id_supplier`, `nama_supplier`, `kontak_person`, `alamat_lengkap`, `no_hp`, `alamat_email`, `kode_pos`, `no_telpon`, `fax`, `keterangan`) VALUES
(3, 'PT. Kemanisan Indonesia', 'Faiz Muazzam', 'Ds. Sambidoplang, Kec. Sumbergempol, Kab. Tulungagung', '081912940523', 'faizmuazzam.fm7@gmail.com', 66291, '0000', '0000', 'Break The Limit adalah Kunci');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sekilasinfo`
--

CREATE TABLE `sekilasinfo` (
  `id_sekilas` int(5) NOT NULL,
  `info` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `statistik`
--

CREATE TABLE `statistik` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1,
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `statistik`
--

INSERT INTO `statistik` (`ip`, `tanggal`, `hits`, `online`) VALUES
('223.255.231.148', '2014-05-06', 1, '1399357334'),
('223.255.231.147', '2014-05-15', 3, '1400119147'),
('223.255.224.73', '2014-05-15', 12, '1400123797'),
('223.255.224.69', '2014-05-16', 2, '1400215103'),
('118.96.51.231', '2014-05-16', 19, '1400233044'),
('223.255.231.146', '2014-05-16', 2, '1400228049'),
('::1', '2014-06-20', 2, '1403230579'),
('::1', '2014-06-22', 8, '1403436591'),
('223.255.231.154', '2014-06-26', 1, '1403739948'),
('223.255.231.148', '2014-06-26', 6, '1403745715'),
('223.255.224.74', '2014-06-26', 1, '1403748060'),
('223.255.224.69', '2014-06-26', 1, '1403753239'),
('223.255.224.77', '2014-06-29', 1, '1404039342'),
('::1', '2014-07-02', 6, '1404277263'),
('127.0.0.1', '2014-07-17', 2, '1405582494'),
('127.0.0.1', '2014-07-21', 1, '1405929828'),
('36.76.60.43', '2014-07-21', 1, '1405951864'),
('223.255.231.154', '2014-07-21', 2, '1405957200'),
('223.255.227.21', '2014-07-22', 1, '1405995171'),
('223.255.231.146', '2014-07-22', 1, '1405997152'),
('223.255.227.21', '2014-07-23', 1, '1406100212'),
('223.255.227.17', '2014-07-23', 1, '1406104552'),
('223.255.227.23', '2014-07-24', 1, '1406168095'),
('223.255.231.153', '2014-07-24', 1, '1406204439'),
('223.255.231.146', '2014-07-25', 1, '1406268985'),
('180.76.5.193', '2014-08-06', 1, '1407302738'),
('180.76.5.23', '2014-08-06', 1, '1407304739'),
('202.67.36.241', '2014-08-06', 1, '1407305643'),
('198.148.27.22', '2014-08-06', 1, '1407306703'),
('180.251.170.42', '2014-08-06', 7, '1407310167'),
('128.199.171.191', '2014-08-06', 3, '1407323435'),
('223.255.231.149', '2014-08-06', 2, '1407309879'),
('223.255.227.28', '2014-08-06', 8, '1407311801'),
('103.24.49.242', '2014-08-06', 1, '1407312326'),
('223.255.231.146', '2014-08-06', 1, '1407313297'),
('180.214.233.34', '2014-08-06', 1, '1407321063'),
('66.249.77.87', '2014-08-06', 1, '1407323509'),
('223.255.227.30', '2014-08-06', 1, '1407325862'),
('180.254.207.13', '2014-08-06', 5, '1407330687'),
('114.79.13.199', '2014-08-06', 1, '1407336900'),
('202.152.199.34', '2014-08-06', 7, '1407337100'),
('180.76.6.21', '2014-08-07', 1, '1407347753'),
('114.79.13.55', '2014-08-07', 3, '1407354277'),
('114.125.41.136', '2014-08-07', 1, '1407352625'),
('180.76.6.147', '2014-08-07', 1, '1407355344'),
('180.76.6.64', '2014-08-07', 1, '1407367237'),
('69.171.247.116', '2014-08-07', 1, '1407379834'),
('69.171.247.119', '2014-08-07', 1, '1407379834'),
('69.171.247.114', '2014-08-07', 1, '1407379834'),
('69.171.247.115', '2014-08-07', 1, '1407379834'),
('202.67.34.29', '2014-08-07', 2, '1407380415'),
('36.76.52.112', '2014-08-07', 1, '1407380496'),
('223.255.231.145', '2014-08-07', 5, '1407387045'),
('223.255.231.153', '2014-08-07', 2, '1407388883'),
('223.255.227.27', '2014-08-07', 1, '1407393087'),
('180.76.5.25', '2014-08-07', 1, '1407394749'),
('223.255.231.146', '2014-08-07', 1, '1407397183'),
('157.55.39.248', '2014-08-07', 1, '1407397231'),
('180.254.200.55', '2014-08-07', 2, '1407399466'),
('110.139.67.15', '2014-08-07', 8, '1407399221'),
('180.242.17.64', '2014-08-07', 11, '1407414373'),
('141.0.8.59', '2014-08-07', 1, '1407412384'),
('110.76.149.91', '2014-08-07', 1, '1407422367'),
('223.255.231.151', '2014-08-07', 3, '1407426943'),
('82.145.209.206', '2014-08-07', 1, '1407430369'),
('223.255.227.28', '2014-08-08', 3, '1407469589'),
('66.93.156.50', '2014-08-08', 1, '1407472340'),
('202.62.17.47', '2014-08-08', 1, '1407484393'),
('36.70.135.163', '2014-08-08', 6, '1407485987'),
('173.252.74.115', '2014-08-08', 1, '1407485153'),
('118.96.58.136', '2014-08-08', 2, '1407486347'),
('114.79.29.68', '2014-08-08', 1, '1407502537'),
('66.220.156.113', '2014-08-08', 1, '1407503375'),
('112.215.66.79', '2014-08-08', 1, '1407503381'),
('125.163.113.156', '2014-08-08', 9, '1407508824'),
('180.76.5.94', '2014-08-08', 1, '1407508624'),
('120.172.9.192', '2014-08-08', 1, '1407515634'),
('202.67.41.51', '2014-08-08', 1, '1407515702'),
('180.253.243.222', '2014-08-09', 1, '1407542724'),
('36.75.224.20', '2014-08-09', 1, '1407548005'),
('180.76.5.65', '2014-08-09', 1, '1407548865'),
('66.249.77.77', '2014-08-09', 2, '1407582711'),
('180.76.6.137', '2014-08-09', 1, '1407553037'),
('66.249.77.87', '2014-08-09', 1, '1407554836'),
('66.249.77.97', '2014-08-09', 2, '1407562640'),
('120.177.44.126', '2014-08-09', 2, '1407558625'),
('223.255.231.145', '2014-08-09', 3, '1407558663'),
('36.73.64.113', '2014-08-09', 1, '1407558640'),
('36.72.187.12', '2014-08-09', 1, '1407560351'),
('202.67.41.51', '2014-08-09', 1, '1407561096'),
('114.125.60.68', '2014-08-09', 4, '1407561514'),
('202.67.40.50', '2014-08-09', 1, '1407562007'),
('180.76.6.136', '2014-08-09', 1, '1407562581'),
('110.232.81.2', '2014-08-09', 5, '1407563275'),
('146.185.28.59', '2014-08-09', 1, '1407564768'),
('120.174.157.139', '2014-08-09', 1, '1407568139'),
('223.255.227.23', '2014-08-09', 2, '1407570163'),
('193.105.210.119', '2014-08-09', 1, '1407577518'),
('125.162.57.66', '2014-08-09', 2, '1407579822'),
('180.241.163.1', '2014-08-09', 8, '1407580493'),
('36.76.44.163', '2014-08-09', 6, '1407603574'),
('180.76.5.144', '2014-08-09', 1, '1407582757'),
('107.167.103.40', '2014-08-09', 1, '1407586189'),
('36.68.48.23', '2014-08-09', 1, '1407586974'),
('192.99.218.151', '2014-08-09', 4, '1407587574'),
('36.74.55.24', '2014-08-09', 3, '1407589161'),
('118.97.212.184', '2014-08-09', 8, '1407595169'),
('36.72.114.118', '2014-08-09', 2, '1407597684'),
('180.76.5.153', '2014-08-09', 1, '1407602870'),
('180.76.5.59', '2014-08-09', 1, '1407603153'),
('180.76.5.18', '2014-08-10', 1, '1407606581'),
('180.254.155.156', '2014-08-10', 2, '1407607003'),
('180.76.6.42', '2014-08-10', 1, '1407608363'),
('36.68.242.217', '2014-08-10', 5, '1407627100'),
('66.249.77.77', '2014-08-10', 2, '1407633623'),
('202.67.44.64', '2014-08-10', 1, '1407629598'),
('180.76.6.43', '2014-08-10', 1, '1407631270'),
('118.97.212.182', '2014-08-10', 4, '1407632228'),
('139.0.102.140', '2014-08-10', 1, '1407633944'),
('66.249.77.87', '2014-08-10', 1, '1407636902'),
('66.249.77.97', '2014-08-10', 1, '1407639983'),
('180.76.6.159', '2014-08-10', 1, '1407640798'),
('118.97.212.181', '2014-08-10', 3, '1407642556'),
('36.68.46.37', '2014-08-10', 2, '1407642940'),
('180.76.5.69', '2014-08-10', 1, '1407645158'),
('180.76.5.80', '2014-08-10', 1, '1407648268'),
('180.76.5.143', '2014-08-10', 1, '1407650068'),
('223.255.231.145', '2014-08-10', 1, '1407650216'),
('180.76.6.149', '2014-08-10', 1, '1407657020'),
('36.77.183.218', '2014-08-10', 2, '1407657119'),
('127.0.0.1', '2014-08-10', 2, '1407660057'),
('127.0.0.1', '2014-08-11', 2, '1407725194'),
('127.0.0.1', '2014-08-12', 1, '1407862185'),
('127.0.0.1', '2014-08-13', 1, '1407899819'),
('127.0.0.1', '2014-08-17', 44, '1408287630'),
('127.0.0.1', '2014-08-18', 253, '1408372590'),
('127.0.0.1', '2014-08-19', 4, '1408413702'),
('::1', '2014-08-19', 90, '1408433250'),
('::1', '2014-08-31', 1, '1409487043'),
('::1', '2015-03-11', 11, '1426061663'),
('::1', '2015-03-12', 1, '1426114982'),
('::1', '2015-03-15', 32, '1426430637'),
('::1', '2015-03-18', 137, '1426666506'),
('::1', '2015-03-19', 143, '1426751746'),
('::1', '2015-03-21', 198, '1426912294'),
('::1', '2015-03-22', 554, '1427039069'),
('127.0.0.1', '2015-03-22', 1, '1427030317'),
('::1', '2015-03-23', 275, '1427093113'),
('::1', '2015-03-24', 42, '1427179474'),
('::1', '2015-03-25', 45, '1427251499'),
('39.225.164.2', '2015-05-14', 7, '1431584409'),
('119.110.72.130', '2015-05-14', 30, '1431595368'),
('89.145.95.2', '2015-05-14', 1, '1431582645'),
('66.220.158.118', '2015-05-14', 1, '1431582842'),
('66.220.158.115', '2015-05-14', 1, '1431582852'),
('66.220.158.112', '2015-05-14', 3, '1431595371'),
('66.220.158.119', '2015-05-14', 1, '1431582942'),
('114.125.43.185', '2015-05-14', 5, '1431602132'),
('119.110.72.130', '2015-05-15', 1, '1431673658'),
('114.125.45.206', '2015-05-16', 18, '1431741581'),
('66.220.158.116', '2015-05-16', 1, '1431741049'),
('66.220.158.118', '2015-05-16', 1, '1431741224'),
('66.220.158.114', '2015-05-16', 1, '1431741233'),
('39.229.6.148', '2015-05-16', 11, '1431791037'),
('39.225.236.155', '2015-05-17', 8, '1431862096'),
('119.110.72.130', '2015-05-19', 6, '1432006569'),
('89.145.95.42', '2015-05-19', 2, '1432006661'),
('114.121.133.117', '2015-05-19', 3, '1432046663'),
('124.195.114.65', '2015-05-28', 16, '1432832381'),
('66.220.158.119', '2015-05-28', 1, '1432831000'),
('66.220.158.115', '2015-05-28', 1, '1432831013'),
('66.220.158.116', '2015-05-28', 1, '1432832385'),
('124.195.114.65', '2015-05-29', 77, '1432836214'),
('66.220.158.113', '2015-05-29', 1, '1432835961'),
('66.249.84.178', '2015-05-29', 1, '1432836220'),
('103.246.200.14', '2015-05-29', 1, '1432851867'),
('103.246.200.59', '2015-05-29', 1, '1432851916'),
('114.124.5.250', '2015-05-29', 6, '1432852876'),
('173.252.105.114', '2015-05-29', 1, '1432852770'),
('120.180.175.150', '2015-05-29', 36, '1432864082'),
('103.246.200.50', '2015-05-29', 1, '1432863615'),
('103.246.200.1', '2015-05-29', 1, '1432863650'),
('103.246.200.33', '2015-05-29', 1, '1432863711'),
('103.246.200.44', '2015-05-29', 1, '1432863795'),
('120.174.144.115', '2015-05-29', 1, '1432908445'),
('119.110.72.130', '2015-05-29', 27, '1432912022'),
('173.252.90.117', '2015-05-29', 1, '1432910852'),
('173.252.90.116', '2015-05-29', 1, '1432910873'),
('173.252.90.118', '2015-05-29', 1, '1432911344'),
('173.252.90.122', '2015-05-29', 1, '1432911470'),
('66.249.84.190', '2015-05-30', 1, '1432945579'),
('39.254.117.222', '2015-05-30', 1, '1432991226'),
('66.249.84.178', '2015-05-31', 1, '1433037242'),
('120.176.92.190', '2015-06-01', 3, '1433128955'),
('66.102.6.210', '2015-06-01', 1, '1433134430'),
('120.164.44.28', '2015-06-01', 13, '1433149419'),
('124.195.118.227', '2015-06-01', 1, '1433170960'),
('120.177.28.244', '2015-06-02', 8, '1433220043'),
('66.249.84.190', '2015-06-02', 1, '1433247837'),
('120.190.75.179', '2015-06-03', 7, '1433302768'),
('119.110.72.130', '2015-06-03', 4, '1433302761'),
('89.145.95.2', '2015-06-03', 1, '1433302690'),
('66.249.71.147', '2015-06-07', 46, '1433696370'),
('66.249.71.130', '2015-06-07', 30, '1433696150'),
('66.249.71.164', '2015-06-07', 37, '1433696154'),
('173.252.74.113', '2015-06-07', 8, '1433694061'),
('173.252.74.117', '2015-06-07', 3, '1433676319'),
('66.249.64.57', '2015-06-07', 1, '1433674283'),
('173.252.88.89', '2015-06-07', 5, '1433677999'),
('173.252.88.86', '2015-06-07', 2, '1433677597'),
('173.252.74.119', '2015-06-07', 7, '1433694862'),
('66.249.79.117', '2015-06-07', 1, '1433674983'),
('173.252.88.84', '2015-06-07', 2, '1433676738'),
('173.252.74.115', '2015-06-07', 3, '1433676460'),
('173.252.74.114', '2015-06-07', 2, '1433694204'),
('173.252.74.118', '2015-06-07', 3, '1433676180'),
('173.252.74.112', '2015-06-07', 5, '1433695314'),
('173.252.88.85', '2015-06-07', 2, '1433677804'),
('173.252.88.90', '2015-06-07', 1, '1433676251'),
('173.252.74.116', '2015-06-07', 5, '1433695249'),
('173.252.88.87', '2015-06-07', 2, '1433677488'),
('173.252.88.88', '2015-06-07', 1, '1433677370'),
('66.249.79.130', '2015-06-07', 1, '1433694848'),
('66.220.156.116', '2015-06-07', 2, '1433696197'),
('66.249.67.104', '2015-06-07', 1, '1433696147'),
('66.220.156.112', '2015-06-07', 2, '1433696173'),
('66.220.146.22', '2015-06-07', 1, '1433696162'),
('66.249.67.117', '2015-06-07', 1, '1433696288'),
('66.220.156.114', '2015-06-07', 1, '1433696309'),
('66.220.156.117', '2015-06-08', 3, '1433711204'),
('66.249.71.164', '2015-06-08', 32, '1433779112'),
('66.220.146.25', '2015-06-08', 2, '1433736854'),
('66.220.156.116', '2015-06-08', 2, '1433709422'),
('66.249.71.147', '2015-06-08', 29, '1433748751'),
('66.220.156.112', '2015-06-08', 4, '1433715007'),
('66.220.146.20', '2015-06-08', 1, '1433696744'),
('66.249.71.130', '2015-06-08', 38, '1433777391'),
('66.220.156.118', '2015-06-08', 2, '1433712628'),
('66.220.146.27', '2015-06-08', 1, '1433712556'),
('66.220.146.26', '2015-06-08', 1, '1433712746'),
('66.249.67.104', '2015-06-08', 4, '1433746797'),
('66.220.146.22', '2015-06-08', 1, '1433714244'),
('66.220.156.115', '2015-06-08', 2, '1433714821'),
('66.249.67.117', '2015-06-08', 2, '1433780504'),
('120.176.251.49', '2015-06-08', 2, '1433737104'),
('66.220.156.119', '2015-06-08', 1, '1433737457'),
('66.249.71.147', '2015-06-09', 3, '1433836081'),
('66.249.71.130', '2015-06-09', 4, '1433835126'),
('66.249.67.104', '2015-06-09', 1, '1433788622'),
('66.249.71.164', '2015-06-09', 1, '1433823064'),
('66.249.71.130', '2015-06-10', 5, '1433953790'),
('66.249.67.117', '2015-06-10', 1, '1433911605'),
('66.249.71.164', '2015-06-10', 3, '1433954890'),
('66.249.71.147', '2015-06-10', 2, '1433953573'),
('66.249.71.147', '2015-06-11', 1, '1433957808'),
('66.249.71.164', '2015-06-11', 2, '1433990805'),
('68.180.228.104', '2015-06-11', 1, '1433975257'),
('66.249.71.130', '2015-06-11', 1, '1433991891'),
('36.68.28.19', '2015-06-14', 5, '1434224041'),
('120.164.46.127', '2015-06-14', 2, '1434239557'),
('66.249.67.248', '2015-06-15', 1, '1434362861'),
('104.193.10.50', '2015-06-15', 3, '1434372762'),
('104.193.10.50', '2015-06-16', 2, '1434454308'),
('36.80.234.114', '2015-06-16', 4, '1434443273'),
('173.252.74.115', '2015-06-16', 1, '1434443264'),
('173.252.74.114', '2015-06-16', 1, '1434443279'),
('119.110.72.130', '2015-06-16', 1, '1434467216'),
('124.195.116.71', '2015-06-17', 3, '1434551738'),
('120.184.130.21', '2015-06-27', 1, '1435386862'),
('66.249.84.246', '2015-06-27', 1, '1435387150'),
('120.176.176.106', '2015-06-28', 7, '1435461088'),
('66.220.158.114', '2015-06-28', 1, '1435461007'),
('66.249.84.129', '2015-06-28', 1, '1435466083'),
('66.249.84.246', '2015-06-29', 2, '1435563211'),
('66.249.84.252', '2015-06-29', 1, '1435563206'),
('66.249.84.246', '2015-06-30', 3, '1435677685'),
('66.249.84.252', '2015-06-30', 1, '1435645799'),
('66.249.84.252', '2015-07-01', 1, '1435710707'),
('66.249.84.129', '2015-07-01', 1, '1435711780'),
('120.177.18.200', '2015-07-02', 1, '1435824891'),
('::1', '2015-11-25', 15, '1448407930'),
('::1', '2015-12-01', 12, '1448944568'),
('::1', '2015-12-03', 9, '1449138520'),
('::1', '2015-12-05', 26, '1449279360'),
('::1', '2015-12-07', 4, '1449442678'),
('::1', '2015-12-08', 8, '1449532582'),
('::1', '2015-12-13', 31, '1449974628'),
('::1', '2015-12-18', 9, '1450418535'),
('::1', '2015-12-21', 10, '1450654644'),
('::1', '2015-12-24', 3, '1450917714'),
('::1', '2015-12-25', 4, '1451037761'),
('::1', '2015-12-26', 5, '1451086546'),
('::1', '2016-01-01', 1, '1451626224'),
('::1', '2016-01-12', 2, '1452564572'),
('::1', '2016-01-16', 7, '1452913899'),
('::1', '2016-01-17', 150, '1453036730'),
('::1', '2016-07-24', 24, '1469318037'),
('::1', '2016-07-29', 1, '1469767572'),
('::1', '2016-07-31', 1, '1469936872'),
('::1', '2016-08-01', 14, '1470019073'),
('::1', '2016-08-12', 4, '1470940786'),
('::1', '2016-08-14', 3, '1471191885'),
('::1', '2016-08-22', 5, '1471851644'),
('::1', '2016-08-26', 4, '1472207940'),
('::1', '2016-08-29', 9, '1472475500'),
('::1', '2016-08-30', 1, '1472531831'),
('::1', '2016-09-13', 4, '1473760584'),
('::1', '2016-09-16', 7, '1473998550'),
('::1', '2016-09-17', 3, '1474076080'),
('::1', '2016-09-20', 4, '1474335445'),
('::1', '2016-09-21', 5, '1474470987'),
('::1', '2016-09-26', 8, '1474866854'),
('::1', '2016-11-21', 20, '1479719811'),
('::1', '2016-11-22', 26, '1479795839'),
('::1', '2016-12-24', 1, '1482592503'),
('::1', '2016-12-23', 2, '1482451494'),
('::1', '2016-12-20', 7, '1482205377'),
('::1', '2016-12-14', 4, '1481717872'),
('::1', '2016-12-13', 24, '1481593512'),
('::1', '2016-12-09', 1, '1481243159'),
('::1', '2016-12-03', 3, '1480741491'),
('::1', '2016-11-28', 32, '1480303392'),
('::1', '2016-11-27', 2, '1480224412'),
('::1', '2016-11-24', 403, '1479984680'),
('::1', '2016-11-23', 2, '1479913316'),
('::1', '2017-01-03', 9, '1483421812'),
('::1', '2017-01-04', 2, '1483534977'),
('::1', '2017-01-05', 3, '1483627230'),
('::1', '2017-01-14', 1, '1484352852'),
('::1', '2017-01-17', 3, '1484663823'),
('::1', '2017-01-25', 12, '1485359750'),
('::1', '2017-01-26', 37, '1485414680'),
('::1', '2017-01-27', 70, '1485508785'),
('::1', '2017-01-28', 1, '1485567010'),
('::1', '2017-02-04', 1, '1486213804'),
('::1', '2017-02-09', 14, '1486659480'),
('::1', '2017-02-10', 3, '1486684650'),
('::1', '2017-02-11', 11, '1486773431'),
('::1', '2017-02-12', 6, '1486869838'),
('::1', '2017-02-13', 5, '1486995163'),
('::1', '2017-02-15', 3, '1487123924'),
('::1', '2017-02-21', 1, '1487659967'),
('::1', '2017-02-23', 7, '1487832476'),
('::1', '2017-02-26', 4, '1488064851'),
('::1', '2017-03-13', 44, '1489366890'),
('::1', '2017-03-17', 24, '1489744337'),
('::1', '2017-03-20', 1, '1489988038'),
('::1', '2017-03-25', 1, '1490413626'),
('::1', '2017-03-29', 7, '1490744633'),
('::1', '2017-04-02', 1, '1491122695'),
('::1', '2017-04-06', 56, '1491462329'),
('::1', '2017-04-07', 59, '1491524075'),
('::1', '2017-04-09', 20, '1491711058'),
('::1', '2017-04-11', 9, '1491877995'),
('::1', '2017-04-12', 124, '1492006218'),
('::1', '2017-04-13', 53, '1492088580'),
('::1', '2017-05-14', 133, '1494767093'),
('::1', '2017-05-20', 167, '1495299592'),
('::1', '2017-05-21', 234, '1495359950'),
('::1', '2018-04-19', 1, '1524111568'),
('::1', '2018-04-21', 1, '1524249582'),
('::1', '2018-04-24', 19, '1524509093'),
('::1', '2018-05-04', 13, '1525441129'),
('::1', '2018-05-05', 36, '1525494921'),
('::1', '2018-05-06', 5, '1525614861'),
('::1', '2018-05-11', 15, '1525998298'),
('::1', '2018-05-18', 4, '1526611139'),
('::1', '2018-05-19', 6, '1526701697'),
('::1', '2018-05-20', 13, '1526833607'),
('::1', '2018-05-22', 13, '1526947912'),
('::1', '2018-05-23', 16, '1527056425'),
('::1', '2018-05-31', 1, '1527743948'),
('::1', '2018-06-01', 2, '1527815549'),
('::1', '2018-06-03', 191, '1528045141'),
('::1', '2018-06-04', 100, '1528127678'),
('::1', '2018-12-11', 315, '1544522200'),
('::1', '2018-12-21', 68, '1545398144'),
('::1', '2018-12-22', 81, '1545450822'),
('::1', '2018-12-23', 310, '1545529051'),
('::1', '2018-12-26', 70, '1545792411'),
('::1', '2018-12-28', 21, '1545959894'),
('::1', '2019-01-01', 40, '1546327662'),
('::1', '2019-01-11', 1, '1547192056'),
('::1', '2019-01-15', 1, '1547535461'),
('::1', '2019-02-03', 21, '1549151755'),
('::1', '2019-02-08', 2, '1549583794'),
('::1', '2019-02-14', 5, '1550143909'),
('::1', '2019-02-16', 139, '1550293098'),
('::1', '2019-02-17', 12, '1550360900'),
('::1', '2019-02-18', 9, '1550451537'),
('::1', '2019-02-19', 11, '1550552634'),
('::1', '2019-02-20', 115, '1550632680'),
('::1', '2019-02-20', 115, '1550632680'),
('::1', '2019-02-22', 83, '1550824388'),
('::1', '2019-02-23', 143, '1550910213'),
('::1', '2019-03-03', 2, '1551627040'),
('::1', '2019-03-05', 1, '1551794436'),
('::1', '2019-03-21', 127, '1553174723'),
('::1', '2019-03-22', 25, '1553221802'),
('::1', '2019-03-23', 255, '1553343322'),
('::1', '2019-03-24', 151, '1553429554'),
('::1', '2019-03-25', 292, '1553521395'),
('::1', '2019-03-26', 236, '1553603754'),
('::1', '2019-03-27', 135, '1553688661'),
('::1', '2019-07-03', 36, '1562116358'),
('::1', '2019-07-05', 1, '1562284598'),
('::1', '2019-07-14', 2, '1563088030'),
('::1', '2019-08-03', 2, '1564790513'),
('::1', '2019-08-10', 1, '1565406009'),
('::1', '2019-08-17', 20, '1566001489'),
('::1', '2019-08-31', 58, '1567260005'),
('::1', '2019-09-01', 181, '1567296028'),
('::1', '2019-09-05', 15, '1567643036'),
('::1', '2019-09-07', 34, '1567844461'),
('::1', '2019-09-08', 51, '1567913869'),
('::1', '2019-09-11', 24, '1568161499'),
('::1', '2019-12-03', 35, '1575348564'),
('::1', '2019-12-21', 4, '1576910575'),
('::1', '2019-12-27', 1, '1577405560'),
('::1', '2020-01-03', 1, '1578006463'),
('::1', '2020-04-20', 3, '1587375762'),
('::1', '2020-04-29', 4, '1588153099'),
('::1', '2020-04-30', 2, '1588209547'),
('::1', '2020-05-04', 9, '1588562635'),
('::1', '2020-05-06', 1, '1588725736'),
('::1', '2020-05-07', 16, '1588815744'),
('::1', '2020-05-17', 3, '1589685726'),
('::1', '2020-05-29', 1, '1590712474'),
('::1', '2020-06-05', 26, '1591354064'),
('::1', '2020-06-06', 1, '1591413973'),
('::1', '2020-06-09', 31, '1591668223'),
('::1', '2020-06-11', 3, '1591874593'),
('::1', '2020-06-12', 35, '1591933443'),
('::1', '2020-06-13', 5, '1592023726'),
('::1', '2020-06-14', 26, '1592111538'),
('::1', '2020-06-17', 7, '1592374115'),
('::1', '2020-06-18', 2, '1592450929'),
('::1', '2020-06-19', 63, '1592552859'),
('::1', '2020-06-20', 16, '1592630337'),
('::1', '2020-06-23', 9, '1592884753'),
('::1', '2020-06-25', 16, '1593079452'),
('::1', '2020-06-28', 45, '1593315597'),
('::1', '2020-07-02', 33, '1593674922'),
('::1', '2020-07-03', 18, '1593782119'),
('::1', '2020-07-04', 6, '1593848928'),
('::1', '2020-07-05', 93, '1593932590'),
('::1', '2020-07-07', 84, '1594107465'),
('::1', '2020-10-10', 115, '1602349184'),
('::1', '2020-10-11', 649, '1602435598'),
('::1', '2020-10-12', 334, '1602511525'),
('::1', '2020-10-13', 17, '1602608399'),
('::1', '2020-10-14', 49, '1602611587'),
('::1', '2020-10-15', 59, '1602774201'),
('::1', '2021-07-02', 22, '1625236014'),
('::1', '2021-07-03', 227, '1625320703'),
('::1', '2021-07-04', 253, '1625404745'),
('127.0.0.1', '2021-07-04', 5, '1625403575'),
('::1', '2021-07-07', 3, '1625642303'),
('::1', '2021-07-10', 19, '1625924516'),
('::1', '2021-07-10', 19, '1625924516'),
('::1', '2021-07-11', 24, '1626008035'),
('::1', '2021-07-12', 8, '1626082815'),
('::1', '2021-07-13', 1, '1626168485'),
('192.168.20.107', '2021-07-16', 5, '1626396884'),
('::1', '2021-07-16', 6, '1626398404'),
('192.168.20.107', '2021-07-17', 2, '1626493192'),
('::1', '2021-07-17', 2, '1626494799'),
('192.168.20.102', '2021-07-17', 1, '1626493437'),
('192.168.20.102', '2021-07-18', 1, '1626584421'),
('::1', '2021-07-19', 226, '1626685746'),
('::1', '2021-07-20', 215, '1626788408'),
('127.0.0.1', '2021-07-20', 1, '1626783269');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tag`
--

CREATE TABLE `tag` (
  `id_tag` int(5) NOT NULL,
  `nama_tag` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `tag_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `count` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tag`
--

INSERT INTO `tag` (`id_tag`, `nama_tag`, `username`, `tag_seo`, `count`) VALUES
(55, 'Harga Tebu', 'AdminKemanisan', 'harga-tebu', 0),
(56, 'Cerita Bisnis', 'AdminKemanisan', 'cerita-bisnis', 0),
(57, 'Kreasi Gula', 'AdminKemanisan', 'kreasi-gula', 0),
(58, 'Khasiat Gula Merah', 'AdminKemanisan', 'khasiat-gula-merah', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagvid`
--

CREATE TABLE `tagvid` (
  `id_tag` int(5) NOT NULL,
  `nama_tag` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `tag_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `count` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tagvid`
--

INSERT INTO `tagvid` (`id_tag`, `nama_tag`, `username`, `tag_seo`, `count`) VALUES
(39, 'Edukasi', 'AdminKemanisan', 'edukasi', 0),
(40, 'Tutorial', 'AdminKemanisan', 'tutorial', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id_komentar` int(5) NOT NULL,
  `reply` int(5) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `alamat_email` varchar(150) NOT NULL,
  `isi_pesan` text NOT NULL,
  `tanggal_komentar` date NOT NULL,
  `jam_komentar` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_comment`
--

INSERT INTO `tbl_comment` (`id_komentar`, `reply`, `nama_lengkap`, `alamat_email`, `isi_pesan`, `tanggal_komentar`, `jam_komentar`) VALUES
(2, 1, 'si anu', 'anu@gmail.com', 'Video bocah melakukan hubungan intim layaknya suami istri membuat geger. Guna mencegah hal-hal yang tidak diinginkan, polisi pun sudah melakukan penelusuran siapa orang di balik pembuatan video cabul tersebut.', '2014-11-19', '00:00:00'),
(4, 1, 'Anggun Pratiwi', 'angun@gmail.com', 'itu benar bro, kalau ndak pacayo tanyo lah ka baruak.Video bocah melakukan hubungan intim layaknya suami istri membuat geger. Guna mencegah hal-hal yang tidak diinginkan, polisi pun sudah melakukan penelusuran siapa orang di balik pembuatan video cabul tersebut.', '2014-11-21', '00:00:00'),
(5, 3, 'Dewi Safitri', 'dewi.safitri@gmail.com', 'Oii, ang kareh bana mah, den ambuang ang ka lauik beko,.. Video bocah melakukan hubungan intim layaknya suami istri membuat geger. Guna mencegah hal-hal yang tidak diinginkan, polisi pun sudah melakukan penelusuran siapa orang di balik pembuatan video cabul tersebut.', '2014-11-21', '00:00:00'),
(7, 6, 'Prasmana Enru', 'prasmana@gmail.com', 'Undang-Undang Ketentuan-ketentuan Pokok Kekuasaan	Video bocah melakukan hubungan intim layaknya suami istri membuat geger. Guna mencegah hal-hal yang tidak diinginkan, polisi pun sudah melakukan penelusuran siapa orang di balik pembuatan video cabul tersebut.', '2014-11-21', '00:00:00'),
(9, 3, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', 'Untuk itulah penulis memberikan solusi menggunakan program Dreamweaver,.. Video bocah melakukan hubungan intim layaknya suami istri membuat geger. Guna mencegah hal-hal yang tidak diinginkan, polisi pun sudah melakukan penelusuran siapa orang di balik pembuatan video cabul tersebut.', '2015-01-22', '00:00:00'),
(15, 6, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', 'Perlahan tapi pasti, sosok TM yang merupakan artis dan berprofesi sebagai Pekerja Seks Komersial (PSK) akhirnya mulai terungkap Video bocah melakukan hubungan intim layaknya suami istri membuat geger. Guna mencegah hal-hal yang tidak diinginkan, polisi pun sudah melakukan penelusuran siapa orang di balik pembuatan video cabul tersebut.', '2015-05-29', '00:59:50'),
(23, 20, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', 'I spent almost a day searching for this. And found &#039;CSS3 Thumbnail Slider&#039; on this site. Thanks a lot. If the slideIndex is higher than the number of elements (x.length), the slideIndex is set to zero.', '2017-01-24', '16:31:47'),
(24, 14, 'Robby Prihandaya', 'robby.prihandaya@gmail.com', 'Guna mencegah hal-hal yang tidak diinginkan, polisi pun sudah melakukan penelusuran siapa orang di balik pembuatan video cabul tersebut', '2017-04-09', '11:07:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `templates`
--

CREATE TABLE `templates` (
  `id_templates` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `pembuat` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `folder` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `templates`
--

INSERT INTO `templates` (`id_templates`, `judul`, `username`, `pembuat`, `folder`, `aktif`) VALUES
(22, 'Kemanisan_Website\r\n', 'admin', 'Kelompok 6 MIF-A Polije', 'phpmu-tigo', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimoni`
--

CREATE TABLE `testimoni` (
  `id_testimoni` int(11) NOT NULL,
  `id_konsumen` int(11) NOT NULL,
  `isi_testimoni` text NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `waktu_testimoni` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `testimoni`
--

INSERT INTO `testimoni` (`id_testimoni`, `id_konsumen`, `isi_testimoni`, `aktif`, `waktu_testimoni`) VALUES
(1, 1, 'Saya berusaha mencoba memaklumi mereka tentang kesan menjadi entrepreneur instan ini dengan menjadi seorang MLM-ers, dengan menanyakan penyebab bisa memunculkan kesan instan tersebut. Mereka memberikan jawaban beragam berkaitan dengan proses instan seorang entrepreneur ini. ', 'Y', '2016-09-11 03:25:21'),
(2, 3, '<p>Menjadi seorang sukses dengan cara instan memang impian banyak orang dan saya yakin anda pun akan menyetujuinya. Namun, kembali lagi kepada diri anda sendiri apakah anda benar-benar memahami makna menjadi seorang entrepreneur sesungguhnya atau hanya memaknai seperti halnya membuat mie instan.</p>\n', 'Y', '2016-09-12 07:09:16'),
(5, 6, '<p>Saya berusaha mencoba memaklumi mereka tentang kesan menjadi entrepreneur instan ini dengan menjadi seorang MLM-ers, dengan menanyakan penyebab bisa memunculkan kesan instan tersebut. Mereka memberikan jawaban beragam berkaitan dengan proses instan seorang entrepreneur inii.</p>\r\n', 'Y', '2016-09-14 14:11:36'),
(9, 1, 'asdasdasd', 'N', '2020-06-23 10:18:03'),
(10, 27, 'mantapp.. pesanan sampai dgn cepat', 'N', '2020-10-12 00:20:09'),
(11, 28, 'Wah Webnya Menarik', 'N', '2021-07-20 16:42:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `foto` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `id_session` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `foto`, `level`, `blokir`, `id_session`) VALUES
('admin', 'faf9515530e13bc3762b9b3b17487b38a5cbb49cbead9ddbffa78efc6e5e8edcdb86a6b1de45f07aaa78b34fbc5ca7792f8feb1463de81f7258f8adc4322ad88', 'Kemanisan', 'faizmuazzam.fm7@gmail.com', '81912940523', 'logo_kemanisan_resmi.png', 'admin', 'N', 'q173s8hs1jl04st35169ccl8o7'),
('kontributor', '8275b32f5a1f93bc050d6c6df188697b0d066a1b9153ab8d0af733cc653efcf4ae75b5355e48ab0319da3ae5ab5850d705b1b90c6c49ca7d9f82e9bc76f00f92', 'My Coding', 'mycoding@401xd.com', '082377823390', 'favicon2.png', 'kontributor', 'N', '67cfd69a4e5fb27fc4aeb0fa8383161e-20201010235217'),
('AdminKemanisan', 'faf9515530e13bc3762b9b3b17487b38a5cbb49cbead9ddbffa78efc6e5e8edcdb86a6b1de45f07aaa78b34fbc5ca7792f8feb1463de81f7258f8adc4322ad88', 'AdminKemanisan', 'Faizmuazzam.fm7@gmail.com', '081912940523', 'logo_kemanisan_resmi1.png', 'admin', 'N', '543fd38fb20b04e0f7e0f840dc713f07-20210704153600');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_modul`
--

CREATE TABLE `users_modul` (
  `id_umod` int(11) NOT NULL,
  `id_session` varchar(255) NOT NULL,
  `id_modul` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users_modul`
--

INSERT INTO `users_modul` (`id_umod`, `id_session`, `id_modul`) VALUES
(1, 'ed1d859c50262701d92e5cbf39652792-20170120090507', 70),
(2, 'ed1d859c50262701d92e5cbf39652792-20170120090507', 65),
(3, 'ed1d859c50262701d92e5cbf39652792-20170120090507', 63),
(4, 'f76ad5ee772ac196cbc09824e24859ee', 70),
(5, 'f76ad5ee772ac196cbc09824e24859ee', 65),
(6, 'f76ad5ee772ac196cbc09824e24859ee', 63),
(7, 'ed1d859c50262701d92e5cbf39652792-20170120090507', 18),
(8, 'ed1d859c50262701d92e5cbf39652792-20170120090507', 66),
(9, 'ed1d859c50262701d92e5cbf39652792-20170120090507', 33),
(10, '3460d81e02faa3559f9e02c9a766fcbd-20170124215625', 18),
(11, 'ed1d859c50262701d92e5cbf39652792-20170120090507', 41),
(12, '6bec9c852847242e384a4d5ac0962ba0-20170406140423', 18),
(13, 'fa7688658d8b38aae731826ea1daebb5-20170521103501', 18),
(14, 'cfcd208495d565ef66e7dff9f98764da-20180421112213', 18),
(15, '8462a1a67fbed2bef22d490d88e35944-20200619140142', 18),
(16, '67cfd69a4e5fb27fc4aeb0fa8383161e-20201010235217', 44),
(22, '67cfd69a4e5fb27fc4aeb0fa8383161e-20201010235217', 62),
(18, '67cfd69a4e5fb27fc4aeb0fa8383161e-20201010235217', 18),
(19, '67cfd69a4e5fb27fc4aeb0fa8383161e-20201010235217', 43),
(23, 'q173s8hs1jl04st35169ccl8o7', 45),
(24, 'q173s8hs1jl04st35169ccl8o7', 66),
(25, 'q173s8hs1jl04st35169ccl8o7', 61),
(26, 'q173s8hs1jl04st35169ccl8o7', 34),
(27, 'q173s8hs1jl04st35169ccl8o7', 61),
(28, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 70),
(29, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 66),
(30, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 65),
(31, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 64),
(32, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 63),
(33, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 62),
(34, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 61),
(35, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 59),
(36, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 57),
(37, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 46),
(38, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 45),
(39, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 44),
(40, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 43),
(41, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 41),
(42, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 35),
(43, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 34),
(44, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 33),
(45, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 31),
(46, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 18),
(47, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 10),
(48, '543fd38fb20b04e0f7e0f840dc713f07-20210704153600', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `video`
--

CREATE TABLE `video` (
  `id_video` int(5) NOT NULL,
  `id_playlist` int(5) NOT NULL,
  `username` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `jdl_video` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `video_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `keterangan` text COLLATE latin1_general_ci NOT NULL,
  `gbr_video` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `video` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `youtube` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dilihat` int(7) NOT NULL DEFAULT 1,
  `hari` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `tagvid` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `video`
--

INSERT INTO `video` (`id_video`, `id_playlist`, `username`, `jdl_video`, `video_seo`, `keterangan`, `gbr_video`, `video`, `youtube`, `dilihat`, `hari`, `tanggal`, `jam`, `tagvid`) VALUES
(175, 56, 'AdminKemanisan', '5 Manfaat Gula Merah Bagi Stamina Tubuh', '5-manfaat-gula-merah-bagi-stamina-tubuh', '<p>Gula merah dipercaya lebih memiliki banyak manfaat dibandingkan dengan gula putih, salah satu manfaat dari gula merah adalah digunakan untuk stamina. Gula merah memiliki manfaat untuk stamina karena di dalam gula merah terdapat berbagai macam kandungan yang bermanfaat untuk meningkatkan stamina anda. Adapun manfaat gula merah untuk stamina adalah sebagai berikut.</p>\r\n', '027467600_1486368608-Gula3.jpg', '', 'https://youtu.be/VpflGj9V-sM', 0, 'Selasa', '2021-07-20', '20:18:16', 'edukasi'),
(176, 56, 'AdminKemanisan', 'Cara membedakan gula merah asli dan campuran', 'cara-membedakan-gula-merah-asli-dan-campuran', '<p>cara membedakan gula asli dan gula merah campuran, gula merah, harga gula merah, gula aren, harga gula aren, gula kaung, harga gula kaung</p>\r\n', '', '', 'https://youtu.be/L0bFbmEP1Vc', 0, 'Selasa', '2021-07-20', '20:21:01', 'edukasi'),
(177, 56, 'AdminKemanisan', 'PROSES PEMBUATAN GULA MERAH DARI TEBU', 'proses-pembuatan-gula-merah-dari-tebu', '<p>proses pembuatan gula merah di kecamatan sambeng. bahan dasarnnya dari tebu. biasanya untuk bahan kecap</p>\r\n', 'ilustrasi-gula-jawa-2_169.jpeg', '', 'https://youtu.be/xPYzXOf9mdI', 0, 'Selasa', '2021-07-20', '20:23:16', 'edukasi');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`);

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indeks untuk tabel `background`
--
ALTER TABLE `background`
  ADD PRIMARY KEY (`id_background`);

--
-- Indeks untuk tabel `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id_banner`);

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indeks untuk tabel `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`id_download`);

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indeks untuk tabel `halamanstatis`
--
ALTER TABLE `halamanstatis`
  ADD PRIMARY KEY (`id_halaman`);

--
-- Indeks untuk tabel `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id_header`);

--
-- Indeks untuk tabel `hubungi`
--
ALTER TABLE `hubungi`
  ADD PRIMARY KEY (`id_hubungi`);

--
-- Indeks untuk tabel `identitas`
--
ALTER TABLE `identitas`
  ADD PRIMARY KEY (`id_identitas`);

--
-- Indeks untuk tabel `iklanatas`
--
ALTER TABLE `iklanatas`
  ADD PRIMARY KEY (`id_iklanatas`);

--
-- Indeks untuk tabel `iklantengah`
--
ALTER TABLE `iklantengah`
  ADD PRIMARY KEY (`id_iklantengah`);

--
-- Indeks untuk tabel `katajelek`
--
ALTER TABLE `katajelek`
  ADD PRIMARY KEY (`id_jelek`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indeks untuk tabel `komentarvid`
--
ALTER TABLE `komentarvid`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indeks untuk tabel `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`id_logo`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indeks untuk tabel `mod_alamat`
--
ALTER TABLE `mod_alamat`
  ADD PRIMARY KEY (`id_alamat`);

--
-- Indeks untuk tabel `mod_ym`
--
ALTER TABLE `mod_ym`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasangiklan`
--
ALTER TABLE `pasangiklan`
  ADD PRIMARY KEY (`id_pasangiklan`);

--
-- Indeks untuk tabel `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id_playlist`);

--
-- Indeks untuk tabel `poling`
--
ALTER TABLE `poling`
  ADD PRIMARY KEY (`id_poling`);

--
-- Indeks untuk tabel `rb_bonus`
--
ALTER TABLE `rb_bonus`
  ADD PRIMARY KEY (`id_bonus`);

--
-- Indeks untuk tabel `rb_kategori_produk`
--
ALTER TABLE `rb_kategori_produk`
  ADD PRIMARY KEY (`id_kategori_produk`);

--
-- Indeks untuk tabel `rb_kategori_produk_sub`
--
ALTER TABLE `rb_kategori_produk_sub`
  ADD PRIMARY KEY (`id_kategori_produk_sub`);

--
-- Indeks untuk tabel `rb_keterangan`
--
ALTER TABLE `rb_keterangan`
  ADD PRIMARY KEY (`id_keterangan`);

--
-- Indeks untuk tabel `rb_konfirmasi_pembayaran`
--
ALTER TABLE `rb_konfirmasi_pembayaran`
  ADD PRIMARY KEY (`id_konfirmasi_pembayaran`);

--
-- Indeks untuk tabel `rb_konfirmasi_pembayaran_konsumen`
--
ALTER TABLE `rb_konfirmasi_pembayaran_konsumen`
  ADD PRIMARY KEY (`id_konfirmasi_pembayaran`);

--
-- Indeks untuk tabel `rb_konsumen`
--
ALTER TABLE `rb_konsumen`
  ADD PRIMARY KEY (`id_konsumen`);

--
-- Indeks untuk tabel `rb_kota`
--
ALTER TABLE `rb_kota`
  ADD PRIMARY KEY (`kota_id`);

--
-- Indeks untuk tabel `rb_pembayaran_bonus`
--
ALTER TABLE `rb_pembayaran_bonus`
  ADD PRIMARY KEY (`id_pembayaran_bonus`);

--
-- Indeks untuk tabel `rb_pembelian`
--
ALTER TABLE `rb_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `rb_pembelian_detail`
--
ALTER TABLE `rb_pembelian_detail`
  ADD PRIMARY KEY (`id_pembelian_detail`);

--
-- Indeks untuk tabel `rb_pencairan_bonus`
--
ALTER TABLE `rb_pencairan_bonus`
  ADD PRIMARY KEY (`id_pencairan_bonus`);

--
-- Indeks untuk tabel `rb_pencairan_reward`
--
ALTER TABLE `rb_pencairan_reward`
  ADD PRIMARY KEY (`id_pencairan_reward`);

--
-- Indeks untuk tabel `rb_penjualan`
--
ALTER TABLE `rb_penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `rb_penjualan_detail`
--
ALTER TABLE `rb_penjualan_detail`
  ADD PRIMARY KEY (`id_penjualan_detail`);

--
-- Indeks untuk tabel `rb_penjualan_temp`
--
ALTER TABLE `rb_penjualan_temp`
  ADD PRIMARY KEY (`id_penjualan_detail`);

--
-- Indeks untuk tabel `rb_produk`
--
ALTER TABLE `rb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `rb_produk_diskon`
--
ALTER TABLE `rb_produk_diskon`
  ADD PRIMARY KEY (`id_produk_diskon`);

--
-- Indeks untuk tabel `rb_provinsi`
--
ALTER TABLE `rb_provinsi`
  ADD PRIMARY KEY (`provinsi_id`);

--
-- Indeks untuk tabel `rb_rekening`
--
ALTER TABLE `rb_rekening`
  ADD PRIMARY KEY (`id_rekening`);

--
-- Indeks untuk tabel `rb_rekening_reseller`
--
ALTER TABLE `rb_rekening_reseller`
  ADD PRIMARY KEY (`id_rekening_reseller`);

--
-- Indeks untuk tabel `rb_reseller`
--
ALTER TABLE `rb_reseller`
  ADD PRIMARY KEY (`id_reseller`);

--
-- Indeks untuk tabel `rb_reseller_cod`
--
ALTER TABLE `rb_reseller_cod`
  ADD PRIMARY KEY (`id_cod`);

--
-- Indeks untuk tabel `rb_reward`
--
ALTER TABLE `rb_reward`
  ADD PRIMARY KEY (`id_reward`);

--
-- Indeks untuk tabel `rb_setting`
--
ALTER TABLE `rb_setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `rb_supplier`
--
ALTER TABLE `rb_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `sekilasinfo`
--
ALTER TABLE `sekilasinfo`
  ADD PRIMARY KEY (`id_sekilas`);

--
-- Indeks untuk tabel `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indeks untuk tabel `tagvid`
--
ALTER TABLE `tagvid`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indeks untuk tabel `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indeks untuk tabel `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id_templates`);

--
-- Indeks untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`id_testimoni`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `users_modul`
--
ALTER TABLE `users_modul`
  ADD PRIMARY KEY (`id_umod`);

--
-- Indeks untuk tabel `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `background`
--
ALTER TABLE `background`
  MODIFY `id_background` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `banner`
--
ALTER TABLE `banner`
  MODIFY `id_banner` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=693;

--
-- AUTO_INCREMENT untuk tabel `download`
--
ALTER TABLE `download`
  MODIFY `id_download` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id_gallery` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT untuk tabel `halamanstatis`
--
ALTER TABLE `halamanstatis`
  MODIFY `id_halaman` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `header`
--
ALTER TABLE `header`
  MODIFY `id_header` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `hubungi`
--
ALTER TABLE `hubungi`
  MODIFY `id_hubungi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `identitas`
--
ALTER TABLE `identitas`
  MODIFY `id_identitas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `iklanatas`
--
ALTER TABLE `iklanatas`
  MODIFY `id_iklanatas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `iklantengah`
--
ALTER TABLE `iklantengah`
  MODIFY `id_iklantengah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `katajelek`
--
ALTER TABLE `katajelek`
  MODIFY `id_jelek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT untuk tabel `komentarvid`
--
ALTER TABLE `komentarvid`
  MODIFY `id_komentar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT untuk tabel `logo`
--
ALTER TABLE `logo`
  MODIFY `id_logo` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT untuk tabel `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `mod_alamat`
--
ALTER TABLE `mod_alamat`
  MODIFY `id_alamat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `mod_ym`
--
ALTER TABLE `mod_ym`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pasangiklan`
--
ALTER TABLE `pasangiklan`
  MODIFY `id_pasangiklan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id_playlist` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT untuk tabel `poling`
--
ALTER TABLE `poling`
  MODIFY `id_poling` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `rb_bonus`
--
ALTER TABLE `rb_bonus`
  MODIFY `id_bonus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `rb_kategori_produk`
--
ALTER TABLE `rb_kategori_produk`
  MODIFY `id_kategori_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `rb_kategori_produk_sub`
--
ALTER TABLE `rb_kategori_produk_sub`
  MODIFY `id_kategori_produk_sub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `rb_keterangan`
--
ALTER TABLE `rb_keterangan`
  MODIFY `id_keterangan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `rb_konfirmasi_pembayaran`
--
ALTER TABLE `rb_konfirmasi_pembayaran`
  MODIFY `id_konfirmasi_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rb_konfirmasi_pembayaran_konsumen`
--
ALTER TABLE `rb_konfirmasi_pembayaran_konsumen`
  MODIFY `id_konfirmasi_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `rb_konsumen`
--
ALTER TABLE `rb_konsumen`
  MODIFY `id_konsumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `rb_kota`
--
ALTER TABLE `rb_kota`
  MODIFY `kota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;

--
-- AUTO_INCREMENT untuk tabel `rb_pembayaran_bonus`
--
ALTER TABLE `rb_pembayaran_bonus`
  MODIFY `id_pembayaran_bonus` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rb_pembelian`
--
ALTER TABLE `rb_pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `rb_pembelian_detail`
--
ALTER TABLE `rb_pembelian_detail`
  MODIFY `id_pembelian_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `rb_pencairan_bonus`
--
ALTER TABLE `rb_pencairan_bonus`
  MODIFY `id_pencairan_bonus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `rb_pencairan_reward`
--
ALTER TABLE `rb_pencairan_reward`
  MODIFY `id_pencairan_reward` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rb_penjualan`
--
ALTER TABLE `rb_penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT untuk tabel `rb_penjualan_detail`
--
ALTER TABLE `rb_penjualan_detail`
  MODIFY `id_penjualan_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT untuk tabel `rb_penjualan_temp`
--
ALTER TABLE `rb_penjualan_temp`
  MODIFY `id_penjualan_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `rb_produk`
--
ALTER TABLE `rb_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `rb_produk_diskon`
--
ALTER TABLE `rb_produk_diskon`
  MODIFY `id_produk_diskon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `rb_provinsi`
--
ALTER TABLE `rb_provinsi`
  MODIFY `provinsi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `rb_rekening`
--
ALTER TABLE `rb_rekening`
  MODIFY `id_rekening` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rb_rekening_reseller`
--
ALTER TABLE `rb_rekening_reseller`
  MODIFY `id_rekening_reseller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `rb_reseller`
--
ALTER TABLE `rb_reseller`
  MODIFY `id_reseller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `rb_reseller_cod`
--
ALTER TABLE `rb_reseller_cod`
  MODIFY `id_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `rb_reward`
--
ALTER TABLE `rb_reward`
  MODIFY `id_reward` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `rb_setting`
--
ALTER TABLE `rb_setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rb_supplier`
--
ALTER TABLE `rb_supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sekilasinfo`
--
ALTER TABLE `sekilasinfo`
  MODIFY `id_sekilas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tag`
--
ALTER TABLE `tag`
  MODIFY `id_tag` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `tagvid`
--
ALTER TABLE `tagvid`
  MODIFY `id_tag` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id_komentar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `templates`
--
ALTER TABLE `templates`
  MODIFY `id_templates` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id_testimoni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `users_modul`
--
ALTER TABLE `users_modul`
  MODIFY `id_umod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
