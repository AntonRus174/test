class MyWebViewWidget extends StatefulWidget {
  @override
  _MyWebViewWidgetState createState() => _MyWebViewWidgetState();
}

class _MyWebViewWidgetState extends State<MyWebViewWidget> {
  late ScrollController _scrollController;
  double _fontSize = 20.0;
  double _height = 500.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _scrollController.animateTo(50,
        duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
  }

  void _onScroll() {
    setState(() {
      _fontSize = 20.0 + _scrollController.position.pixels / 10;
      _height = 500.0 - _scrollController.position.pixels / 10;
      
         
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SliverList Example'),
        ),
        body: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // Список цветов
                      final colors = [
                        Colors.red,
                        Colors.green,
                        Colors.blue,
                        Colors.orange,
                        Colors.purple,
                        Colors.yellow,
                        Colors.cyan,
                        Colors.pink,
                        Colors.brown,
                        Colors.grey,
                      ];

                      return Container(
                        height: _height,
                        color: colors[index % colors.length],
                      );
                    },
                    childCount: 10, // Количество элементов в SliverList
                  ),
                ),
              ],
            ),
            Text(
              'data',
              style: TextStyle(fontSize: _fontSize),
            )
          ],
        ),
      ),
    );
  }
}
