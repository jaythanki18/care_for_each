import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'cart.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  void _incrementCount(){
    setState(() {
      _count++;
    });
  }

  void _decrementCount(){
    setState(() {
      _count--;
    });
  }

  int currentIndex=0;
  int _count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(9, 31, 87, 1),
                size: 30, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Product Details",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(Icons.shopping_cart),
            color: Color.fromRGBO(9, 31, 87, 1),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 32.70.h ,
                width: 73.84.w,
                child: PageView.builder(
                  onPageChanged: (index){
                    setState(() {
                      currentIndex=index;
                    });
                  },
                    itemCount: 4, itemBuilder: (context, index) {
                      return SizedBox(
                        height: 276,
                        width: double.infinity,
                        child: Image.asset("assets/product_photo.png"),
                      );
                }
                ),
              ),
              SizedBox(height: 2.36.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(var i=0;i<4;i++)
                    buildIndicator(currentIndex==i),
                ],
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 14.10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.36.h,),
                    Text("HIGHLANDER",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 11.37.sp,fontWeight: FontWeight.bold),),
                    Text("Men Slim Fit Solid Cut Away Collar Casual Jacket.",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp,fontWeight: FontWeight.bold),),
                    Text("Product Code : rtx34",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 11.37.sp,fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text("Quantity : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 11.37.sp,fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                          child: FloatingActionButton(
                            elevation: 3,
                            backgroundColor: Colors.red,
                            onPressed: _decrementCount,
                            child: Icon(Icons.remove),
                          ),
                        ),
                        Text("${_count}",style: TextStyle(decoration: TextDecoration.underline),),
                        SizedBox(
                          height: 2.36.h,
                          child: FloatingActionButton(
                            elevation: 3,
                            onPressed: _incrementCount,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    Text("Price : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 11.37.sp,fontWeight: FontWeight.bold)),
                    Text("Description : LoremIpsumLoremIpsum",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 11.37.sp,fontWeight: FontWeight.bold)),

                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Center(
              child: Container(
                width: 77.94.w,
                height: 5.92.h,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.teal,),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shadowColor: Colors.white,
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.teal,
                        ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildIndicator(bool isSelected){
  return Row(
    children: [
      SizedBox(width: 5,),
      Container(
        height: isSelected ? 10 : 5,
        width: isSelected ? 10 : 5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blue : Color.fromRGBO(174, 174, 174, 1)
        ),
      ),
    ],
  );
}
