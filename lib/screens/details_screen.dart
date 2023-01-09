import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments
        as Movie; // sacamos la pelicula de los argumentos de la ruta

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        // widgets con comportamiento pre programado cuando se hace scroll en el padre
        _CustomAppBar(title: movie.title, backdrop: movie.fullBackdropPath),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(
            id: movie.heroId!,
              title: movie.title,
              poster: movie.fullPosterImg,
              originalTitle: movie.originalTitle,
              voteAverage: movie.voteAverage.toString(),
              year: movie.releaseDate.substring(0,4)),
          const SizedBox(
            height: 20,
          ),
          _Overview(
            overview: movie.overview,
          ),
          const SizedBox(
            height: 20,
          ),
          CastingCards(movieId: movie.id),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final String title;
  final String backdrop;

  const _CustomAppBar({required this.title, required this.backdrop});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.amber,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            padding: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(backdrop),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final String id;
  final String poster;
  final String title;
  final String originalTitle;
  final String year;
  final String voteAverage;


  const _PosterAndTitle(
      {required this.poster,
      required this.title,
      required this.originalTitle,
      required this.voteAverage, required this.year, required this.id});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                image: NetworkImage(poster),
                placeholder: const AssetImage('assets/no-image.jpg'),
                height: 150,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
              Text(
                originalTitle,
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              
              Text(
                year,
                style: textTheme.subtitle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    voteAverage,
                    style: textTheme.caption,
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final String overview;

  const _Overview({required this.overview});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        overview,
        textAlign: TextAlign.justify,
        style: textTheme.subtitle1,
      ),
    );
  }
}
