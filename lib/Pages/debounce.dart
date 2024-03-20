import 'dart:async';
import 'dart:ui';

class Debounce{

  final int milliseconds;

  Debounce({
    this.milliseconds=500
});

  Timer? timer;

  void run(VoidCallback action){
    if(timer!=null){
      timer!.cancel();
    }
    timer = Timer(Duration(microseconds: milliseconds),action);
  }

}