import 'package:care_for_each/API/EmployeeSide/add_to_cart_API.dart';
import 'package:care_for_each/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../API/EmployeeSide/product_display_API.dart';
import 'cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.pid}) : super(key: key);

  final String pid;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  String? getName;
  String? getCName;
  void getData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      getName=sharedPreferences.getString("email")!;
      getCName=sharedPreferences.getString("c_email")!;
    });
    print(getName);
    print(getCName);
  }
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
  String item_price="";


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
          FutureBuilder(
              future: EmpProductDisplayAPI().products(getCName,getName,widget.pid," "," "),
              builder: (BuildContext context, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return  Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.server!.length,
                        itemBuilder: (context,index){
                          item_price=snapshot.data!.server![index].price.toString();

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 32.70.h ,
                                    width: 73.84.w,
                                    child: PageView.builder(
                                      physics: BouncingScrollPhysics(),
                                        onPageChanged: (index){
                                          setState(() {
                                            currentIndex=index;
                                          });
                                        },
                                        itemCount: 4, itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: 276,
                                        width: double.infinity,
                                        child: Image.network(snapshot.data!.server![index].pphoto.toString(),errorBuilder: (context, error, stackTrace) => SizedBox(height: 276,child: Container(color: Colors.grey,),)),
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
                                        Text(snapshot.data!.server![index].pname.toString(),style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 11.37.sp,fontWeight: FontWeight.bold),),
                                        //Text("Men Slim Fit Solid Cut Away Collar Casual Jacket.",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 9.09.sp,fontWeight: FontWeight.bold),),
                                        Text("Product Code : ${snapshot.data!.server![index].pcode.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 11.37.sp,fontWeight: FontWeight.bold)),
                                        Row(
                                          children: [
                                            Text("Quantity : ",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 11.37.sp,fontWeight: FontWeight.bold)),
                                            SizedBox(
                                              height: 2.5.h,
                                              child: FloatingActionButton(
                                                elevation: 3,
                                                backgroundColor: Colors.red,
                                                onPressed: _decrementCount,
                                                child: Icon(Icons.remove),
                                              ),
                                            ),
                                            Text("${_count}",style: TextStyle(decoration: TextDecoration.underline),),
                                            SizedBox(
                                              height: 2.5.h,
                                              child: FloatingActionButton(
                                                elevation: 3,
                                                onPressed: _incrementCount,
                                                child: Icon(Icons.add),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text("Price : ${snapshot.data!.server![index].price.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 11.37.sp,fontWeight: FontWeight.bold)),
                                        Text("Description : ${snapshot.data!.server![index].pdesc.toString()}",style: TextStyle(color: Color.fromRGBO(12,25,71,1),fontSize: 11.37.sp,fontWeight: FontWeight.bold)),

                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          );
                        },

                      )
                  );
                }
                else{
                  return Text("No data");
                }
              }
          ),
          Container(
            child: Center(
              child: Container(
                width: 77.94.w,
                height: 5.92.h,
                child: ElevatedButton(
                    onPressed: () {
                      print(_count);
                      print(item_price);
                      FutureBuilder(
                        future: AddToCartAPI().products(getName, widget.pid,_count.toString(), item_price),
                        builder: (context,snapshot2){
                          return Text(snapshot2.data!.server![0].status.toString());
                        },

                      );
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
