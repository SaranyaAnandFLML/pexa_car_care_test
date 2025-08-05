import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexa_carcare_test/theame/palette.dart';

import '../../core/common/variables.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  final TextEditingController searchController = TextEditingController();
  final List<String>countries = [
    'India',
    'United States',
    'Canada',
    'Brazil',
    'Argentina',
    'France',
    'Germany',
    'italy',
    'China',
    'Nepal',
    'test1',
    'test2',
    'test3',
    'test4',
    'test5',
    'test6',
    'test7',
    'test8',
    'test9',
    'test10',
  ];
   List<String>filteredCountries = [];

  @override
  void initState() {
    super.initState();
    filteredCountries = List.from(countries); // Initial load
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    log('111');
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredCountries = countries
          .where((country) => country.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Country List',
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600
        ),
      ),),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(w*0.06, w*0.03, w*0.06, w*0.06),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w*0.03),
              ),
              child:  TextField(
                controller: searchController,
                decoration:  InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search country',
                  icon: const Icon(Icons.search),
                  suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                  icon:  Icon(Icons.clear,color: Pallete.greyColor,size: w*0.05,),
                  onPressed: () {
                    searchController.clear();
                  },
                )
                    : null,
                ),
              ),
            ),
            Expanded(
              child: filteredCountries.isNotEmpty
                  ? ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredCountries[index]),
                  );
                },
              )
                  :  Center(
                child: Text(
                  'No country found.',
                  style: TextStyle(color: Colors.grey,fontSize: w*0.04),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
