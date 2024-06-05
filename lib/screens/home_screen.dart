import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram_flutter/widgets/home_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: _getAppBar(),
      body: _getBody(context),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Image(
          image: AssetImage('images/home_appbar_logo.png'),
        ),
      ),
      backgroundColor: blackColor,
      actions: [
        IconButton(
          padding: EdgeInsets.only(right: 17),
          onPressed: () {},
          icon: Image.asset('images/home_appbar_icon.png'),
        )
      ],
    );
  }

  Widget _getBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: UnconstrainedBox(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  barrierColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: HomeBottomSheet(),
                    );
                  },
                );
              },
              child: Text(
                'Bottom Sheet',
                style: TextStyle(
                  color: whitColor,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 30),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _storyList(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 17, right: 17, top: 20, bottom: 18),
                child: Column(
                  children: [
                    _postHeader(),
                    SizedBox(height: 23),
                    _postContent(),
                  ],
                ),
              );
            },
            childCount: 5,
          ),
        ),
      ],
    );
  }

  Widget _storyList() {
    return Container(
      height: 114,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0 ? _addStoryBox() : _usersStoryBox();
        },
      ),
    );
  }

  Widget _addStoryBox() {
    return Padding(
      padding: EdgeInsets.only(left: 17, right: 10, bottom: 12, top: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: blackColor,
              border: Border.all(
                color: whitColor,
                width: 2,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: Image.asset('images/story_logo.png'),
          ),
          SizedBox(height: 10),
          Text(
            'Your Story',
            style: TextStyle(
              color: whitColor,
              fontSize: 10,
              fontFamily: 'GM',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _usersStoryBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            color: pinkColor,
            dashPattern: [5, 2],
            strokeWidth: 2,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(3),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('images/story_image.png'),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Test',
            style: TextStyle(
              color: whitColor,
              fontSize: 10,
              fontFamily: 'GM',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _postList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 18),
          child: Column(
            children: [
              _postHeader(),
              SizedBox(height: 23),
              _postContent(),
            ],
          ),
        );
      },
    );
  }

  Widget _postHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          color: pinkColor,
          dashPattern: [10, 5],
          strokeWidth: 2,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage('images/switch_account_user.png'),
              width: 38,
              height: 38,
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'amirahmadadibi',
              style:
                  TextStyle(color: whitColor, fontSize: 12, fontFamily: 'GB'),
            ),
            SizedBox(height: 5),
            Text(
              'امیراحمد برنامه‌نویس موبایل',
              style:
                  TextStyle(color: whitColor, fontSize: 12, fontFamily: 'SM'),
            ),
            SizedBox(height: 7),
          ],
        ),
        Spacer(),
        Image.asset('images/more_icon.png')
      ],
    );
  }

  Widget _postContent() {
    return Container(
      height: 383,
      width: 394,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage('images/post_image.png'),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Image.asset('images/video_icon.png'),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  width: 300,
                  height: 46,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/heart_icon.png'),
                          SizedBox(width: 6),
                          Text(
                            '2.6 K',
                            style: TextStyle(
                              color: whitColor,
                              fontFamily: 'GB',
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('images/comment_icon.png'),
                          SizedBox(width: 5),
                          Text(
                            '1.5 K',
                            style: TextStyle(
                              color: whitColor,
                              fontFamily: 'GB',
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Image.asset('images/send_icon.png'),
                      Image.asset('images/save_icon.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
