import 'package:flutter/material.dart';

BottomNavigationBar myBottomNavigationBar(cubit) => BottomNavigationBar(
      currentIndex: cubit.currentIndex,
      onTap: (index) {
        // setState(() {
        //   cubit.changeIndex(index);
        // });
        print(cubit.currentIndex);
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[300]!,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: cubit.titles[cubit.currentIndex],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.post_add_outlined),
          label: cubit.titles[cubit.currentIndex],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: cubit.titles[cubit.currentIndex],
        ),
      ],
    );
