import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/constants.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
          SizedBox(
            height: 68,
            child: TabBar(
              controller: _tabController,
              dividerHeight: 0,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 17),
              labelColor: whitColor,
              unselectedLabelColor: greyColor,
              indicatorColor: pinkColor,
              indicatorWeight: 3,
              labelStyle: TextStyle(
                fontFamily: 'GB',
                fontSize: 17,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
              ),
              tabs: [
                Tab(
                  text: 'Following',
                ),
                Tab(
                  text: 'You',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CustomScrollView(
                  slivers: [
                    ..._activityContent('New', 3, ActivityType.like),
                    ..._activityContent('Today', 2, ActivityType.following),
                    ..._activityContent('This Week', 4, ActivityType.message),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    ..._activityContent('New', 3, ActivityType.like),
                    ..._activityContent('Today', 2, ActivityType.following),
                    ..._activityContent('This Week', 4, ActivityType.message),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _activityContent(String title, int count, ActivityType type) {
    return <Widget>[
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 32),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'GB',
              color: whitColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
      SliverList.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: pinkColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/user.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'MiladRF',
                          style: TextStyle(
                            fontFamily: 'GB',
                            fontSize: 12,
                            color: whitColor,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Started following',
                          style: TextStyle(
                            fontFamily: 'GB',
                            fontSize: 12,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'You',
                          style: TextStyle(
                            fontFamily: 'GB',
                            fontSize: 12,
                            color: greyColor,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '3Min',
                          style: TextStyle(
                            fontFamily: 'GB',
                            fontSize: 12,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                _activityStatus(type),
              ],
            ),
          );
        },
      ),
    ];
  }

  Widget _activityStatus(ActivityType type) {
    switch (type) {
      case ActivityType.message:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              color: greyColor,
              fontFamily: 'GB',
              fontSize: 12,
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: BorderSide(
              width: 2,
              color: greyColor,
            ),
          ),
        );
      case ActivityType.following:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(100, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(
              fontFamily: 'GB',
              color: whitColor,
              fontSize: 12,
            ),
          ),
        );
      case ActivityType.like:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'images/item4.png',
              fit: BoxFit.cover,
            ),
          ),
        );
      default:
        return Text('Error');
    }
  }
}

enum ActivityType {
  message,
  like,
  following,
}
