import 'dart:async';
// Creditos
// https://stackoverflow.com/a/52922130/7834829

class Debouncer<T> {
  Debouncer({required this.duration, this.onValue});

  final Duration duration; // tiempo a esperar antes de emitir un valor

  void Function(T value)? onValue; // funcion que dispara cuando tenga valor

  T? _value;
  Timer? _timer;

  T get value => _value!;

  set value(T val) {
    _value = val;
    _timer?.cancel();
    _timer = Timer(duration, () => onValue!(_value!));
  }
}
