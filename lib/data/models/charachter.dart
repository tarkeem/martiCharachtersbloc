class Character{
 	late int	 id;
	late String name;
	late String status;
	late String species;
	late String	gender;
	late var	origin;
	late var	location;
	late String image;
	late List 	episode;
	late String url;
	late String	created;
  late String type;


  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin =
        json['origin'] ;
    location =
        json['location'] ;
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
    print('............................................................\n\n\n\n\n\n');
    print(id);
  }
  

}