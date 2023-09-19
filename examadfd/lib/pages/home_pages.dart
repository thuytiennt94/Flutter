
import 'dart:convert';

import 'package:examadfd/core/constant/color_palatte.dart';
import 'package:examadfd/core/constant/dimension_constant.dart';
import 'package:examadfd/core/extention/text_styles.dart';

import 'package:examadfd/core/helper/ImageHelper.dart';
import 'package:examadfd/widgets/app_bar_container.dart';
import 'package:examadfd/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Place {
  final int id;
  final String thumbnail;
  final String name;
  final int star;

  Place({
    required this.id,
    required this.thumbnail,
    required this.name,
    required this.star,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      thumbnail: json['thumbnail'],
      name: json['name'],
      star: json['star'],
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _HomePageNewState createState() => _HomePageNewState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _HomePageNewState extends State<MyHomePage> {
  Future<List<Place>> fetchData() async {
    try {
      final String url = 'http://10.0.2.2:8888/place';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => Place.fromJson(data)).toList();
      } else {
        throw Exception('Unexpected error occurred!');
      }
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }

  Widget _buildImageHomeScreen(String name, String image) {
    return GestureDetector(
      child: Container(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImageHelper.loadFormAsset(
              image,
              width: double.maxFinite,
              height: 200,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(kItemPadding),
            ),
            const Padding (
              padding: EdgeInsets.all(kDefaultPadding),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.defaultStyle.whiteTextColor,
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Container(
                    padding: const EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFC107),
                        ),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text('4.5')
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: AppBarContainer(
            titleString: 'home',
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kItemPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi guy!', style: TextStyles.defaultStyle.fontHeader.whiteTextColor.bold),
                      const SizedBox(
                        height: kMediumPadding,
                      ),
                      Text(
                        'Where are you going next?',
                        style: TextStyles.defaultStyle.fontCaption.whiteTextColor,
                      )
                    ],
                  )
                ],
              ),
            ),
            implementLeading: false,
            child: Column(
              children: [
                TextField(
                  enabled: true,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'search your destination',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.black,
                        size: 14,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                            kItemPadding
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
                  ),
                  style: TextStyles.defaultStyle,
                  onChanged: (value){},
                  onSubmitted: (String submitValue){},
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFDEA8D),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Center(
                                child: ImageHelper.loadFormAsset(
                                  '../assets/image/ico_hotel.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: kMinPadding),
                              AppText(text: "Hotels"),
                            ],
                          ),
                        ),
                        onTap: () {
                          // Handle the onTap event
                        },
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFFD5B8),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Center(
                                child: ImageHelper.loadFormAsset(
                                  '../assets/image/ico_plane.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: kMinPadding),
                              AppText(text: "Flights"),
                            ],
                          ),
                        ),
                        onTap: () {
                          // Handle the onTap event
                        },
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Center(
                                child: ImageHelper.loadFormAsset(
                                  '../assets/image/ico_hotel_plane.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: kMinPadding),
                              AppText(text: "All"),
                            ],
                          ),
                        ),
                        onTap: () {
                          // Handle the onTap event
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kMediumPadding,
                ),
                Row(
                  children: [
                    Text("Popular destination", style: TextStyles.defaultStyle.bold,),
                  ],
                ),
                const SizedBox(
                  height: kMediumPadding,
                ),

                FutureBuilder<List<Place>>(
                  future: fetchData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Place>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    List<Place> place = snapshot.data!;

                    return Expanded(
                      child: CustomScrollView(
                        primary: false,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: const EdgeInsets.all(0),
                            sliver: SliverGrid.count(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                              children: place
                                  .map(
                                    (e) => _buildImageHomeScreen(
                                  e.name,
                                  e.thumbnail,
                                ),
                              )
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}