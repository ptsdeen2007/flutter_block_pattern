import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
class MainBlock{
  int _count=0;
  BehaviorSubject<int> _subjectCounter;

  MainBlock(){
    _subjectCounter=BehaviorSubject<int>();
    _subjectCounter.sink.add(_count);
  }

  Observable<int> get subjectCounterObservable => _subjectCounter.stream;

  void increment(){
    _subjectCounter.add(_count++);
  }


  void dispose(){
    _subjectCounter.close();
  }
}