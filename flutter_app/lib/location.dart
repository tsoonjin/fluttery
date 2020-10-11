import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      FavWidget(),
      Text('41'),
    ],
  ),
);

Widget btnSection(BuildContext ctx) {
  final color = Theme.of(ctx).primaryColor;
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBtnColumn(color, Icons.call, 'CALL', context: ctx),
        _buildBtnColumn(color, Icons.near_me, 'ROUTE', context: ctx),
        _buildBtnColumn(color, Icons.share, 'SHARE', context: ctx),
      ]
    )
  );
}

Column _buildBtnColumn(Color color, IconData icon, String label, { @required BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
        }
      ),
      Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color
          )
        )
      )
    ]
  );
}

Widget location(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              child:
              Image.network(
                  'https://picsum.photos/250?image=9',
                  width: 600,
                  height: 240
              )
            ),
            titleSection,
            btnSection(context),
            textSection
          ]
      )
  );
}

class FavWidget extends StatefulWidget {
  @override
  _FavWidgetState createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  bool _isFav = false;

  void _toggleFavorite() {
    setState(() {
      _isFav = !_isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFav ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }
}


