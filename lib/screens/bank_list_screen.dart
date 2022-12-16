import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanalira_flutter_application_test/controller/bank_controller.dart';
import 'package:sanalira_flutter_application_test/extensions/widget_decorations.dart';
import '../core/methods/get_bank_image.dart';
import '../models/bank.dart';
import '../widgets/bottom_navigator_widget.dart';
import '../widgets/bottom_sheet_widget.dart';

class BankListScreen extends StatefulWidget {
  const BankListScreen({super.key});

  @override
  State<BankListScreen> createState() => _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<BankController>(context, listen: false).getBankList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: myBody(),
      backgroundColor: Colors.white,
      bottomNavigationBar: myBottomNavigatorBar(selectedIndex,_onItemTapped),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(spreadRadius: 3, color: Colors.white),
            ],
          ),
          child: IconButton(
            color: Colors.red,
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, "register")
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(spreadRadius: 3, color: Colors.white),
              ],
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notification_add,
                  color: Colors.black,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(spreadRadius: 3, color: Colors.white),
                ],
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ))),
        ),
      ],
      backgroundColor: Color.fromARGB(243,244,246,255),
      elevation: 0,
    );
  }

  Widget myBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color.fromARGB(243, 244, 246, 255),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: boxDecoration,
                child: const ListTile(
                    leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/turk_bayragi.webp")),
                    title: Text("Türk Lirası",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("TL"),
                    trailing: Text(
                      "234 ₺",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Türk Lirası yatırmak için banka seçiniz.")),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<BankController>().banks.length,
                itemBuilder: (context, index) {
                  Bank bank = context.watch<BankController>().banks[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: boxDecoration,
                      child: ListTile(
                        onTap: () =>  bottomSheet(context,bank),
                        leading: DottedBorder(
                          color: Colors.grey,
                          dashPattern: [2,3],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(5),
                          strokeWidth: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                                  width: 70,
                                  height: 80,
                                  child: Center(
                                    child: Image.asset(
                                      getBankImage(bank.bankName!),
                                      alignment: Alignment.center,
                                      ),
                                  )),
                          ),
                        ),
                        dense: true,
                        visualDensity: const VisualDensity(vertical: 3),
                        title: Text(
                          bank.bankName!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Havale / EFT ile para gönderin"),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

    int selectedIndex=0;
    void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }



  
}
