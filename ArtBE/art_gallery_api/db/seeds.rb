# Seed data for Aboriginal Tribes
aboriginal_tribes = [
    { name: "Noongar" },
    { name: "Yamatji" },
    { name: "Nyoongah" },
    { name: "Wajarri" }
  ]
  
  aboriginal_tribes.each do |tribe|
    AboriginalTribe.create!(tribe)
  end
  
  # Seed data for Aboriginal Symbols
  aboriginal_symbols = [
    { name: "Kangaroo Tracks", description: "This is a kangaroo track symbol", aboriginal_tribe_id: 1 },
    { name: "Emu Tracks", description: "This is an emu track symbol", aboriginal_tribe_id: 2 },
    { name: "Snake Tracks", description: "This is a snake track symbol", aboriginal_tribe_id: 3 }
  ]
  
  aboriginal_symbols.each do |symbol|
    AboriginalSymbol.create!(symbol)
  end
  
  # Seed data for Artists
  artists = [
    { name: "Emily Kame Kngwarreye", bio: "Australian Aboriginal artist from Utopia, Northern Territory.", aboriginal_tribe_id: 1 },
    { name: "Albert Namatjira", bio: "Australian Aboriginal artist from the Western Arrernte community.", aboriginal_tribe_id: 2 },
    { name: "Lena Nyadbi", bio: "Australian Aboriginal artist from the Gija people in Western Australia.", aboriginal_tribe_id: 3 }
  ]
  
  artists.each do |artist|
    Artist.create!(artist)
  end
  
  # Seed data for Art Types
  art_types = [
    { name: "Painting" },
    { name: "Sculpture" },
    { name: "Pottery" }
  ]
  
  art_types.each do |art_type|
    ArtType.create!(art_type)
  end
  
  # Seed data for Artifacts
  artifacts = [
    { name: "My Art", description: "This is my art", artist_id: 1, aboriginal_symbol_id: 1, art_type_id: 1 },
    { name: "Your Art", description: "This is your art", artist_id: 2, aboriginal_symbol_id: 2, art_type_id: 2 },
    { name: "Their Art", description: "This is their art", artist_id: 3, aboriginal_symbol_id: 3, art_type_id: 3 }
  ]
  
  artifacts.each do |artifact|
    Artifact.create!(artifact)
  end
  