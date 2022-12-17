import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sanalira_flutter_application_test/constants/bank_list_constant.dart';
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
      backgroundColor: BankListConstant.scaffoldBackgroundColor,
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
            icon: SvgPicture.asset(BankListConstant.leftArrow),
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
                icon:Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SvgPicture.asset(BankListConstant.bell),
                    SvgPicture.asset(BankListConstant.greenCircle),
                  ],
                ),
),
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
                 icon:SvgPicture.asset(BankListConstant.settings),

)),
        ),
      ],
      backgroundColor: BankListConstant.appBarBackgroundColor,
      elevation: 0,
    );
  }

  Widget myBody() {
    return Container(
      color: BankListConstant.containerColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: boxDecoration,
                child:  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: SvgPicture.asset(BankListConstant.turkBayragi),
                    ),
                    title: Text(BankListConstant.turkLirasi,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(BankListConstant.tl),
                    trailing: Text( BankListConstant.money,style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(BankListConstant.selectBank)),
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
                        subtitle: Text(BankListConstant.sendMoney),
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

    int selectedIndex=2;
    void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }



  
}
