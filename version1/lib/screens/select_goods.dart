import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:version1/screens/ProceedPayment.dart';
import 'package:version1/widgets/ElevatedButtonWidget.dart';
import 'package:version1/widgets/custom_page_route.dart';

class SelectGoodsScreen extends StatefulWidget {
  const SelectGoodsScreen({Key? key}) : super(key: key);

  @override
  State<SelectGoodsScreen> createState() => _SelectGoodsScreenState();
}

class _SelectGoodsScreenState extends State<SelectGoodsScreen> {

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.0),
            ),
          ),
          // You can customize the appearance of your bottom sheet here
          child:
          BottomSheetData(),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
        onTap: () {
           Navigator.of(context).pop(); // This line will navigate back to the previous screen
          },
           child:Icon(Icons.arrow_back),
          ),

        title: Text(
          'Select your Good type',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.91,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0.06,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),

                padding: EdgeInsets.all(20),
                height: context.screenHeight * .8,
                child: ListView.builder(
                    itemCount: 19, itemBuilder: (context, index) {
                  return listItem();
                })

            ),
            Container(
              width: context.screenWidth * .7,
              height: context.screenWidth * .11,
              padding: EdgeInsets.only(bottom:8),
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CustomPageroute(
                      child: ProceedPayment(),
                      direction: AxisDirection.left, // Change the direction as needed
                    ),
                  );
                },
                child: const Text("Update",style: TextStyle(color: Colors.black),),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget listItem() {
    return Column(
      children: [
        Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(title: Text("Timber/ Plywood"),
            tilePadding: EdgeInsets.all(0),
            onExpansionChanged: (bool expanded) {},
            trailing: SizedBox.shrink(),
            expandedAlignment: Alignment.centerLeft,
            children: [
              InkWell(
                onTap: () {
                  _showBottomSheet(context);
                  //
                },
                child: Row(
                  children: [
                    Text(
                      'Quantity : Loose',
                      style: TextStyle(
                        color: Color(0xFF3B3B3B),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(width:4),
                    Icon(Icons.arrow_drop_down),
               ],
                ),

              )
            ],),
        ),
        Divider()
      ],
    );
  }

}

class BottomSheetData extends StatefulWidget {
  const BottomSheetData({Key? key}) : super(key: key);

  @override
  State<BottomSheetData> createState() => _BottomSheetDataState();
}

class _BottomSheetDataState extends State<BottomSheetData> {
  int _value=1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        20.heightBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: "Goods Quantity".text.bold.align(TextAlign.start).black.size(21).make(),
            ),
            ListTile(
              title: Text(
                'Loose',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.91,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,

                ),
              ),
              leading: Radio(
                activeColor: Colors.yellow,
                fillColor: MaterialStateColor.resolveWith((states) =>  Colors.yellow),

                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                },
              ),
            ),
            Container(width: context.screenWidth*.7,
              child: ListTile(
                title: Container(

                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(10) ,color: Colors.grey.shade200,border:Border.all(color: Colors.grey.shade600)),

                  child: TextField(
                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.black,width: 2),
                      ),

                      hintText: 'Enter text',
                      // Remove underline
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),

                  ),
                ),
                leading: Radio(
                  activeColor: Colors.yellow,
                  fillColor: MaterialStateColor.resolveWith((states) =>  Colors.yellow),

                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),

        20.heightBox,
        Container(
          width: context.screenWidth * .7,
          height: context.screenWidth * .11,
          child: ElevatedButton(onPressed: () {
            Navigator.of(context).pop(); // This line will navigate back to the previous screen
          },
            child: Text("Done", style: TextStyle(color: Colors.black),),
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
                backgroundColor: Color(0xFFFFC20C)),),
        ),
        20.heightBox,
      ],
    );

  }
}