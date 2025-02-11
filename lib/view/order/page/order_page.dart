import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  double _totalPrice = 60.0; // Price after discount (initial price without coupon)

  // Function to apply coupon and update the price
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(height: 50.h,),
          _buildTextField("Book Name" , _bookNameController , TextInputType.text),
          _buildTextField("Customer Name" , _bookNameController , TextInputType.text),
          _buildTextField("Book Name" , _bookNameController , TextInputType.text),
          _buildTextField("Book Name" , _bookNameController , TextInputType.text),


          Row(
            children: [
              Text("Price: \$70", style: TextStyle(fontSize: 18.sp)),
            ],
          ),
          SizedBox(height: 20.h),

          // Coupon Code
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
            ),
          SizedBox(height: 20.h),

          // Total Price
          Row(
            children: [
              Text("Total Price: \$$_totalPrice", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 30.h),

          // Order Now Button
          ElevatedButton(
            onPressed: () {
              // Handle order submission
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
          ),
        ],
      ),
    );
  }
  Widget _buildTextField(String featureText, TextEditingController controller,TextInputType keyboardType) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width : 150,
                  child: Text(
                    featureText,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                ),
                Text(
                  ":",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
            width: 139.w,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                focusColor: textColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: textColor),
                ),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: textColor),
                ) ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: textColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
