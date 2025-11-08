abstract class Data {
  dynamic getExpierences();
}

class LocalData extends Data {
  @override
  dynamic getExpierences() {
    return [
      {
        "image":
            "https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8VG9reW98ZW58MHx8MHx8&auto=format&fit=crop&q=60&w=900",
        "title": "Tokyo",
        "description": "The bustling capital of Japan, known for its modernity and tradition."
      },
      {
        "image":
            "https://images.unsplash.com/photo-1549887534-ecfbcaa1f2a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8UGFyaXN8ZW58MHx8MHx8&auto=format&fit=crop&q=60&w=900",
        "title": "Paris",
        "description": "The city of lights, famous for its art, fashion, and culture."
      },
      {
        "image":
            "https://images.unsplash.com/photo-1505761671935-60b3a7427bad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8TmV3JTIwWW9ya3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=900",
        "title": "New York",
        "description": "The city that never sleeps, known for its skyline and diversity."
      },
    ];
  }
}