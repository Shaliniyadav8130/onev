import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:version1/screens/HomeScreen/HomeScreen.dart';
import 'package:version1/screens/HomeScreen/controller/home_controller.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var controller=Get.put(HomeContoller());

  List<ColorFiltered> unselectedIcons = [
    ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black, // Change the color here
          BlendMode.srcIn,
        ),
        //child:Icon(Icons.home)
      child: SvgPicture.asset(
        "assets/Home.svg",
        width: 24,
        height: 24,
      ),
    ),
    ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black, // Change the color here
          BlendMode.srcIn,
        ),
        //child:Icon(Icons.home)
      child: SvgPicture.asset(
        "assets/Orders.svg",
        width: 24,
        height: 24,
      ),
    ),
    ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black, // Change the color here
          BlendMode.srcIn,
        ),
       // child:Icon(Icons.home)
      child: SvgPicture.asset(
        "assets/Payments.svg",
        width: 24,
        height: 24,
      ),
    ),
    ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black, // Change the color here
          BlendMode.srcIn,
        ),
        //child:Icon(Icons.home)
      child: SvgPicture.asset(
        "assets/Account.svg",
        width: 24,
        height: 24,
      ),
    ),
  ];
  List<ColorFiltered> selectedIcons = [
    ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.grey, // Change the color here
          BlendMode.srcIn,
        ),
        //child:Icon(Icons.home)
      child: SvgPicture.asset(
        "assets/Home.svg",
        width: 24,
        height: 24,
      ),
    ),
    ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black, // Change the color here
          BlendMode.srcIn,
        ),
        //child:Icon(Icons.home)
      child: SvgPicture.asset(
        "assets/Orders.svg",
        width: 24,
        height: 24,
      ),
    ),
    ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black, // Change the color here
          BlendMode.srcIn,
        ),
        //child:Icon(Icons.home)
       child: SvgPicture.asset(
        "assets/Payments.svg",
        width: 24,
        height: 24,
      ),
    ),
    ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black, // Change the color here
          BlendMode.srcIn,
        ),
        //child:Icon(Icons.home)
      child: SvgPicture.asset(
        "assets/Account.svg",
        width: 24,
        height: 24,
      ),
    ),
  ];

  var navbarItem=[
    BottomNavigationBarItem(icon:
    ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.blue, // Change the color here
        BlendMode.dstIn,
      ),
      child: SvgPicture.asset(
        "assets/Home.svg",
        width: 24,
        height: 24,
      ),
    ),
        label: "Home"
    ),
    BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
    BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
    BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),

  ];

  var navBody=[
    HomeScreen(),
    HomeScreen(),
    const HomeScreen(),const HomeScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value),)),
        ],
      ),
      bottomNavigationBar: Obx(()=>
          BottomNavigationBar(currentIndex: controller.currentNavIndex.value,items:
          List.generate(
            navbarItem.length,
                (index) => BottomNavigationBarItem(
              icon: controller.currentNavIndex.value == index
                  ?
              selectedIcons[index]
                  : unselectedIcons[index],
              label: navbarItem[index].label,
            ),
          ),

            backgroundColor: Color(0xffFFC20C),type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            unselectedIconTheme: IconThemeData(color: Colors.black12),
            selectedIconTheme: IconThemeData(
                fill: .8,
                color: Colors.black
            ),
            onTap: (value){
              controller.currentNavIndex.value=value;
            },
            selectedLabelStyle: const TextStyle(),),
      ),
    );;
  }
}
