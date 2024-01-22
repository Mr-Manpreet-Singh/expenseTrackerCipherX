import 'package:expense_tracker_app/screens/home_screen/bottom_sheet_options.dart';
import 'package:expense_tracker_app/utils/custom_textstyle.dart';
import 'package:flutter/material.dart';

abstract class HomeScreenHelper {


  // HomeScreen TextStyles

  static final amountTextStyle = CustomTextStyles.customStyle(
      color: const Color(0xFFFBFBFB),
      fontSize: 22,
      fontWeight: FontWeight.w600);

  static final accountBalanceTextStyle = CustomTextStyles.customStyle(
      color: const Color(0xFF161719),
      fontSize: 40,
      fontWeight: FontWeight.w600);

  static final incomeExpenseTitleTextStyle = CustomTextStyles.customStyle(
      color: const Color(0xFFFBFBFB),
      fontSize: 14,
      fontWeight: FontWeight.w500);




  // HomeScreen TextBoxes

  static final accountBalanceTextBox = Text('Account Balance',
      style: CustomTextStyles.customStyle(
          color: const Color(0xFF90909F),
          fontSize: 14,
          fontWeight: FontWeight.w500));

  static Text recentTransactionTextBox = const Text(
    'Recent Transaction',
    style: TextStyle(
      color: Color(0xFF292B2D),
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      height: 0,
    ),
  );

  

// FloatingAction Button

  static FloatingActionButton myFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const BottomSheetOptions();
            });
      },
      child: const Icon(Icons.add),
    );
  }



  // HomeScreen AppBar

  static Widget myAppBar = Padding(
    padding: const EdgeInsets.only(top:25.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            width: 36,
            height: 36,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/avatar.png"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            )),
        const SizedBox(width: 30),
        const Icon(
          Icons.notifications_rounded,
          color: Color(0xFF7E3DFF),
          size: 36,
        )
      ],
    ),
  );
}
