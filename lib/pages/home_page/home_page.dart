import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/navigation/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      lazyLoad: false,
      routes: const [
        CharacterTab(),
        EpisodeTab(),
        LocationTab(),
      ],
      transitionBuilder: (context, child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              //TODO: двойное нажатие скролл вверх или на лого
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Character'),
              BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Episode'),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Location'),
            ],
          ),
        );
      },
    );
  }
}