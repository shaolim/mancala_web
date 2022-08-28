enum PlayerEnum { one, two }

extension PlayerEnumExtension on PlayerEnum {
  String toRequest() {
    if (this == PlayerEnum.one) {
      return "ONE";
    }

    return "TWO";
  }
}
