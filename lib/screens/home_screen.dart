import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:news/bloc/news_bloc.dart';
import 'package:news/widgets/custom_app_bar.dart';
import 'package:news/widgets/drawer_menu.dart';
import '../helpers/const_helper.dart';
import 'package:news/widgets/news_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final NewsBloc bloc;
  late final GlobalKey<ScaffoldState> _key;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NewsState>(
        stream: bloc.state,
        builder: (context, snapshot) {
          return Scaffold(
            key: _key,
            drawer: DrawerMenu(
              onTap: (String country) {
                bloc.action.add(GetNewsEvent(country: country));
              },
              index: bloc.index,
            ),
            appBar: CustomAppBar(
              onTap: () {
                bloc.action.add(GetNewsEvent(
                    country: ConstHelper.cities.keys.toList()[bloc.index]));
              },
            ),
            backgroundColor: Colors.black,
            body: snapshot.hasData && snapshot.data!.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : snapshot.hasData && snapshot.data!.newsList.isNotEmpty
                    ? ListView.builder(
                        itemCount: snapshot.data!.newsList.length,
                        itemBuilder: (context, i) {
                          return NewsWidget(news: snapshot.data!.newsList[i]);
                        },
                      )
                    : const Center(
                        child: Text(
                          ConstHelper.dataErrorMessage,
                          style: ConstHelper.drawerActiveStyle,
                        ),
                      ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    bloc = NewsBloc();
    _key = GlobalKey();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _key.currentState!.openDrawer();
    });
    bloc.action.add(
        GetNewsEvent(country: ConstHelper.cities.keys.toList()[bloc.index]));
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
