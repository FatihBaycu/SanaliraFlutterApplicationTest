    import '../../models/bank_image.dart';

String getBankImage(String bankName){

    List<BankImage> bankImage=<BankImage>[];
    bankImage.add( BankImage("T.C. ZİRAAT BANKASI A.Ş.", "assets/banks_logos/ziraat_bankasi_logo.png"));
    bankImage.add( BankImage("AKBANK T.A.Ş.", "assets/banks_logos/akbank_logo.png"));
    bankImage.add( BankImage("ALBARAKA TÜRK KATILIM BANKASI A.Ş.", "assets/banks_logos/albaraka_logo.png"));
    bankImage.add( BankImage("QNB FİNANSBANK A.Ş.", "assets/banks_logos/finans_bank_logo.png"));
    bankImage.add( BankImage("TÜRKİYE GARANTİ BANKASI A.Ş.", "assets/banks_logos/garanti_BBVA_logo.png"));
    bankImage.add( BankImage("KUVEYT TÜRK KATILIM BANKASI A.Ş.", "assets/banks_logos/kuveyt_turk_logo.png"));
    bankImage.add( BankImage("TÜRKİYE VAKIFLAR BANKASI T.A.O.", "assets/banks_logos/vakifbank_logo.png"));

    for(int i=0; i<bankImage.length; i++){
      if(bankImage[i].bankName!.contains(bankName)){
          return bankImage[i].bankImage.toString();
      }
    }
    return "assets/banner.jpg";
  }
