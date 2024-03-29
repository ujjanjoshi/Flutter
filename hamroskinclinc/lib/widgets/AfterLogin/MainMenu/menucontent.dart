import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imagesList = [
  'assets/image/Logo1.png',
  'assets/image/image1.jpg',
  'assets/image/image2.png',
  // 'assets/image/image3.png',

  // 'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  // 'https://cdn.pixabay.com/photo/2016/11/18/19/00/breads-1836411_1280.jpg',
  // 'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  // 'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
];
final List<String> titles = [
  ' Coffee ',
  ' Bread ',
  ' Gelato ',
  ' Ice Cream ',
];

class MenuContent extends StatefulWidget {
  const MenuContent({Key? key}) : super(key: key);

  @override
  State<MenuContent> createState() => _MenuContentState();
}

class _MenuContentState extends State<MenuContent> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            // enlargeCenterPage: true,
            //scrollDirection: Axis.vertical,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
          items: imagesList
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 5.0,
                    ),
                    elevation: 5.0,
                    // shadowColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          // Center(
                          //   child: Text(
                          //     '${titles[_currentIndex]}',
                          //     style: TextStyle(
                          //       fontSize: 24.0,
                          //       fontWeight: FontWeight.bold,
                          //       backgroundColor: Colors.black45,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imagesList.map((urlOfItem) {
            // print(urlOfItem);
            int index = imagesList.indexOf(urlOfItem);
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color(0xff2196F3)
                    : Color(0xffD9D9D9),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
