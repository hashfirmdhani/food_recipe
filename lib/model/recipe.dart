class Instructions{
  final String displayText;

  Instructions({
    required this.displayText,
});

  factory Instructions.fromJson(Map<String, dynamic> json) => Instructions(
    displayText: json['display_text'] != null ? json['display_text'] : ''
  );
}

class Section {
  Section({
    required this.components,
  });

  List<Component> components;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        components: json["components"] != null ? List<Component>.from(
            json["components"].map((x) =>
                Component.fromJson(x))) : [],
      );
}

  class Component {
    Component({
    required this.rawText,
  });

  String rawText;

    factory Component.fromJson(Map<String, dynamic> json) => Component(
    rawText: json["raw_text"] != null ? json["raw_text"] : '',
  );
}

class Recipe{
  final String name;
  final String images;
  final String rating;
  final String totalTime;
  final String description;
  final String videoUrl;
  final List<Instructions> instructions;
  final List<Section> sections;

  Recipe({required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
    required this.description,
    required this.videoUrl,
    required this.instructions,
    required this.sections});

  factory Recipe.fromJson(dynamic json){
    return Recipe(
        name: json['name'] as String,
        images: json['thumbnail_url'] as String,
        rating: json['country'] as String,
        totalTime: json['total_time_minutes'] != null
            ? json['total_time_minutes'].toString() + "Minutes"
            : "30 Minutes",
        description : json['description'] !=null ? json['description'] : " ",
        videoUrl : json['original_video_url'] !=null ? json
        ['original_video_url'] : 'novideo',
        instructions: json['instructions'] != null ? List<Instructions>.from(json["instructions"].map(
        (x) => Instructions.fromJson(x))) : [],
        sections: json["sections"] != null ? List<Section>.from(json["sections"].map((x) =>
        Section.fromJson(x))): []
    );
  }

  static List<Recipe> recipeFromSnapshot(List snapshot){
    return snapshot.map((data){
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }


}