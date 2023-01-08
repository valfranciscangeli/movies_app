import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          // widgets con comportamiento pre programado cuando se hace scroll en el padre
          _CustomAppBar(),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.amber,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text('movie.title', style:  TextStyle(fontSize: 16),)),
        background: FadeInImage(placeholder: AssetImage('assets/loading.gif'),
        image: NetworkImage('https://via.placeholder.com/500x300'),
        fit: BoxFit.cover,),
      ),
    );
  }
}
