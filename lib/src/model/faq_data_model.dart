//raw drawer data

class DrawerDataModel {
  List<DrawerMenu> drawerMenuList = [];
}

class DrawerMenu{
  String? title;
  List<DrawerSubMenu>  menuSubList = [];


  DrawerMenu({this.title,menuSubList}){
    if (menuSubList != null) {
      //   this.menuSubList.add(menuSubList);
      for (var i = 0; i < menuSubList.length; i++) {
        this.menuSubList.add(menuSubList[i]);
      }

    }
  }

}
class DrawerSubMenu{
  String? title;
  List<DrawerSubMenuChild>  menuSubList = [];

  DrawerSubMenu({this.title,menuSubList}){
    if (menuSubList != null) {
      //   this.menuSubList.add(menuSubList);
      for (var i = 0; i < menuSubList.length; i++) {
        this.menuSubList.add(menuSubList[i]);
      }

    }
  }

}

class DrawerSubMenuChild{
  String? title;
  //List<DrawerSubMenuChild>  menuSubList = [];


  DrawerSubMenuChild({this.title});

}
