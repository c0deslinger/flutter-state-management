import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter_bloc/app/modules/home/controller/counter.dart';

void main() {
  test('increment() should add 1 to the state', () {
    final bloc = Counter(init: 0);
    bloc.increment();
    expect(bloc.state, 1);
  });

  test('increment() should add 1 to the state multiple times', () {
    final bloc = Counter(init: 0);
    bloc.increment();
    bloc.increment();
    bloc.increment();
    expect(bloc.state, 3);
  });

  test('increment() should not change state if emit method is not called', () {
    final bloc = Counter(init: 0);
    expect(bloc.state, 0);
  });
}
