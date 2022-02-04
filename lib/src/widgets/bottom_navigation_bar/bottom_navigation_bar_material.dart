import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class BottomNavigationBarMaterial extends StatefulWidget {
  final Function(int, String)? onItemTapped;
  final int intSelectedIndex;
  final List<Widget>? widgetOptions;
  const BottomNavigationBarMaterial(
      {Key? key,
      this.onItemTapped,
      this.intSelectedIndex = -1,
      this.widgetOptions})
      : super(key: key);

  @override
  State<BottomNavigationBarMaterial> createState() =>
      _BottomNavigationBarMaterialState(
          selectedIndexTemp: this.intSelectedIndex,
          widgetOptionsTemp: this.widgetOptions);
}

/// This is the private State class that goes with BottomNavigationBarMaterial.
class _BottomNavigationBarMaterialState
    extends State<BottomNavigationBarMaterial> {
  int selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Studio',
      style: optionStyle,
    ),
    Text(
      'Index 1: Category',
      style: optionStyle,
    ),
    Text(
      'Index 2: Explore',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  double fontSize = 18;
  Map<String, dynamic> homeBottomNavigationBar =
      MainAppBloc.configTheme["homeBottomNavigationBar"];
  Map<String, dynamic> setting = MainAppBloc.configTheme["setting"];

  Color backgroundColor = Colors.white;
  Color activeIconColor = Colors.blue;
  Color deActiveIconColor = Colors.blueGrey;
  TextStyle activeMenuTextStyle = TextStyle(fontSize: 12, color: Colors.blue);
  TextStyle deActiveMenuTextStyle =
      TextStyle(fontSize: 12, color: Colors.blueGrey);
  double elevation = 0;
  int bottomMenuType = 0;

  List<BottomNavigationBarItem> menuItem = <BottomNavigationBarItem>[];
  List<dynamic> menuItemTemp = [];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    String menuPageId = menuItemTemp[selectedIndex]["menuPageId"];
    widget.onItemTapped?.call(selectedIndex, menuPageId);
  }

  _BottomNavigationBarMaterialState(
      {int selectedIndexTemp = -1, List<Widget>? widgetOptionsTemp}) {
    //Set values from jason file
    backgroundColor = homeBottomNavigationBar.containsKey("backgroundColor")
        ? Color(int.parse(homeBottomNavigationBar["backgroundColor"]))
        : backgroundColor;
    activeIconColor = homeBottomNavigationBar.containsKey("activeIconColor")
        ? Color(int.parse(homeBottomNavigationBar["activeIconColor"]))
        : activeIconColor;
    deActiveIconColor = homeBottomNavigationBar.containsKey("deActiveIconColor")
        ? Color(int.parse(homeBottomNavigationBar["deActiveIconColor"]))
        : deActiveIconColor;
    if (homeBottomNavigationBar.containsKey("deActiveMenuTextStyle")) {
      deActiveMenuTextStyle.copyWith(
          color: Color(int.parse(
              homeBottomNavigationBar["deActiveMenuTextStyle"]["color"])),
          fontSize: homeBottomNavigationBar["deActiveMenuTextStyle"]["fontSize"]
              .toDouble());
    }
    if (homeBottomNavigationBar.containsKey("activeMenuTextStyle")) {
      activeMenuTextStyle.copyWith(
          color: Color(int.parse(
              homeBottomNavigationBar["activeMenuTextStyle"]["color"])),
          fontSize: homeBottomNavigationBar["activeMenuTextStyle"]["fontSize"]
              .toDouble());
    }

    if (homeBottomNavigationBar.containsKey("elevation")) {
      elevation = homeBottomNavigationBar["elevation"];
    }
    if (homeBottomNavigationBar.containsKey("bottomMenuType")) {
      bottomMenuType = homeBottomNavigationBar["bottomMenuType"];
    }

    if (homeBottomNavigationBar.containsKey("menu_item")) {
      menuItemTemp = homeBottomNavigationBar["menu_item"];
      menuItem = [];
      menuItemTemp.map((values) {
        menuItem.add(BottomNavigationBarItem(
          icon: Icon(
              IconData(int.parse(values["icon"]), fontFamily: 'MaterialIcons')),
          label: values["label"],
          backgroundColor: Color(int.parse(values["backgroundColor"])),
        ));
      }).toList();
    }
    if (selectedIndexTemp > 0) {
      this.selectedIndex = selectedIndexTemp;
    }
    if (widgetOptionsTemp != null) {
      _widgetOptions = widgetOptionsTemp;
    }
    /*menuItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: backgroundColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_box),
        label: 'Category',
        backgroundColor: backgroundColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Studio',
        backgroundColor: backgroundColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'Explore',
        backgroundColor: backgroundColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Profile',
        backgroundColor: backgroundColor,
      ),
    ];*/
  }
  @override
  void didUpdateWidget(covariant BottomNavigationBarMaterial oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.intSelectedIndex > 0) {
      setState(() {
        selectedIndex = widget.intSelectedIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.length > selectedIndex
            ? _widgetOptions.elementAt(selectedIndex)
            : Container(
                child: Text(
                  'User development',
                  style: optionStyle,
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: menuItem,
        elevation: elevation,
        type: bottomMenuType == 0
            ? BottomNavigationBarType.fixed
            : BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        // fixedColor: backgroundColor,
        currentIndex: selectedIndex,
        selectedItemColor: activeIconColor,
        unselectedItemColor: deActiveIconColor,
        selectedLabelStyle: activeMenuTextStyle,
        unselectedLabelStyle: deActiveMenuTextStyle,
        onTap: _onItemTapped,
      ),
    );
  }
}
