-- phpMyAdmin SQL Dump
-- version 4.0.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 05, 2013 at 10:57 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sajt`
--

-- --------------------------------------------------------

--
-- Table structure for table `anketa`
--

CREATE TABLE IF NOT EXISTS `anketa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tekst` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tip` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `anketa`
--

INSERT INTO `anketa` (`id`, `tekst`, `tip`, `sort`) VALUES
(1, 'Da li vam se svidja sajt?', 0, 1),
(2, 'Da', 1, 2),
(3, 'Ne', 1, 3),
(4, 'zasto?', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `anketao`
--

CREATE TABLE IF NOT EXISTS `anketao` (
  `idA` int(11) NOT NULL,
  `idK` int(11) NOT NULL,
  `odgovor` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `anketao`
--

INSERT INTO `anketao` (`idA`, `idK`, `odgovor`) VALUES
(2, 1, '1'),
(2, 2, '1');

-- --------------------------------------------------------

--
-- Table structure for table `elementi`
--

CREATE TABLE IF NOT EXISTS `elementi` (
  `elm_id` int(11) NOT NULL,
  `str_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elementi`
--

INSERT INTO `elementi` (`elm_id`, `str_id`) VALUES
(2, 1),
(7, 1),
(8, 1),
(7, 10),
(11, 1),
(12, 1),
(11, 10),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

CREATE TABLE IF NOT EXISTS `kategorije` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`id`, `naziv`) VALUES
(2, 'Konditori'),
(5, 'Makrobiotika'),
(6, 'Hleb,testenina i musli'),
(7, 'gh');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_uloge` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `ime`, `pass`, `email`, `id_uloge`) VALUES
(1, 'admin', 'admin', 'admin@prodavnica.rs', 1);

-- --------------------------------------------------------

--
-- Table structure for table `proizvodi`
--

CREATE TABLE IF NOT EXISTS `proizvodi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kat` int(11) NOT NULL,
  `naziv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `opis` text COLLATE utf8_unicode_ci NOT NULL,
  `slika` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cena` int(20) NOT NULL,
  `id_promo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`id`, `id_kat`, `naziv`, `opis`, `slika`, `cena`, `id_promo`) VALUES
(5, 2, 'Keks Frolini', 'kuruzni skrob, biljni margarin (ulja i masti palme, kokosa, uljane repice, so, emulgatori: E-471,E-475, regulatori kiselosti: E-330, aroma), jaja 9%, krompirov skrob, med 2%, modifikovani kukuruzni skrob, sredstvo sa podizanje: amonijum hidrogen karbonat i sodijum hidrogen karbonat, so, dekstroza, aroma.\r\n\r\nBez glutena, bez pÅ¡eniÄnog skroba, bez laktoze.', '97.jpg', 447, 1),
(6, 2, 'Napolitanke sa leÅ¡nikom', 'Kukuruzno braÅ¡no, Å¡eÄ‡er, biljna mast, krompirov skrob, odmaÅ¡Ä‡eni leÅ¡nik krem 4.9%, surutka u prahu, kako prah, emulgator: sojin lecitin, so, zguÅ¡njivaÄ: guar guma, natrijev hidrogenkarbonat, aroma\r\n\r\nBez glutena, bez pÅ¡eniÄnog skroba, bez konzervansa.\r\n', '99.jpg', 375, 1),
(7, 2, 'ÄŒokoladni biskviti ', 'Crna Äokolada 29% (minimun 60% kakaoa: 47.5% kakao mase, Å¡eÄ‡er, kakao maslac, emulgator: sojin lecitin), kukuruzno braÅ¡no, krompirov skrob, Å¡eÄ‡er, nehidrogenizovana biljna masnoÄ‡a, glukozni sirup, mleko u prahu, sredstvo za podizanje: amonijum hidrogen karbonat i sodijum hidrogen karbonat, so, aroma', '91.jpg', 375, 1),
(8, 2, 'Semenko sa brusnicom', 'Brusnica 9%, med 30 %, ekspandirani jeÄam, jeÄmene i ovsene pahuljice, suncokret, kukuruzni fleks, viÅ¡nja, aroma pomorandÅ¾e, inulin.', '1591.jpg', 41, 1),
(9, 2, 'Semenko sa borovnicom', 'Borovnica 11%, med 40 %, ovsene i jeÄmene pahuljice, kokos, koncentrat borovnice, ekspandirani jeÄam, inulin.', '1591.jpg', 38, 1),
(10, 5, 'SuÅ¡ene pÅ¡eniÄne klice', 'â€¢lekovita svojstva:\r\nMada predstavljaju svega 3% mase celog zrna, upravo pÅ¡eniÄne klice predstavljaju njegov najhranljiviji deo: one su bogat izvor belanÄevina (oko 25%), vitamina B1, B2, B6 i E i gvoÅ¾Ä‘a.\r\nVitamin E je vaÅ¾an antioksidans i pozitivno deluje na zdravlje koÅ¾e.\r\nPÅ¡eniÄne klice sadrÅ¾e i selen koji ima vaÅ¾nu ulogu u zaÅ¡titi srca i krvnih sudova. TakoÄ‘e, one sadrÅ¾e i oktakosanol koji utiÄe na otklanjanje zamora.', '1455.jpg', 212, 1),
(11, 5, 'Alge hidÅ¾iki 25 gr', 'â€¢lekovita svojstva:\r\npopravljaju krvnu sliku\r\nojaÄavaju zidove kapilara\r\nuniÅ¡tavaju bakterije truljenja    \r\npoboljÅ¡avaju funkcionisanje creva\r\n\r\nHidÅ¾iki alge sadrÅ¾e deset puta veÄ‡u koliÄinu kalcijuma nego ista koliÄina mleka, sira ili drugih mleÄnih proizvoda. Veoma su korisne u ishranu dijabetiÄara. GvoÅ¾Ä‘e (55mg na 100gr suÅ¡enih algi) potpomognuto kalcijumom (1400 mg u 100gr suÅ¡enih algi), koji omoguÄ‡ava njegovu ugradnju, popravlja kvalitet krvi. Natrijum, kalijum, fosfor i jod su neophodni minerali koji reguliÅ¡u metaboliÄke procese u organizmu. Vitamini B1, B2, B3 omoguÄ‡avaju nesmetano funkcionisanje nervnog sistema, ojaÄavaju zidove kapilara i obnavljaju crevnu floru. U tradicionalnoj medicini hidÅ¾iki alge se koriste za jaÄanje creva jer imaju jako antiseptiÄko i antitoksiÄno delovanje (uniÅ¡tavaju bakterije truljenja).\r\n', '15.jpg', 423, 1),
(12, 5, 'Alge nori 5 listova', 'â€¢lekovita svojstva:\r\nNajvaÅ¾nija osobina alge nori je obilje vitamina A, Äak 2-4 puta viÅ¡e nego Å¡to ga ima ista koliÄina Å¡argarepe. Nori alga ima i izuzetno visoki sadrÅ¾aj kvalitetnih belanÄevina (dvaput viÅ¡e od iste koliÄine goveÄ‘eg odreska).\r\n\r\nNori alge su bogate vitaminima B i C, kacijumom i gvoÅ¾Ä‘em, nijacinom (vitamin B3), kao i cijanokobalaminom (vitamin B12) koji pomaÅ¾e funkciju nervnog sistema i sniÅ¾ava nivo holesterola.\r\nNori alga sadrÅ¾i i ulja koja spreÄavaju zakrÄenja arterija i taurin (aminokiselinu koja smanjuje krvni pritisak). Nori pomaÅ¾e i u leÄenju bolesti beri-beri.', '18.JPG', 473, 1),
(13, 5, ' Beli miso', ' (organski proizvod) 250 gr\r\nMiso je fermentisana pasta sojinih zrna, morske soli i gljivice koÄ‘i uz dodatak jeÄma ili pirinÄa. Ona se na Istoku proizvodi i koristi veÄ‡ 1300 godina. To je jedan od najzdravijih, najukusnijih i najprimenljivijih dodataka hrani. Marukura slatki beli miso je vrhunski proizvod iz bioloÅ¡kog uzgoja i najpopularniji je miso u Japanu. Zanatlijski ga proizvodi porodica Okada. Odlikuje ga lagan, slatkast, osveÅ¾avajuÄ‡ ukus. Ovaj miso je naroÄito pogodan za koriÅ¡Ä‡enje u sosovima, umacima, prelivima za salate.', '1075.jpg', 345, 1),
(14, 5, ' Sirovi sejtan', 'â€¢sastav:\r\nPÅ¡eniÄno braÅ¡no, soja sos, kombu alga.\r\n\r\nâ€¢lekovita svojstva:\r\nSadrÅ¾i 70 posto proteina i neznatne masti i ugljenih hidrata. Lako je svarljiv i brzo se asimiluje u organizmu, tako da ga mogu koristiti sve osobe koje troÅ¡e velike koliÄine energije. NaroÄito se preporuÄuje sportistima, trudnicama i deci.', '1075.jpg', 203, 1),
(15, 6, 'RaÅ¾ani hleb', 'pakovanje od 500 gr\r\n\r\nPampernikl je tradicionalni nemaÄki hleb izraÄ‘en od krupno mlevene raÅ¾i. VlaÅ¾an je i kiselkast.\r\n\r\nzemlja porekla: NemaÄka\r\n \r\n\r\nâ€¢sastav i hranljive vrednosti:\r\nRaÅ¾eno integralno braÅ¡no, sirup od Å¡eÄ‡erne trske, so, jeÄmeni ekstrakt, kvasac\r\n', '209.jpg', 249, 1),
(16, 6, 'Lanene ploÄice', 'Plocice od celog zrna lana.', '773.jpg', 494, 1),
(17, 6, 'Heljdine kore', 'pakovanje od 500 gr\r\n\r\nKore od heljdinog braÅ¡na.\r\n\r\nzemlja porekla: Srbija\r\n\r\nâ€¢sastojci:\r\nHeljdino braÅ¡no, braÅ¡no T-400, so, voda.\r\n', '1294.jpg', 155, 1),
(18, 6, 'Å pageti (bez glutena)', 'Å pageti (bez glutena) 500 gr.\r\n\r\nâ€¢sastav:\r\nPirinÄano braÅ¡no, kukuruzni skrob, izolat proteina graÅ¡ka, emulgator E-471\r\n\r\nBez glutena, bez pÅ¡eniÄnog skroba, bez laktoze.', '94.jpg', 524, 1),
(19, 6, 'Integralna testenina', 'pakovanje od 300 gr', '619.jpg', 79, 1),
(20, 6, 'Testenina za supu', 'pakovanje od 250 gr\r\n\r\nFelicia testenina za supu - bezglutenska testenina. Bez soje, bez mleka, bez jaja.\r\n', '783.jpg', 155, 1),
(21, 2, ' Musli  Å¡tangla', 'Musli natur Å¡tangla - prirodan slatkiÅ¡, krckavo neodoljivog ukusa, bez ikakvih aditiva i konzervanasa, izuzetno energetski jak, pogodan za sportiste, decu ljude kojima je potrebna brza i kvalitetna nadoknada energije.\r\n\r\nzemlja porekla: Srbija\r\n\r\nâ€¢sastav:\r\nÅ tangla od susama, suvog groÅ¾Ä‘a, peÄenog mlevenog kikirikija, suncokreta, prirodnog vrcanog meda, malteksa i kornfleksa.', '775.jpg', 904, 1),
(22, 6, 'ovsena kaÅ¡a', 'pakovanje od 260 gr (4 porcije)\r\n\r\nPosna ovsena kaÅ¡a sa Äokoladom. ZaslaÄ‘eno fruktozom.\r\n\r\nzemlja porekla: ÄŒeÅ¡ka\r\n\r\nâ€¢sastojci:\r\nOvsene pahuljice 48%, biljna masnoÄ‡a, kukuruzni sirup u suvom obliku, sojino ulje, prirodno identiÄna aroma, fruktoza, kukuruzni skrob, komadiÄ‡i Äokolade 3% (Å¡eÄ‡er, biljno ulje, kakao u prahu, emulgator sojin lecitin, arome), kakao, aroma, so, kompleks vitamina.', '1409.jpg', 301, 1);

-- --------------------------------------------------------

--
-- Table structure for table `promocija`
--

CREATE TABLE IF NOT EXISTS `promocija` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opis` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `naziv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `promocija`
--

INSERT INTO `promocija` (`id`, `opis`, `naziv`) VALUES
(1, 'Novi proizvodi ', 'novo');

-- --------------------------------------------------------

--
-- Table structure for table `stranice`
--

CREATE TABLE IF NOT EXISTS `stranice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `naziv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uloga` int(11) NOT NULL,
  `meni` int(11) NOT NULL DEFAULT '-1',
  `msort` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `stranice`
--

INSERT INTO `stranice` (`id`, `link`, `naziv`, `uloga`, `meni`, `msort`) VALUES
(1, 'home', 'Pocetna', 1000, 0, 50),
(2, 'kontakt', 'Kontakt', 1000, -1, 50),
(4, 'anketa', 'Anketa', 1000, -1, 0),
(6, '404', '404', 1000, -1, 0),
(7, 'meni', 'meni', 1000, -1, 0),
(8, 'proizvodi', 'Proizvodi', 1000, 0, 50),
(9, 'login', 'Login', 1000, 0, 100),
(10, 'admin', 'Admin', 1000, 0, 50),
(11, 'desno', 'Desno', 1000, 14, 50),
(12, 'baner', 'Baner', 1000, -1, 0),
(13, 'registracija', 'Registracija', 1000, 0, 50),
(14, 'about', 'O Autoru', 1000, 0, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `uloge`
--

CREATE TABLE IF NOT EXISTS `uloge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uloga` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `uloge`
--

INSERT INTO `uloge` (`id`, `uloga`) VALUES
(1, 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
