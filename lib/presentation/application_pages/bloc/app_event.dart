abstract class AppEvent{
  const AppEvent();
}

class TriggerAppEvent extends AppEvent{
  // this will grab the value and Assign it App states variable
  final int index;

 const TriggerAppEvent(this.index):super();
}