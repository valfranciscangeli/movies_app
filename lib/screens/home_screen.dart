import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context,
        listen: true); // listen notifica cambios y llama a redibujar

    print(moviesProvider.ondisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cines'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children:  [
              // principales
              CardSwiper(movies: moviesProvider.ondisplayMovies),

              // slider de peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares', //opcional
                
                ),
            ],
          ),
        ));
  }
}
