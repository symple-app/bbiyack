enum BottomNavigationItemType { home, mission, test, statistics, myPage }

class BottomNavigationManager {
  final String title;
  final String imageAsset;
  final int index;

  BottomNavigationManager({
    required this.title,
    required this.imageAsset,
    required this.index,
  });
}
