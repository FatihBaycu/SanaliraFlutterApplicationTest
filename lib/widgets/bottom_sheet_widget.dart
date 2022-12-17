 import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanalira_flutter_application_test/constants/bottom_sheet_constant.dart';
import '../models/bank.dart';

  var fullNameController = TextEditingController();

Future<void> bottomSheet(context,Bank bank) {
    return showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
     borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
  ),
  backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(BottomSheetConstant.dividerLine,alignment: Alignment.topCenter),
                    BottomSheetTextFieldLabel(BottomSheetConstant.accountName),
                    bottomSheetTextField(bank.bankAccountName!),
        
                    BottomSheetTextFieldLabel(BottomSheetConstant.iban),
                    bottomSheetTextField(bank.bankIban!),
        
                    BottomSheetTextFieldLabel(BottomSheetConstant.description),
                    bottomSheetTextField(bank.descriptionNo!),
        
                    bottomSheetField(BottomSheetConstant.dontForget,BottomSheetConstant.paleText),
                    bottomSheetField(BottomSheetConstant.wrongInfo,BottomSheetConstant.redText,BottomSheetConstant.redTextBackground),
                    
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

class BottomSheetTextFieldLabel extends StatelessWidget {
  String field;
  BottomSheetTextFieldLabel(this.field);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft,child: Text(field,style: GoogleFonts.inter(color:BottomSheetConstant.paleText,fontSize:10)));
  }
}
  
  Padding bottomSheetField(String text,Color textColor,[Color? backgroundColor]) {
    return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                       decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor!=null?backgroundColor:BottomSheetConstant.defaultTextBackground,
                boxShadow:const  [
                  BoxShadow(spreadRadius: 3, color: Colors.white),
                ],
              ),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            text,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 11),
                            textAlign: TextAlign.center,
                          
                            ),
                        )),
                    ),
                  );
  }

  Widget bottomSheetTextField(String val) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 46,
        child: TextFormField(
                        controller: fullNameController,
                        enabled: false,
                        decoration:  InputDecoration(
                            filled: true,
                            fillColor: BottomSheetConstant.defaultTextBackground,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignLabelWithHint: true,
                            hintText: val,
                            isDense: true,
                            suffixIcon: IconButton(
                              icon:Icon(Icons.copy,size: 16,),
                              onPressed: () {
                                print("copied");
                                FlutterClipboard.copy(val).then(( value ) => print('copied'));
                              },
                              color: Colors.green,
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              //height: 0.5,
                              fontWeight: FontWeight.w500,
                            ),
                            hintStyle: const TextStyle(
                              fontSize: 12,
                                color: Colors.black, fontWeight: FontWeight.bold),
                            floatingLabelBehavior: FloatingLabelBehavior.always),
                      ),
      ),
    );
  }