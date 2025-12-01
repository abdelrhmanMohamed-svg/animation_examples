import 'package:animation_examples/pages/built_in_explicit_animation.dart';
import 'package:animation_examples/pages/implicit_byTweenAnimation.dart';
import 'package:animation_examples/pages/implicity_built_in_example.dart';
import 'package:animation_examples/pages/lottie_example.dart';
import 'package:animation_examples/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with SingleTickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  final List<Widget> _pages = const [
    LottieExample(),
    ImplicityBuiltInExample(),
    ImplicitBytweenanimation(),
    BuiltInExplicitAnimation(),
  ];

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: _tabController.index == 0
            ? Text('lottie example')
            : _tabController.index == 1
            ? Text("built in implicity example")
            : _tabController.index == 2
            ? Text(
                "implict by tween animation",
                style: TextStyle(color: Colors.white),
              )
            : Text(
                "BuiltInExplicitAnimation",
                style: TextStyle(color: Colors.white),
              ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children: _pages,
          ),
          PageIndicator(
            tabController: _tabController,
            currentPageIndex: _currentPageIndex,
            onUpdateCurrentPageIndex: _updateCurrentPageIndex,
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
