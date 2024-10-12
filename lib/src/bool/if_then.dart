extension IfThen on bool {
  bool ifThen(void Function() f) => _if(this, f);

  bool ifNotThen(void Function() f) => _if(!this, f);

  bool _if(bool condition, void Function() f) {
    if (condition) {
      f();
    }

    return this;
  }
}
