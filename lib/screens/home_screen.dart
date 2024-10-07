import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lati_marvel/helpers/funcations_helper.dart';

import 'package:lati_marvel/models/movie_model.dart';
import 'package:lati_marvel/providers/movies_provider.dart';
import 'package:lati_marvel/services/api.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<MovieModel> movies = [];
  Api api = Api();
  fetchMovies() {
    setState(() {
      isLoading = true;
    });
    api
        .getRequest("https://mcuapi.herokuapp.com/api/v1/movies")
        .then((response) {
      if (response.statusCode == 200) {
        var decodeData = json.decode(response.body)['data'];
        for (var x in decodeData) {
          movies.add(MovieModel.fromJson(x));
        }
        setState(() {});
        print(response.body);
      } else {
        print(response.body);
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<MoviesProvider>(builder: (context, movieConsumer, child) {
      return Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
              title: Image.asset(
                "assets/InvertedLogo.png",
                width: getSize(context).width * 0.2,
              ),
              actions: [
                CustomIconButtom(
                  asset: "assets/icons/FavoriteButton.png",
                  onTap: () {},
                ),
                CustomIconButtom(
                  asset: "assets/icons/InboxIcon.png",
                  onTap: () {},
                ),
              ]),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: movies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(children: [
                        Image.network(
                          movies[index].coverUrl,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black87, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                        ),
                      ]),
                    );
                  }));
    });
  }
}

class CustomIconButtom extends StatelessWidget {
  const CustomIconButtom({super.key, required this.asset, required this.onTap});
  final String asset;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        asset,
        width: 24,
        height: 24,
      ),
    );
  }
}
