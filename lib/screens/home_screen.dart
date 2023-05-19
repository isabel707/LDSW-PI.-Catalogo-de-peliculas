import 'package:flutter/material.dart';
import 'package:my_app/providers/movies_provide.dart';
import 'package:my_app/search/search_delegate.dart';
import 'package:my_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:my_app/login.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Catálogo de películas',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(
                movies: moviesProvider.onDisplayMovies,
              ),
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: "",
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
