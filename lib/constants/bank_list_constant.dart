import 'package:flutter/material.dart';

import '../models/bank_image.dart';

class BankListConstant{

//Colors
  static Color containerColor=Color(0xffF3F4F6);
  static Color scaffoldBackgroundColor=Colors.white;
  static Color appBarBackgroundColor=Color.fromARGB(243,244,246,255);

//ImagePaths

static String leftArrow="assets/icons/app_bar_icons/left-arrow.svg";
static String turkBayragi="assets/icons/turk_bayragi.svg";
static String bell="assets/icons/app_bar_icons/bell.svg";
static String greenCircle="assets/icons/app_bar_icons/green_circle.svg";
static String settings="assets/icons/app_bar_icons/settings.svg";
static String ziraatBank="assets/banks_logos/ziraat_bankasi_logo.png";
static String akbank= "assets/banks_logos/akbank_logo.png";
static String albarakaBank= "assets/banks_logos/albaraka_logo.png";
static String finansBank= "assets/banks_logos/finans_bank_logo.png";
static String garantiBank="assets/banks_logos/garanti_BBVA_logo.png";
static String kuveytTurkBank="assets/banks_logos/kuveyt_turk_logo.png";
static String vakifBank= "assets/banks_logos/vakifbank_logo.png";
static String banner= "assets/banner.jpg";

//StringValues

static String turkLirasi="Türk Lirası";
static String tl="TL";
static String money="234 ₺";
static String selectBank="Türk Lirası yatırmak için banka seçiniz.";
static String sendMoney="Havale / EFT ile para gönderin";


static List<BankImage> bankImage=[
  BankImage("T.C. ZİRAAT BANKASI A.Ş.", BankListConstant.ziraatBank),
  BankImage("T.C. ZİRAAT BANKASI A.Ş.", BankListConstant.ziraatBank),
  BankImage("AKBANK T.A.Ş.", BankListConstant.akbank),
  BankImage("ALBARAKA TÜRK KATILIM BANKASI A.Ş.", BankListConstant.albarakaBank),
  BankImage("QNB FİNANSBANK A.Ş.",BankListConstant.finansBank),
  BankImage("TÜRKİYE GARANTİ BANKASI A.Ş.",BankListConstant.garantiBank),
  BankImage("KUVEYT TÜRK KATILIM BANKASI A.Ş.", BankListConstant.kuveytTurkBank),
  BankImage("TÜRKİYE VAKIFLAR BANKASI T.A.O.", BankListConstant.vakifBank),
    ];

}