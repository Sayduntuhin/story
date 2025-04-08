import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_always/view/widgets/custom_buttom.dart';
import '../../../themes/colors.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _couponController = TextEditingController();

  bool _isCouponApplied = false;
  double _totalPrice = 60.0;
  void _applyCoupon() {
    setState(() {
      if (_couponController.text == "GIVE50") {
        _totalPrice = 30.0; // Apply 50% discount
        _isCouponApplied = true;
      } else if (_couponController.text == "GIVE10") {
        _totalPrice = 54.0; // Apply $10 discount
        _isCouponApplied = true;
      } else {
        _totalPrice = 60.0; // No discount
        _isCouponApplied = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              // Container with Image
              Container(
                width: double.infinity,
                height: 280.h,
                decoration: BoxDecoration(
                  color: textColor, // Replace with your desired color
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/secLogo.png', // Replace with your logo asset
                    width: 170.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Positioned Cross Button at Top Right
              Positioned(
                top: 30.h, // Adjust the positioning of the cross button
                right: 10.w, // Adjust the positioning of the cross button
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context); // Navigate back when cross is tapped
                  },
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius:
                          BorderRadius.circular(30.r), // Rounded corners
                    ),
                    child: Icon(
                      Icons.close,
                      size: 20.sp, // Adjust the size of the cross button
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          _buildTextField("Book Name", _bookNameController, TextInputType.text,),
          _buildTextField("Customer Name", _bookNameController, TextInputType.text),
          _buildTextField("Delivery address", _bookNameController, TextInputType.text, 4),
          _buildTextField("Price", _bookNameController, TextInputType.number),
          _buildTextField("Coupon code", _bookNameController, TextInputType.number),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Divider(
              color: textColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 45),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    "Total Price",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                Text("\$70",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16.sp)),
              ],
            ),
          ),
          /*     // Coupon Code
          GestureDetector(
            onTap: () {
              setState(() {
                // Toggle between showing the coupon input field
              });
            },
            child: Row(
              children: [
                Text(
                  _isCouponApplied ? "Coupon applied" : "Add Coupon Code",
                  style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                ),
              ],
            ),
          ),
          if (!_isCouponApplied)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _couponController,
                      decoration: InputDecoration(
                        labelText: 'Enter Coupon Code',
                        hintText: 'Enter code (e.g., GIVE50)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _applyCoupon,
                    icon: Icon(Icons.check),
                  ),
                ],
              ),
            ),*/
          Spacer(),
          CustomButton(
              text: "ORDER NOW",
              route: "",
              buttonColor: buttonColor,
              textColor: buttonTextColor),
          SizedBox(height: 50,)
          /*
          ElevatedButton(
            onPressed: () {
              print("Order placed with total price: \$$_totalPrice");
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              "ORDER NOW",
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
          ),*/
        ],
      ),
    );
  }

  Widget _buildTextField(String featureText, TextEditingController controller,
      TextInputType keyboardType,
      [int line = 1]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    featureText,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                ),
                Text(
                  ":",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150.w,
            child: Center(
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.start,
                keyboardType: keyboardType,
                maxLines: line,
                minLines: line,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 2.h, horizontal: 10),
                  focusColor: textColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: textColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: textColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: textColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
