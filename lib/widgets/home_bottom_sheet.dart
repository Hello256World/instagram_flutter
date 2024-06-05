import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_flutter/constants/constants.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.3,
      maxChildSize: 0.7,
      initialChildSize: 0.4,
      builder: (context, scrollController) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 44),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.5),
                    Color.fromRGBO(255, 255, 255, 0.2),
                  ],
                ),
              ),
              child: _buttonContent(scrollController),
              //  GridView.builder(
              //   itemCount: 100,
              //   controller: scrollController,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 4,
              //     crossAxisSpacing: 33,
              //     mainAxisSpacing: 20,
              //   ),
              //   itemBuilder: (context, index) {
              //     return Container(
              //       width: 86,
              //       color: Colors.red,
              //     );
              //   },
              // ),
            ),
          ),
        );
      },
    );
  }

  Widget _buttonContent(ScrollController controller) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            // SliverGrid.builder(
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 4,
            //     crossAxisSpacing: 20,
            //     mainAxisSpacing: 20,
            //   ),
            //   itemBuilder: (context, index) {
            //     return Container(
            //       width: 86,
            //       color: Colors.red,
            //     );
            //   },
            // ),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    width: 67,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GB',
                          fontSize: 24,
                        ),
                      ),
                      Image.asset(
                        'images/download_icon.png',
                      )
                    ],
                  ),
                  SizedBox(height: 28),
                  Container(
                    width: 340,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Image.asset('images/search_icon.png'),
                        SizedBox(width: 10),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              height: 2.04,
                              fontSize: 12,
                              fontFamily: 'GB',
                              color: Colors.white,
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _userToShare();
                },
                childCount: 50,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 11,
                mainAxisSpacing: 5,
                mainAxisExtent: 120,
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 70))
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Send',
              style: TextStyle(
                color: whitColor,
                fontFamily: 'GB',
                fontSize: 16,
              ),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(129, 46),
              elevation: 10.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _userToShare() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage('images/user.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Your Story',
          style: TextStyle(
            fontFamily: 'GB',
            color: whitColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
