import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_z/src/features/Account/screens/AccountScreen.dart';
import 'package:shop_z/src/features/CartScreen/CartScreen.dart';
import 'package:shop_z/src/features/HomePage/cubit/HomePageCubit.dart';
import 'package:shop_z/src/features/HomePage/presentaion/screens/homePage.dart';
import 'package:shop_z/src/features/HomePage/repo/HomePAgeRepo.dart';
import 'package:shop_z/src/services/injectionContainer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    BlocProvider(
      create: (context) => Homepagecubit(getIt<HomePageRepo>()),
      child: const Homepage(),
    ),
    const CartScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_4), label: 'Profile'),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
