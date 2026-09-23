class MenuItem {
  final String name;
  final double price;
  final double? discountPercent;

  MenuItem({
    required this.name,
    required this.price,
    this.discountPercent,
  });

  double finalPrice() {
    final discount = discountPercent ?? 0;
    return price - (price * discount / 100);
  }
}

void main() {
  final Set<MenuItem> menu = { 
    MenuItem(name: 'Nasi Goreng', price: 15000, discountPercent: 10),
    MenuItem(name: 'Es Teh', price: 5000),
    MenuItem(name: 'Ayam Bakar', price: 20000, discountPercent: 5),
  };

  final names = menu.map((item) => item.name).toList();
  final under15k = menu.where((item) => item.price < 15000).toList();
  final total = menu.fold<double>(0, (sum, item) => sum + item.finalPrice());

  print('Names: $names');
  print('Under 15k: ${under15k.map((e) => e.name).toList()}');
  print('Total: $total');
}