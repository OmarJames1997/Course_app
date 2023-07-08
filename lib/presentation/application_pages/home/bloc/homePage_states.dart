class HomePageStates{
  int index;

  HomePageStates({this.index=0});

  HomePageStates copywith({int? index}){
    return HomePageStates(
      index: index??this.index,
    );
  }


}

