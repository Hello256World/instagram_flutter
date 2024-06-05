import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_flutter/constants/constants.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, isScroll) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 220,
              backgroundColor: blackColor,
              floating: false,
              stretch: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1.8,
                stretchModes: <StretchMode>[
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                  StretchMode.zoomBackground,
                ],
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color: whitColor,
                    fontFamily: 'GB',
                    fontSize: 25,
                  ),
                ),
                background: Image.asset(
                  'images/item11.png',
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(14),
                child: Container(
                  height: 14,
                  decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                ),
              ),
              toolbarHeight: 80,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 17.0, top: 39),
                  child: Icon(
                    Icons.menu,
                    color: whitColor,
                    size: 25,
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: _headerContent(),
            ),
            SliverPersistentHeader(
              delegate: TabBarHeaderDelegate(),
              pinned: true,
            )
          ];
        },
        body: _nestedBody(),
      ),
    );
  }

  Widget _headerContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: blackColor,
              border: Border.all(
                color: pinkColor,
                strokeAlign: BorderSide.strokeAlignInside,
                width: 2,
              ),
            ),
            child: UnconstrainedBox(
              child: SizedBox(
                width: 62,
                height: 62,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset(
                    'images/user.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          SizedBox(
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'لینوس توروالدز خالق لینوکس',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: whitColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'linustorvalds',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: greyColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/edit.png'),
        ],
      ),
    );
  }

  Widget _nestedBody() {
    return TabBarView(
      children: [
        CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              sliver: SliverGrid(
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  repeatPattern: QuiltedGridRepeatPattern.same,
                  pattern: [
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: 17,
                  (context, index) {
                    return SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/item$index.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
        GridView.custom(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            repeatPattern: QuiltedGridRepeatPattern.same,
            pattern: [
              QuiltedGridTile(1, 1),
              QuiltedGridTile(2, 2),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: 17,
            (context, index) {
              return SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/item$index.png',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: blackColor,
      padding: EdgeInsets.symmetric(horizontal: 17),
      height: 80,
      child: TabBar(
        dividerHeight: 0,
        indicatorColor: pinkColor,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3,
        tabs: [
          Tab(
            icon: Image.asset('images/view.png'),
          ),
          Tab(
            icon: Image.asset('images/saved.png'),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
