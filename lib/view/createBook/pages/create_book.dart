import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:story_always/themes/colors.dart';
import 'package:story_always/view/widgets/custom_appbar.dart';
import 'package:story_always/view/widgets/custom_buttom.dart';
import '../../../controller/book_controller.dart'; // Import BookController

class CreateBookPage extends StatelessWidget {
  final TextEditingController _bookNameController = TextEditingController();
  final BookController controller = Get.find(); // Get the instance of BookController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create a Book",showBackButton: true,) ,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Book Name",style: TextStyle(fontSize: 18.sp,color: textColor),),
                  SizedBox(height: 10,),
                  TextField(
                    controller: _bookNameController,
                    decoration: InputDecoration(
                      focusColor: textColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Color(0xff364636)),
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Color(0xff364636)),
                      ) ,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Color(0xff364636)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            CustomButton(text: "CREATE", route: "", buttonColor: buttonColor, textColor: buttonTextColor,onPressed:  () {
              final bookName = _bookNameController.text;
              if (bookName.isNotEmpty) {
                // Add book with 0% progress
                controller.addBook(bookName);
                context.go("/allBook");
              }
            },isPop: true,),
          ],
        ),
      ),
    );
  }
}
