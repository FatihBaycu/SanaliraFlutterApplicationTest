 import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import '../models/bank.dart';
  var fullNameController = TextEditingController();

Future<void> bottomSheet(context,Bank bank) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Align(alignment: Alignment.centerLeft,child: const Text("Hesap Adı")),
                      bottomSheetTextField(bank.bankAccountName!),
        
                      const Align(alignment: Alignment.centerLeft,child: const Text("IBAN")),
                      bottomSheetTextField(bank.bankIban!),
        
                      const Align(alignment: Alignment.centerLeft,child: const Text("Açıklama")),
                      bottomSheetTextField(bank.descriptionNo!),
        
                      bottomSheetField("Lütfen havale yaparken açıklama alanına yukraıdaki kodu yazmayı unutmayın.",Colors.black),
                      bottomSheetField("Eksik bilgi girilmesi sebebiyle tutarın askıda kalması durumunda, ücret kesintisi yapılacaktır.",Colors.red),
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  
  Padding bottomSheetField(String text,Color textColor) {
    return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                       decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(243, 244, 246, 255),
                boxShadow:const  [
                  BoxShadow(spreadRadius: 3, color: Colors.white),
                ],
              ),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            text,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 12),
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
        height: 56,
        child: TextFormField(
                        controller: fullNameController,
                        enabled: false,
                        decoration:  InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(243, 244, 246, 255), //
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.transparent), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            alignLabelWithHint: true,
                            hintText: val,
                            suffixIcon: IconButton(
                              icon:Icon(Icons.copy),
                              onPressed: () {
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