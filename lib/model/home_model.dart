class homei {
  final String name;
  final List<homeim> list;

  homei({required this.name, required this.list});
}

class homeim {
  final String name;
  final String image;
  final String detail;

  homeim({
    required this.name,
    required this.image,
    required this.detail,
  });
}