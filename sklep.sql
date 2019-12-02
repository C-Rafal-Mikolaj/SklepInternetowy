-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2019 at 10:23 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sklep`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `username` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `username`, `item`, `quantity`, `status`) VALUES
(1, 'XD', 1, 1, 'oczekujące'),
(2, 'XD', 3, 2, 'oczekujące');

-- --------------------------------------------------------

--
-- Table structure for table `produkty`
--

CREATE TABLE `produkty` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL,
  `price` double NOT NULL,
  `color` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `image` text COLLATE utf8_polish_ci NOT NULL,
  `category` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`ID`, `name`, `description`, `price`, `color`, `image`, `category`) VALUES
(1, 'Sweter', 'Swetr szary pulover z kolekcji jesień/zima 2019', 49.99, 'Szary', 'https://static5.ebutik.pl/pol_pl_Szary-sweter-meski-Mosaic-318847_1.jpg', 'ubranie'),
(2, 'Xiaomi Mi9', 'Najnowszy model ze stajni Xiaomi, Mi 9 64GB to przełomowy flagowiec z potrójnym aparatem AI. Mi 9 posiada najnowszy ośmiordzeniowy procesor Snapdragon 855, który ma nietypowe ułożenie rdzeni: 1 wydajny rdzeń Kryo Gold o taktowaniu do 2,8 GHz, 3 wydajne rdzenie Kryo Gold o taktowaniu do 2,4 GHz oraz 4 energooszczędne rdzenie Kryo o taktowaniu do 1,8 GHz. Wyświetlacz AMOLED 6.39\'\' o proporcjach 19.5:9 FHD+. Telefon posiada 6GB/64GB pamięci', 1849, 'Czarny', 'https://img1.mi-home.pl/3853-large_default/mi-9-6gb-128gb-piano-black.jpg', 'elektronika'),
(3, 'Plecak Fjallraven Re-Kanken', 'Specjalna wersja plecaka Kånken wykonana w całości z poliestru z recyklingu jedenastu plastikowych butelek. Barwiony w technologii SpinDye, która znacznie ogranicza ilość zużywanej wody, energii i substancji chemicznych. Codzienny towarzysz o identycznym kroju jak oryginał, ale teraz opracowany na nowo z myślą o recyklingu i oszczędzaniu zasobów naturalnych. Gotowy do noszenia, podróży i przygód, a w dalekiej przyszłości również do ponownego recyklingu. Główna komora ma duży otwór zapinany na zamek błyskawiczny, pozwalający na łatwe zapakowanie i rozpakowanie plecaka. Plecak jest wyposażony w podkładkę do siedzenia schowaną w tylnej kieszeni. Podkładka zabezpiecza również plecy przed zawartością plecaka. Jest zawsze pod ręką podczas przerw. Dwie płaskie kieszenie boczne i zapinana na zamek błyskawiczny kieszeń z przodu, doskonała na wszystkie drobiazgi, które chcesz mieć pod ręką. System nośny jest prosty, ale praktyczny. Składa się z uchwytu u góry i wąskich, regulowanych pasków na ramię. Haftowane logo. Etykieta na adres w głównej komorze.', 389, 'Szary', 'https://kanken.pl/userdata/gfx/759208cca7f205ad55d2cfb5e27ac443.jpg', 'akcesoria'),
(4, 'Bidon Hydro Flask', 'Bidony Hydro Flask działają jak termos.\r\n\r\nLatem działają jak lodówka, utrzymując niską temperaturę napojów i jedzenia aż 24 godziny\r\n\r\nZimą - utrzymują ciepło przez co najmniej 6 godzin!\r\n\r\nDlaczego właśnie Hydro Flask? Temperatura, smak i transport! Unikalna kombinacja tych trzech czynników sprawia, że Hydro Flask jest czymś więcej niż zwykłą butelką czy bidonem na wodę. I za każdym razem dostarcza nam oczekiwanego orzeźwienia! Korzystanie z Hydro Flask ma również aspekt ekologiczny, gdyż ograniczamy użytkowanie plastikowych butelek, a co za tym idzie, generujemy mniej śmieci.\r\n\r\nTemperature. Colder. Hotter. Longer. Happier.', 139.99, 'Żółty', 'https://images-na.ssl-images-amazon.com/images/I/51kjword-DL._AC_SX569_.jpg', 'akcesoria'),
(5, 'Calvin Klein Euphoria', 'Calvin Klein Euphoria 100 ml woda perfumowana kobieta EDP\r\nWoda perfumowana Euphoria, zaprojektowana przez Dominique’a Ropion, Carlosa Benaim i Loca Dong w 2005 roku.\r\n\r\nZapach dla kobiety pewnej siebie i silnej, która na co dzień lubi klasyczny, prosty styl.', 99.99, 'Fioletowy', 'https://7.allegroimg.com/original/009db8/69d6f01f4b34867972f08407d517/Calvin-Klein-Euphoria-100-ml-woda-perfumowana-kobieta-EDP', 'kosmetyki'),
(7, 'Smartwatch KW10 OLED', 'ZEGAREK SMARTWATCH DAMSKI SMARTWATCH KW10 W końcu zegarek typu SMARTWATCH zaprojektowany dla Pań. Świetny Desinge oraz szeroka paleta koloru zegarka zapewne znajdzie zastosowanie w Damskim gronie.  MENU ZEGARKA W JĘZYKU POLSKIM (po połączeniu zegarka z aplikacją) 9 Trybów Treningu do wyboru Monitor Snu Krokomierz Miernik ciśnienia krwi Miernik tętna Rejestr Spalonych Kalorii Powiadomienia połączeń przychodzących Powiadomienia SMS, Facebook, WhatsApp i inne. Zestaw zawiera przyrząd który umożliwi Ci regulacje paska do obwodu Twojego nadgarstka. Można odpiąć kilka oczek i pomniejszyć lub powiększyć bransoletę zegarka. ', 197.91, 'Złoty', '/Assets/Images/Uploaded6091dcb9403680971aeadfbb42f6.jpg', 'akcesoria'),
(8, 'XBOX ONE S 1TB', 'KONSOLA XBOX ONE S All-Digital Edition Stan: Fabrycznie Nowa  Gwarancja : 2 lata  Rodzaj: Xbox One S  Dysk: 1TB  Zestaw Zawiera:  Konsole Xbox One S 1 TB Pad Controller Xbox One S Kabel Zasilający Kabel HDMI Zestaw nie zawiera GIER ORAZ SUBSKRYPCJI.  Konsola Xbox One S All-Digital: nie odtwarza dysków fizycznych (brak napędu)', 579, 'Biały', '/Assets/Images/Uploaded/be8e739e41859d76228fffbc8a10.jpg', 'elektronika'),
(9, 'Sukienka Orsay', 'Piękna sukienieczka na wesele a może i nie tylko', 199.99, 'Czerwony', '/Assets/Images/Uploaded/audrey-podwojnie-rozkloszowana-sukienka-czerwona-zb-935.jpg', 'Ubranie'),
(10, 'Czapka Gucci', 'Czapka Gucci mnie nie smucci', 2951, 'Czarny', '/Assets/Images/Uploaded/12547654_13015319_1000.jpg', 'Ubranie'),
(11, 'Kolczyki KRUK', 'Kolczyki w kształcie księżyców, złoto złote', 149.99, 'Złoty', '/Assets/Images/Uploaded/kolczyki-wild-srebrne-pozlacane-ksiezyc.jpg', 'Akcesoria'),
(12, 'Powerbank Samsung', 'pojemność: 10000mAh ', 59.99, 'Srebrny', '/Assets/Images/Uploaded/eb-p1100csegww-1.jpg', 'Elektronika'),
(13, 'Perfumy JOOP! Homme', 'Woda toaletowa JOOP! Homme to esencja męskiej charyzmy. Jego wyrazisty i oryginalny zapach rozpoznasz wśród tysiąca innych i na zawsze zapadnie w Twoją pamięć. Cytrusowa eksplozja świeżości kontrastuje z rozgrzewającymi akordami cynamonu i kardamonu. Przechodzą one płynnie do serca zapachu, w którym jedwabisty jaśmin spotyka się z konwalią i heliotropem. Wyraźnie męska, drzewna baza wody toaletowej skrywa słodkawe nuty wanilii, paczuli, fasoli tonka i drzewa sandałowego.', 249.99, 'Czerwony', '/Assets/Images/Uploaded/375x500.1251.jpg', 'Kosmetyki'),
(14, 'Head & Shoulders szampon', 'Szampon przeciwłupieżowy Menthol skutecznie oczyszcza włosy, zapewniając uczucie mentolowej świeżości i długotrwałą ochronę przed łupieżem. Zaawansowana formuła Derma&Pure skutecznie zwalcza problemy swędzącej, tłustej i suchej skóry głowy, zapobiegając łupieżowi, zanim jeszcze stanie się widoczny. Szampon przeciwłupieżowy Menthol został opracowany z myślą o pięknych, miękkich włosach, które są głęboko nawilżone i do 100% bez łupieżu (widoczne oznaki łupieżu, przy regularnym stosowaniu).', 14.05, 'Biały', '/Assets/Images/Uploaded/75fd4901af3e314366fcf7d4468b2d4b.jpg', 'Kosmetyki'),
(15, 'Skarpetki w pizze', 'Skarpetki w pizze', 14.05, 'Czarny', '/Assets/Images/Uploaded/4990feb3e488e0da5f3bef700a248ad0.jpg', 'Ubranie'),
(16, 'Suszarka Curl & Straight Confidence', 'Suszarka Curl & Straight', 399.99, 'Czarny', '/Assets/Images/Uploaded/549594-kb78b.png', 'Elektronika'),
(17, 'Słuchawki JBL', 'Słuchawki jbl', 134.25, 'Fioletowy', '/Assets/Images/Uploaded/res_fe8d9e56e6db2201dcce4d5316c055b4_full.jpg', 'Elektronika'),
(19, 'Tusz do rzęs', 'Tusz Rimmel London', 21.59, 'Złoty', '/Assets/Images/Uploaded/prod_1200280_1_613x613.jpg', 'Kosmetyki'),
(20, 'Golf Zara', 'Golf', 120, 'Czerwony', '/Assets/Images/Uploaded/SGO0083CE_1.jpg', 'Ubranie'),
(21, 'Okulary przeciwsłoneczne', 'Okulary przeciwsłoneczne', 60.99, 'Niebieski', '/Assets/Images/Uploaded/okulary-przeciwsloneczne-z-polaryzacja-barcur-sprzedam-490387820.jpg', 'Akcesoria'),
(22, 'Jeansy jasne', 'Jeansy', 135.99, 'Niebieski', '/Assets/Images/Uploaded/fao_pl_Niebieskie-jeansy-damskie-z-przetarciami-323368_1.jpg', 'Ubranie'),
(23, 'Kurtka zimowa Cropp', 'Kurtka zimowa', 220.5, 'Fioletowy', '/Assets/Images/Uploaded/pol_pl_Kurtka-zimowa-Reimatec-Reima-Inari-23807_9.jpg', 'Ubranie'),
(24, 'Pasek Gucci', 'Mmm paseczek', 1340.75, 'Złoty', '/Assets/Images/Uploaded/479889b843d6be953deb2203b3fc.jpg', 'Akcesoria'),
(25, 'iPhone 11Pro', 'Apple', 3599, 'Biały', '/Assets/Images/Uploaded/srebrny(1).jpg', 'Elektronika'),
(26, 'Laptop Acer', 'Acer laptop', 1567.99, 'Fioletowy', '/Assets/Images/Uploaded/pobrane.jpg', 'Elektronika'),
(27, 'Mydło BHP', 'mydełko bhp', 3.99, 'Żółty', '/Assets/Images/Uploaded/a793ecb78e4c2bd80ab0ae9c80715549.jpg', 'Kosmetyki'),
(28, 'Figi damskie CK', 'CK', 159.99, 'Biały', '/Assets/Images/Uploaded/CALVIN-KLEIN-FIGI-MAJTKI-3PAK-KOMPLET-3-szt-CK-r-L.jpg', 'Ubranie'),
(29, 'Naszyjnik Romuald', 'Naszyjnik', 100, 'Srebrny', '/Assets/Images/Uploaded/wisiory-12420492_5973003439.jpg', 'Akcesoria'),
(30, 'Dior Sauvage', 'perfumki', 359.99, 'Niebieski', '/Assets/Images/Uploaded/73407.jpg', 'Kosmetyki');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `salt` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `hash` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `salt`, `hash`, `admin`) VALUES
('1', 'UO7KnNC+86yDh6txJxVGOEpEkZavHybV0BX0BJ++DTsoEF+4fMpd4A==', 'JiumNq5mUoQ7QsENzeO1NCwqUcFt5TGOGan/ZI62B9BLzMJQSUNpiA==', 1),
('2', 'RSYO5FUzugdB2AJb4iG47byo92QAGftNZT/FAUpMBFp9VJZYpsQMdg==', 'EvxLKWSMkQLxBQwpBf/hyn4MGPi5uP1H8UhWKrtmZsk+VLV0TCfp2Q==', 1),
('X', 'lFFDH/wS1cFJpYeUV7Vdyk7pzTNmXMju0Ok/BUaE+O35fqIAZQAnsQ==', '0NvGNis7pdIHN0dInoUmToEjfWY02DlxKAruT1SZOnox3fVtjeRvIg==', 0),
('XD', 'GXkkci5nw67Ex3lgVRvz9tizmG+EiNXYld2WEqOuLi8d77xjniF+Hw==', 'V/L9RUzpkKH5GvQ5dy8UzRJMKl1Ea27xVA6uNaMKrQljYGG+Rzh91g==', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
