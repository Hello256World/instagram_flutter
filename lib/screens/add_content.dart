import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_flutter/constants/constants.dart';

class AddContent extends StatelessWidget {
  const AddContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Column(
        children: [
          _headerRow(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: SizedBox(
                      height: 375,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'images/item11.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  sliver: SliverGrid.builder(
                    itemCount: 16,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 128,
                        height: 128,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/item$index.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 83,
            width: double.infinity,
            padding: EdgeInsets.only(top: 10, left: 17, right: 17),
            decoration: BoxDecoration(
              color: Color(0xff272B40),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Draft',
                  style: TextStyle(
                    fontFamily: 'GB',
                    fontSize: 16,
                    color: pinkColor,
                  ),
                ),
                Text(
                  'Gallery',
                  style: TextStyle(
                    fontFamily: 'GB',
                    fontSize: 16,
                    color: whitColor,
                  ),
                ),
                Text(
                  'Table',
                  style: TextStyle(
                    fontFamily: 'GB',
                    fontSize: 16,
                    color: whitColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17, top: 32, bottom: 25),
      child: Row(
        children: [
          Text(
            'Post',
            style: TextStyle(
              fontFamily: 'GB',
              color: whitColor,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 15),
          Image.asset('images/arrow.png'),
          Spacer(),
          Text(
            'Next',
            style: TextStyle(
              fontFamily: 'GB',
              color: whitColor,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 15),
          Image.asset('images/next.png')
        ],
      ),
    );
  }
}
