import 'package:flutter/material.dart';



class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,
      child: ListView.builder(
        itemCount: 10,
        
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _CastCard();
        },
      ),
    );
  }
}

class _CastCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://bia.placeholder.com/150x300'),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
            ),
        ),
        SizedBox(height: 5,),
        Text('actor.name akdjfntfgyhjnkjfn gfb', maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
      ]),
    );
  }
}