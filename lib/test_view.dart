import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double offset = _scrollController.offset;
    double itemHeight = 100; // الارتفاع التقريبي لكل عنصر
    setState(() {
      _currentIndex = (offset / itemHeight).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom ListView')),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: 20,
        itemBuilder: (context, index) {
          bool isActive = index == _currentIndex;
          return Container(
            height: 100,
            color: isActive ? Colors.blue : Colors.grey,
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                  fontSize: isActive ? 24 : 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(home: CustomListView()));
}