import 'package:design_application/config/size/size_config.dart';
import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _MainScroll(),
        Positioned(
          bottom: 0,
          right: 0,
          child: _ButtonNewList(),
          ),
        ]),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final blockSizeVertical = SizeConfig().blockSizeVertical;


    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: blockSizeVertical * 17,
            maxHeight: blockSizeVertical * 21,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Title(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: blockSizeVertical * 15)
          ]),
        ),
      ],
    );
  }
}

class _ButtonNewList extends StatelessWidget {
    final double blockSizeVertical = SizeConfig().blockSizeVertical;
    final double screenHeight = SizeConfig().screenHeight;
    final double screenWidth = SizeConfig().screenWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.1,
      width: screenWidth * 0.8,
      child: customButton(),
      );
  }

  Widget customButton() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
      child: Material(
        color: const Color(0xffed6762),
        child: InkWell(
          onTap: () {},
          child:  Center(child: Text('CREATE NEW LIST', 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, 
            fontSize: blockSizeVertical*2.5,
            letterSpacing: 2
            ),
            )
            ),
        ),
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => minHeight > maxHeight ? minHeight : maxHeight;

  @override
  double get minExtent => maxHeight > minHeight ? maxHeight : minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
final double blockSizeVertical = SizeConfig().blockSizeVertical;
final double blockSizeHorizontal = SizeConfig().blockSizeHorizontal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: blockSizeVertical * 3),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: blockSizeVertical * 4, vertical: blockSizeVertical * 1.5),
          child: Text(
            'New',
            style: TextStyle(color: const Color(0xff532128), fontSize: blockSizeVertical * 5),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 85,
            ),
            Positioned(
              bottom: blockSizeVertical * 1.3,
              child: Container(
                width: blockSizeHorizontal * 14,
                height: blockSizeVertical * 0.8,
                decoration: BoxDecoration(
                  color: const Color(0xffF7CDD5),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Text(
              'List',
              style: TextStyle(
                color: const Color(0xffd93a30),
                fontSize: blockSizeVertical * 5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String text;
  final Color color;

  const _ListItem(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    final blockSizeVertical = SizeConfig().blockSizeVertical;

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(blockSizeVertical * 3),
      height: blockSizeVertical * 13,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold, 
          fontSize: blockSizeVertical * 2.5),
      ),
    );
  }
}
