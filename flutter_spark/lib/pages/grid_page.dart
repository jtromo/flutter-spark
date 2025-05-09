import 'package:flutter/material.dart';
import 'package:flutter_spark/common/spark_drawer.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> with TickerProviderStateMixin {
  late List<String> _gridItems;
  late AnimationController _animationController;
  late Animation<double> _fabAnimation;
  late final ScrollController _scrollController;

  bool _visible = true;

  @override
  void initState() {
    super.initState();

    _gridItems = [];
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fabAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );

    _scrollController = ScrollController();
    _scrollController.addListener(_handleScrollUpdate);
  }

  void _handleScrollUpdate() {
    if (_scrollController.position.maxScrollExtent - _scrollController.position.extentAfter >= 20) {
      setState(() {
        _visible = false;
      });
    } else {
      setState(() {
        _visible = true;
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Grid Page"),
      ),
      drawer: const SparkDrawer(),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => {
                // _animationController.forward(),
                setState(() {
                  _gridItems.add("test");
                })
              },
          child: AnimatedIcon(icon: AnimatedIcons.add_event, progress: _fabAnimation)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: AnimatedOpacity(
        // If the widget is visible, animate to 0.0 (invisible).
        // If the widget is hidden, animate to 1.0 (fully visible).
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),

        child: BottomAppBar(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: const CircularNotchedRectangle(),
        ),
      ),
      body: GridView.count(
        controller: _scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        crossAxisCount: 2,
        children: List.generate(_gridItems.length, (index) {
          return Center(
            child: GlassContainer(
              padding: const EdgeInsets.all(8),
              blur: 12,
              linearGradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x00FFFFFF),
                  Color(0xFFFFFFFF),
                ],
                stops: [
                  0.8,
                  1,
                ],
              ),
              child: Center(child: Text(_gridItems[index])),
            ),
          );
        }),
      ),
    );
  }
}
