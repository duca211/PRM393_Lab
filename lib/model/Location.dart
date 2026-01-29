class Location {
  final int id;
  final String name;
  final String address;
  final String description;
  final String image;
  int star = 0;
  Location({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.image,
    this.star = 0,
  });
}

List<Location> locs = [
  Location(
    id: 1,
    name: 'Lake Campground',
    address: "Thanh pho Ho Chi Minh",
    image: 'https://picsum.photos/300/150',
    description:
        'Day la mot cai ho rat dep, no nam o thanh pho Ho Chi Minh. Ho co nhieu canh quan, dia danh, danh lam thang canh noi tieng rat thu hut khach du lich den ghe tham.',
  ),
  Location(
    id: 2,
    name: 'Mountain Dew',
    address: "Ha Noi",
    image: 'https://picsum.photos/500/150',
    description:
        'Day la mot ngon nui rat dep, no nam o thanh pho Ho Chi Minh. Ho co nhieu canh quan, dia danh, danh lam thang canh noi tieng rat thu hut khach du lich den ghe tham.',
  ),
];
