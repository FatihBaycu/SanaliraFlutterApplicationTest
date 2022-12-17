import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sanalira_flutter_application_test/extensions/hive/user_hive.dart';
import 'package:sanalira_flutter_application_test/models/user.dart';
import 'package:sanalira_flutter_application_test/extensions/widget_decorations.dart';
import 'package:sanalira_flutter_application_test/services/user_service.dart';
import '../core/methods/validators.dart';
import '../extensions/text_form_field_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool checkBoxValue = false;
  var phoneNumber = TextEditingController();
  String? password;
  final formKey = GlobalKey<FormState>();
  String initialCountry = 'TR';
  PhoneNumber number = PhoneNumber(phoneNumber: "+908503047172",isoCode: 'TR');
  var user=User();
  var userService=UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: myBody(context),
    );
  }

  Widget myBody(BuildContext context) {
    return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/sanalira_logo2.png",),),
        //color: Colors.green
        ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        // ignore: prefer_const_constructors
        SizedBox(height: 150,),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: const TextSpan(
                                text: "SanaLira'ya",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: " Yeni Üyelik",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left:8),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Bilgilerinizi girip sözleşmeyi onaylayın",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                        ),
// Ad
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                textField("Ad"),
                              SizedBox(height: MediaQuery.of(context).size.width/7+5,
                                  child: TextFormField(
                                    initialValue: "Fatih",
                                    style: textFormFieldStyle,                        
                                    decoration: textFiledDecoration,
                                    maxLength: 50,
                                  
                                    validator: (val) {
                                      if (val.toString().length <= 2) {
                                        return "İsminiz 2 karakterden büyük olmalı";
                                      } else {}
                                    },
                                   onSaved: (val) => user.firstName = val,
                                  ),
                                ),
                                //const SizedBox(height: 10,),
// Soyad
                                textField("Soyad"),
                                SizedBox(height: MediaQuery.of(context).size.width/7+5,
                                  child: TextFormField(
                                    initialValue: "Baycu",
                                   style: textFormFieldStyle,                        
                                    decoration: textFiledDecoration,
                                    maxLength: 50,
                                    validator: (val) {
                                      if (val.toString().length < 2) {
                                        return "Soyisminiz 2 karakterden büyük olmalı";
                                      } else {}
                                    },
                                   onSaved: (val) => user.lastName = val,
                                  ),
                                ),
                                                       //const SizedBox(height: 10,),

// Şifre
                                textField("Şifre"),
                                SizedBox(height: MediaQuery.of(context).size.width/7+5,
                                  child: TextFormField(
                                    initialValue: "SanaLira123!",
                                    obscureText: true,
                                   style: textFormFieldStyle,  
                                    decoration: textFiledDecoration,
                                    maxLength: 20,
                                    onSaved: (val)=>password=val.toString(),
                                    validator: (val) {
                                      if (!isPasswordValid(val.toString()))
                                        return "Şifreniz büyük/küçük harf, sayı ve özel karakter içermelidir.";
                                    },
                                  ),
                                ),
                                                             //const SizedBox(height: 10,),

// Email
                                textField("Email"),
                                SizedBox(height: MediaQuery.of(context).size.width/7+5,
                                  child: TextFormField(
                                    initialValue: "fatih.baycu@gmail.com",
                                   style: textFormFieldStyle,  
                                    decoration: textFiledDecoration,
                                    maxLength: 50,
                                    validator: (val) {
                                      if (!validateEmail(val.toString())) {
                                        return "Email formatınız yanlış";
                                      }
                                    },
                                 onSaved: (val) => user.email = val,
                                  ),
                                ),
                                //const SizedBox(height: 10,),
// Telefon
                                textField("Cep Telefonu Numaranız"),
                                Container(
                                  color: Color.fromARGB(243,244,246,255),
                                  child: InternationalPhoneNumberInput(
                                   hintText: "",
                                    errorMessage: "Geçersiz Telefon Numarası",
                                    onInputChanged: (PhoneNumber number) { 
                                      //print(number.phoneNumber);
                                      },
                                    onInputValidated: (bool value) {
                                      print(value);
                                    },
                                                                   
                                    selectorConfig: const SelectorConfig(
                                      selectorType:
                                          PhoneInputSelectorType.BOTTOM_SHEET,
                                    ),
                                    ignoreBlank: false,                                
                                    autoValidateMode: AutovalidateMode.disabled,
                                    selectorTextStyle:textFormFieldStyle,  
                                    textStyle: textFormFieldStyle,
                                    initialValue: number,
                                    textFieldController: phoneNumber,
                                    formatInput: false,
                                    keyboardType:const TextInputType.numberWithOptions(signed: true, decimal: true),
                                    inputBorder: textFiledBorder,
                                    onSaved: (PhoneNumber number) {
                                      print('On Saved: $number');
                                      user.phoneNumber=number.phoneNumber.toString();
                                    },
                                  ),
                                ),
                             
//Checkbox
                                Row(
                                  children: [
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          Colors.grey),
                                      //checkColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      value: checkBoxValue,
                                      onChanged: (value) {
                                        setState(() {
                                          checkBoxValue = value!;
                                        });
                                      },
                                    ),
                                    Expanded(
                                        child: Text(
                                            "Hesabınızı oluştururken sözleşme ve koşulları kabul etmeniz gerekir.")),
                                  ],
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * .1,
                                  width: MediaQuery.of(context).size.width * .9,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(Color(0xff66CC78))),
                                    child: Text("Giriş Yap"),
                                    onPressed: () async{
                                      if(formKey.currentState!.validate()&&checkBoxValue){
                                    formKey.currentState!.save();
                                        await userService.creteUser(user,password!);

                                         UserHive.setUser(user);
                                         Navigator.pushNamed(context, "/");
                                      }
                                         

                                    }
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
  }

   Widget textField(String field) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0,bottom: 4.0),
      child: Align(alignment: Alignment.centerLeft, child: Text(field,style:TextStyle(color:Colors.black38))),
    );    
  }
}

