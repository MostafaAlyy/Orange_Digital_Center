abstract class ODCStates {}

class ODCInitialState extends ODCStates {}

class CounterIncState extends ODCStates {}

class CounterDECState extends ODCStates {}

class ShowPassState extends ODCStates {}

class ODCILoginLoadinState extends ODCStates {}

class ODCILoginSucsessState extends ODCStates {
  String message;
  ODCILoginSucsessState(this.message);
}

class ODCILoginEroreState extends ODCStates {
  String message;
  ODCILoginEroreState(this.message);
}

class ODCIRegsterLoadinState extends ODCStates {}

class ODCIRegsterSucsessState extends ODCStates {
  String message;
  ODCIRegsterSucsessState(this.message);
}

class ODCIRegsterEroreState extends ODCStates {
  String message;
  ODCIRegsterEroreState(this.message);
}


class ODCIChangeSelectedGenderState extends ODCStates {}
