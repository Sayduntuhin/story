import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:story_always/themes/colors.dart';
import 'package:story_always/view/widgets/custom_appbar.dart';
import '../../../controller/book_controller.dart';

class AllBooksPage extends StatelessWidget {
  final BookController controller =
      Get.put(BookController()); // Get the BookController instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "All Books", showBackButton: false),
      body: Obx(() {
        final books = controller.books;
        return books.isEmpty
            ? Center(child: Text("No books available"))
            : GridView.builder(
                padding: EdgeInsets.all(16.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    mainAxisExtent: 310.h),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Book Cover (Container with Book Name)
                      Row(
                        children: [
                          Container(
                            height: 230.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: Color(
                                  0xFF897C6B), // Background color of the book
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  bottomLeft: Radius.circular(5.r)),
                            ),
                          ),
                          Container(
                            width: 150.w,
                            height: 230.h, // Adjust height of the book cover
                            decoration: BoxDecoration(
                              color: Color(
                                  0xFFE5D1BE), // Background color of the book
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.r),
                                  bottomRight: Radius.circular(5.r)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  book.name,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.asset(
                                  "assets/icons/coverLine.png",
                                  width: 102,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 160.h,
                        child: LinearProgressIndicator(
                          minHeight: 12.h,
                          value: book.progress,
                          backgroundColor: Colors.grey.shade300,
                          color: textColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "${(book.progress * 100).toInt()}% completed",
                        style: TextStyle(
                            color: textColor, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      if (book.progress == 1.0)
                        Container(
                          width: 160.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              color: textColor,
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_download_outlined,
                                size: 15,
                                color: buttonTextColor,
                              ),
                              Text(
                                "Download Book",
                                style: TextStyle(
                                    fontSize: 10.sp, color: buttonTextColor),
                              )
                            ],
                          ),
                        )
                    ],
                  );
                },
              );
      }),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft, // Align the FAB to the left
        child: Padding(
          padding: EdgeInsets.only(
              left: 30, bottom: 15), // Padding to add space around the FAB
          child: ClipOval(
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.transparent,
              onPressed: () {
                context.push("/createBook"); // Navigate to CreateBookPage
              },
              child: Image.asset(
                'assets/icons/flortbutton.png', // Replace with your PNG image path
                width: 50.w, // Adjust the size of the image
                height: 50.h, // Adjust the size of the image
                fit: BoxFit
                    .contain, // Ensure the image fits properly inside the FAB
              ),
            ),
          ),
        ),
      ),
    );
  }
}
