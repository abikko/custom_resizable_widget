import 'package:rxdart/subjects.dart';

abstract class BaseController<T> {
  final BehaviorSubject<T> _subject = BehaviorSubject();

  Stream<T> get stream => _subject.stream;

  void update(T updatedData) {
    if (_subject.isClosed) return;

    _subject.add(updatedData);
  }

  void dispose() {
    _subject.close();
  }
}
