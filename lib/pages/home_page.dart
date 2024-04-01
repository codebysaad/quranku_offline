import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_offline/providers/list_quran_provider.dart';

import '../models/data_quran.dart';
import '../utils/loading_animation.dart';
import '../utils/platform_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() async => context.read<ListQuranProvider>().getQuran(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        transitionBetweenRoutes: false,
      ),
      child: _buildList(),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        'Quran Offline',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  Widget _buildList() {
    final provider = context.read<ListQuranProvider>();
    return FutureBuilder(
      future: provider.getListQuran(),
      builder: (_, AsyncSnapshot<List<Quran>> s) {
        if (s.connectionState == ConnectionState.waiting) {
          return const LoadingAnimation(
            message: 'Loading...',
          );
        }
        final List<Quran> quran = s.requireData;
        return ListView.builder(
          itemCount: quran.length,
          itemBuilder: (context, index) {
            return _buildArticleItem(context, quran[index]);
          },
        );
      },
    );
  }

  Widget _buildArticleItem(BuildContext context, Quran quran) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      // leading: Image.network(
      //   article.urlToImage,
      //   width: 100,
      // ),
      title: Text(quran.name),
      // subtitle: Text(quran.description),
      onTap: () {
        // Navigator.pushNamed(context, ArticleDetailPage.routeName,
        //     arguments: article);
      },
    );
  }
}
