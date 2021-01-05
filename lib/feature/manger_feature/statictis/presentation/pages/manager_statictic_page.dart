import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:fai_kul/feature/manger_feature/statictis/data/data_sources/remote_statistic_datasourse.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/body/overall_body.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/body/student_body.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/config/palette.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/config/styles.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/statistic/statistic_bloc.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/widgets/principal_drawer.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/widgets/week_chart.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/widgets/custom_app_bar.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/widgets/overall_statistic_gird.dart';
import 'package:fai_kul/feature/top_recorder/presentation/manager/top_recoder/top_recoder_bloc.dart';
import 'package:fai_kul/main/nar_drawer/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';

class ManagerStatisticPage extends StatefulWidget {
  static const routeName = "ManagerStatisticPage";
  @override
  _ManagerStatisticPageState createState() => _ManagerStatisticPageState();
}

class _ManagerStatisticPageState extends State<ManagerStatisticPage> {
  int dayState = 0;
  int roleState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
        drawer: PrincipalDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildStatsTabBar(),
            _buildRegionTabBar(),
            dayState == 0 && roleState == 0 ? ToDayOverall(context) :
            dayState == 0 && roleState == 1 ? Text('ToDay teacher') :
            dayState == 0 && roleState == 2 ? ToDayStudent(context) :
            dayState == 1 && roleState == 0 ? WeekOverall(context) :
            dayState == 1 && roleState == 1 ? Text("Week Teacher") :
            dayState == 1 && roleState == 2 ? WeekStudent(context):Text("Có lỗi xãy ra")
          ],
        ),
      )
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(0),
        child: Text(
          'Thống kê',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }

  DefaultTabController _buildRegionTabBar() {
    return DefaultTabController(
      length: 3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TabBar(
          indicator: BubbleTabIndicator(
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
            indicatorHeight: 40.0,
            indicatorColor: Colors.white,
          ),
          labelStyle: Styles.tabTextStyle,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          tabs: <Widget>[
            Text('Tổng quan'),
            Text("Giáo viên"),
            Text('Học sinh'),
          ],
          onTap: (index) {
            setState(() {
              roleState = index;
            });
          },
        ),
      ),
    );
  }

  Padding _buildStatsTabBar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
        child: DefaultTabController(
          length: 2,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text('Hôm nay'),
              Text('Tuần này'),
            ],
            onTap: (index) {
              print("xxxxxxxxx${index}");
              setState(() {
                dayState = index;
              });
            },
          ),
        ),
    );
  }

  BlocProvider<StatisticBloc> ToDayOverall(BuildContext context) {
    print("StatisticBloc ToDayOverall");
    return BlocProvider(
      create: (_) => sl<StatisticBloc>(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                 OverallBody(id: "ToDayOverall",),
              ],
            ),
          )
        ],
      ),

    );
  }

  BlocProvider<StatisticBloc> TodayTeacher(BuildContext context) {
    print("StatisticBloc TodayTeacher");
    return BlocProvider(
      create: (_) => sl<StatisticBloc>(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                OverallBody(),
              ],
            ),
          )
        ],
      ),

    );
  }

  BlocProvider<StatisticBloc> ToDayStudent(BuildContext context) {
    print("StatisticBloc ToDayStudent");
    return BlocProvider(
      create: (_) => sl<StatisticBloc>(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
               StudentBody(id: "ToDayStudent",)
              ],
            ),
          )
        ],
      ),

    );
  }

  BlocProvider<StatisticBloc> WeekOverall(BuildContext context) {
    print("StatisticBloc WeekOverall");
    return BlocProvider(
      create: (_) => sl<StatisticBloc>(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                OverallBody(id: "WeekOverall",),
              ],
            ),
          )
        ],
      ),

    );
  }

  BlocProvider<StatisticBloc> WeekTeacher(BuildContext context) {
    print("StatisticBloc WeekTeacher");
    return BlocProvider(
      create: (_) => sl<StatisticBloc>(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                OverallBody(),
              ],
            ),
          )
        ],
      ),

    );
  }

  BlocProvider<StatisticBloc> WeekStudent(BuildContext context) {
    print("StatisticBloc WeekStudent");
    return BlocProvider(
      create: (_) => sl<StatisticBloc>(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                StudentBody(id: "WeekStudent",)
              ],
            ),
          )
        ],
      ),

    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
