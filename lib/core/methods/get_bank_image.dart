    import '../../models/bank_image.dart';

String getBankImage(String bankName){

    List<BankImage> bankImage=<BankImage>[];
    bankImage.add( BankImage("T.C. ZİRAAT BANKASI A.Ş.", "assets/ziraat_bankasi_logo.png"));
    bankImage.add( BankImage("AKBANK T.A.Ş.", "assets/akbank_logo.png"));
    bankImage.add( BankImage("ALBARAKA TÜRK KATILIM BANKASI A.Ş.", "assets/albaraka_logo.png"));
    bankImage.add( BankImage("QNB FİNANSBANK A.Ş.", "assets/finans_bank_logo.png"));
    bankImage.add( BankImage("TÜRKİYE GARANTİ BANKASI A.Ş.", "assets/garanti_BBVA_logo.png"));
    bankImage.add( BankImage("KUVEYT TÜRK KATILIM BANKASI A.Ş.", "assets/kuveyt_turk_logo.png"));
    bankImage.add( BankImage("TÜRKİYE VAKIFLAR BANKASI T.A.O.", "assets/vakifbank_logo.png"));

    for(int i=0; i<bankImage.length; i++){
      if(bankImage[i].bankName!.contains(bankName)){
          return bankImage[i].bankImage.toString();
      }
    }
    return "assets/albaraka_logo.png";
  }
