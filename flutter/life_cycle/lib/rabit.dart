class Rabit {
  String? _name;
  RabitState? _state;

  Rabit({required String name, required RabitState state}) {
    _name = name;
    _state = state;
  }
  get name => _name;
  get state => _state;

  updateState(RabitState state) {
    _state = state;
  }
}

enum RabitState { SLEEP, RUN, WALK, EAT }
