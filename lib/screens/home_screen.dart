import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/search/search_delegate.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context,
        listen: true); // listen notifica cambios y llama a redibujar

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cines'),
          actions: [
            IconButton(
                onPressed: () => showSearch(
                      context: context, 
                      delegate: MovieSearchDelegate()),
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),

              // slider de peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares', //opcional
                onNextPage: moviesProvider.getPopularMovies,
              ),
            ],
          ),
        ));
  }
}
