import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: HeaderSearchBar(),
              floating: true,
            ),
            // SliverToBoxAdapter(
            //   child: _searchBar(),
            // ),
            SliverToBoxAdapter(
              child: _tagsRow(),
            ),
            SliverGrid(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 3,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                pattern: [
                  QuiltedGridTile(2, 1),
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ],
              ),
              delegate:
                  SliverChildBuilderDelegate(childCount: 17, (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/item$index.png',
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 10),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _searchBar() {
  //   return Container(
  //     height: 46,
  //     margin: EdgeInsets.only(top: 20),
  //     decoration: BoxDecoration(
  //       color: Color(0xff272B40),
  //       borderRadius: BorderRadius.circular(13),
  //     ),
  //     child: Row(
  //       children: [
  //         SizedBox(width: 15),
  //         Image.asset('images/search_icon.png'),
  //         SizedBox(width: 10),
  //         Expanded(
  //           child: TextField(
  //             decoration: InputDecoration(
  //               border: InputBorder.none,
  //               hintText: 'Search...',
  //               contentPadding: EdgeInsets.only(bottom: 8.0),
  //               hintStyle: TextStyle(
  //                 fontFamily: 'GB',
  //                 color: whitColor,
  //                 fontSize: 12,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Image.asset('images/scan.png'),
  //         SizedBox(width: 10),
  //       ],
  //     ),
  //   );
  // }

  Widget _tagsRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  color: Color(0xff272B40),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Text(
                  'MiladRF $index',
                  style: TextStyle(
                    color: whitColor,
                    fontSize: 10,
                    fontFamily: 'GB',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HeaderSearchBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Color(0xff272B40),
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
                hintText: 'Search...',
                contentPadding: EdgeInsets.only(bottom: 8.0),
                hintStyle: TextStyle(
                  fontFamily: 'GB',
                  color: whitColor,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Image.asset('images/scan.png'),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 66;

  @override
  double get minExtent => 66;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
