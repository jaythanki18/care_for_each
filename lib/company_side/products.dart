import 'package:care_for_each/company_side/new_product.dart';
import 'package:care_for_each/company_side/product_detail.dart';
import 'package:flutter/material.dart';
import 'company_profile.dart';
import 'package:sizer/sizer.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final items=['Select Category','Mobile Application','Digital Marketing','Customized Software','Man Power','Hello 2'];
  String? selectedItem='Select Category';

  List<String> list2=['Select Subcategory'];
  String? list2item='Select Subcategory';

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
          "Products",
          style: TextStyle(color: Color.fromRGBO(9, 31, 87, 1)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
              },
              icon: Icon(Icons.account_circle_sharp),
              color: Color.fromRGBO(9, 31, 87, 1)
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewProduct()));
        },
        backgroundColor: Color.fromRGBO(12,25,71,1),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.46.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5.92.h,
                    width: 36.92.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.18.h),
                      border: Border.all(
                          color: Colors.teal,width: 2),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedItem,
                      items: items.map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item,style: TextStyle(color: Colors.black,fontSize: 10),),
                      )
                      ).toList(),
                      onChanged: (item)=>setState(()=>selectedItem=item),
                    ),
                  ),
                  SizedBox(width: 1.36.h,),
                  Container(
                    width: 36.92.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.18.h),
                      border: Border.all(
                          color: Colors.teal,width: 2),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: list2item,
                      items: list2.map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item,style: TextStyle(color: Colors.black,fontSize: 10),),
                      )
                      ).toList(),
                      onChanged: (item)=>setState(()=>list2item=item),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.01.h,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 14.92.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.33.w,vertical: 3.33.w),
                    child: Row(
                      children: [
                        Image.asset('assets/product_photo.png',height: 25.64.w,width: 25.64.w,),
                        SizedBox(width: 3.33.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Code : slu655',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Stock : 967',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Description : ciuvqwertyuiop',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Price : ₹ 210343',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.01.h,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 14.92.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.33.w,vertical: 3.33.w),
                    child: Row(
                      children: [
                        Image.asset('assets/product_photo.png',height: 25.64.w,width: 25.64.w,),
                        SizedBox(width: 3.33.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Code : slu655',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Stock : 967',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Description : ciuvqwertyuiop',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Price : ₹ 210343',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 17,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 14.92.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.33.w,vertical: 3.33.w),
                    child: Row(
                      children: [
                        Image.asset('assets/product_photo.png',height: 25.64.w,width: 25.64.w,),
                        SizedBox(width: 3.33.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Code : slu655',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Stock : 967',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Description : ciuvqwertyuiop',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Price : ₹ 210343',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 17,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 14.92.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.33.w,vertical: 3.33.w),
                    child: Row(
                      children: [
                        Image.asset('assets/product_photo.png',height: 25.64.w,width: 25.64.w,),
                        SizedBox(width: 3.33.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Code : slu655',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Stock : 967',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Description : ciuvqwertyuiop',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Price : ₹ 210343',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 17,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.25.w),
                shadowColor: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 14.92.h,
                  width: 79.74.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.36.h),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(62, 86, 115, 0.2),
                        Color.fromRGBO(184, 184, 184, 0.1)
                      ])
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.33.w,vertical: 3.33.w),
                    child: Row(
                      children: [
                        Image.asset('assets/product_photo.png',height: 25.64.w,width: 25.64.w,),
                        SizedBox(width: 3.33.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name : yugd',style: TextStyle(fontSize: 9.09.sp,fontWeight:FontWeight.bold,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Code : slu655',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Stock : 967',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Description : ciuvqwertyuiop',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                            Text('Price : ₹ 210343',style: TextStyle(fontSize: 9.09.sp,color: Color.fromRGBO(12,25,71,1)),overflow: TextOverflow.ellipsis,maxLines: 1),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
