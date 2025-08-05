import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexa_carcare_test/theame/palette.dart';

import '../../core/common/list_tile.dart';
import '../../core/common/variables.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});


  List<Map<String, dynamic>> profileOptions = [
    {
      "title": "Personal Information",
      "subTitle": "Change number, email ID, add profile, etc.",
      "icon": Icons.person,
    },
    {
      "title": "My Cart",
      "subTitle": "Manage your cart",
      "icon": Icons.add_shopping_cart,
    },
    {
      "title": "wishlist",
      "subTitle": "see your wishlist",
      "icon": Icons.favorite,
    },
    {
      "title": "My Orders",
      "subTitle": "Track your order",
      "icon": Icons.file_copy,
    },
    {
      "title": "Help and support",
      "subTitle": 'address management for order delivery',
      "icon": Icons.support,
    },
    {
      "title": "Privacy Policy",
      "subTitle": 'address management for order delivery',
      "icon": Icons.file_copy,
    },
    {
      "title": "My Address",
      "subTitle": "Add or update your home and delivery locations",
      "icon": Icons.location_on,
    },
    {
      "title": "Logout",
      "subTitle": "Add or update your home and delivery locations",
      "icon": Icons.logout,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'My Account',
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600
        ),
      ),),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(w*0.06, w*0.03, w*0.06, w*0.06),
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                radius: w * 0.1,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgmtxAycNzJHGjLlCeP03HaJq1AD6uyzp3IQ&s',
                    fit: BoxFit.cover,
                    width: w * 0.2,
                    height: w * 0.2,
                  ),
                ),
              ),

              SizedBox(width: w*0.03,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Fiza Abdullah",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Pallete.blackColor),
                        fontWeight: FontWeight.w600,
                        fontSize: w*0.045
                    ),
                  ),
                  Text("fizaabudu@gmail.com",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Pallete.blackColor),
                        fontWeight: FontWeight.w600,
                      fontSize: w*0.03
                    ),
                  ),
                  Text("+91 83787 12375",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Pallete.blackColor),
                        fontWeight: FontWeight.w600,
                      fontSize: w*0.03
                    ),
                  )
                ],
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.all(w*0.03),
            child:
            Divider(color: Pallete.greyColor, thickness: w*0.002, height: 0),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: profileOptions.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = profileOptions[index];
                return ListTileWidget(
                  leadingIcon: item['icon'],
                  title: item['title'],
                  subTitle: item['subTitle'],
                );
              },
            ),
          ),
          SizedBox(height: w*0.04),

        ]
        ),
      ),
    );

  }
}
