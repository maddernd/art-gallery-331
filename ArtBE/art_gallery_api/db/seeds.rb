# Seed data for Aboriginal Tribes
aboriginal_tribes = [
  { name: "Noongar" },
  { name: "Yamatji" },
  { name: "Nyoongah" },
  { name: "Wajarri" },
  { name: "Kija" },
  { name: "Gunditjmara" },
  { name: "Gamilaraay" },
  { name: "Palawa" },
  { name: "Wiradjuri" },
  { name: "Arrernte" }
]

aboriginal_tribes.each do |tribe|
  AboriginalTribe.create!(tribe)
end

# Seed data for Aboriginal Symbols
aboriginal_symbols = [
  { name: "Kangaroo Tracks", description: "This is a kangaroo track symbol", aboriginal_tribe_id: 1 },
  { name: "Emu Tracks", description: "This is an emu track symbol", aboriginal_tribe_id: 2 },
  { name: "Snake Tracks", description: "This is a snake track symbol", aboriginal_tribe_id: 3 },
  { name: "Turtle", description: "This is a turtle symbol", aboriginal_tribe_id: 4 },
  { name: "Goanna", description: "This is a goanna symbol", aboriginal_tribe_id: 5 },
  { name: "Eagle", description: "This is an eagle symbol", aboriginal_tribe_id: 6 },
  { name: "Fish", description: "This is a fish symbol", aboriginal_tribe_id: 7 },
  { name: "Star", description: "This is a star symbol", aboriginal_tribe_id: 8 },
  { name: "Moon", description: "This is a moon symbol", aboriginal_tribe_id: 9 },
  { name: "Sun", description: "This is a sun symbol", aboriginal_tribe_id: 10 }
]

aboriginal_symbols.each do |symbol|
  AboriginalSymbol.create!(symbol)
end

# Seed data for Artists
artists = [
  { name: "Emily Kame Kngwarreye", bio: "Australian Aboriginal artist from Utopia, Northern Territory.", aboriginal_tribe_id: 1 },
  { name: "Albert Namatjira", bio: "Australian Aboriginal artist from the Western Arrernte community.", aboriginal_tribe_id: 2 },
  { name: "Lena Nyadbi", bio: "Australian Aboriginal artist from the Gija people in Western Australia.", aboriginal_tribe_id: 3 },
  { name: "Paddy Bedford", bio: "Australian Aboriginal painter from the Gija language group in Western Australia.", aboriginal_tribe_id: 4 },
  { name: "Sally Gabori", bio: "Australian Aboriginal artist from Bentinck Island in the Gulf of Carpentaria.", aboriginal_tribe_id: 5 },
  { name: "Dorothy Napangardi", bio: "Australian Aboriginal artist from the Walpiri language group in the Northern Territory.", aboriginal_tribe_id: 6 },
  { name: "Clifford Possum Tjapaltjarri", bio: "Australian Aboriginal artist from the Warlpiri language group in the Northern Territory.", aboriginal_tribe_id: 7 },
  { name: "Gloria Petyarre", bio: "Australian Aboriginal artist from  Utopia, Northern Territory.", aboriginal_tribe_id: 8 },
  { name: "Bill Whiskey Tjapaltjarri", bio: "Australian Aboriginal artist from the Pintupi language group in the Western Desert.", aboriginal_tribe_id: 9 },
  { name: "Tommy Mitchell", bio: "Australian Aboriginal artist from the Yindjibarndi language group in the Pilbara region of Western Australia.", aboriginal_tribe_id: 10 }
]

artists.each do |artist|
  Artist.create!(artist)
end

# Seed data for Art Types
art_types = [
  { name: "Painting" },
  { name: "Sculpture" },
  { name: "Pottery" },
  { name: "Weaving" },
  { name: "Carving" },
  { name: "Basketry" },
  { name: "Jewelry" },
  { name: "Textiles" },
  { name: "Ceramics" },
  { name: "Mixed Media" }
]

art_types.each do |art_type|
  ArtType.create!(art_type)
end

# Seed data for Artifacts
artifacts = [
  { name: "My Art", description: "This is my art", artist_id: 1, aboriginal_symbol_id: 1, art_type_id: 1, image_url: "https://example.com/my_art.png" },
  { name: "Your Art", description: "This is your art", artist_id: 2, aboriginal_symbol_id: 2, art_type_id: 2, image_url: "https://example.com/your_art.png" },
  { name: "Their Art", description: "This is their art", artist_id: 3, aboriginal_symbol_id: 3, art_type_id: 3, image_url: "https://example.com/their_art.png" },
  { name: "Another Art", description: "This is another art", artist_id: 4, aboriginal_symbol_id: 4, art_type_id: 4, image_url: "https://example.com/another_art.png" },
  { name: "Amazing Art", description: "This is an amazing art", artist_id: 5, aboriginal_symbol_id: 5, art_type_id: 5, image_url: "https://example.com/amazing_art.png" },
  { name: "Colorful Art", description: "This is a colorful art", artist_id: 6, aboriginal_symbol_id: 6, art_type_id: 6, image_url: "https://example.com/colorful_art.png" },
  { name: "Wooden Art", description: "This is a wooden art", artist_id: 7, aboriginal_symbol_id: 7, art_type_id: 7, image_url: "https://example.com/wooden_art.png" },
  { name: "Fabric Art", description: "This is a fabric art", artist_id: 8, aboriginal_symbol_id: 8, art_type_id: 8, image_url: "https://example.com/fabric_art.png" },
  { name: "Ceramic Art", description: "This is a ceramic art", artist_id: 9, aboriginal_symbol_id: 9, art_type_id: 9, image_url: "https://example.com/ceramic_art.png" },
  { name: "Mixed Media Art", description: "This is a mixed media art", artist_id: 10, aboriginal_symbol_id: 10, art_type_id: 10, image_url: "https://example.com/mixed_media_art.png" }
]

artifacts.each do |artifact|
  Artifact.create!(artifact)
end

# Seed data for ArtFacts
art_facts = [
  { title: "Interesting Fact", description: "This is an interesting fact about art", image_url: "https://example.com/art_fact.png" },
  { title: "Another Fact", description: "This is another interesting fact about art", image_url: "https://example.com/art_fact2.png" },
  { title: "Fascinating Fact", description: "This is a fascinating fact about art", image_url: "https://example.com/art_fact3.png" },
  { title: "Surprising Fact", description: "This is a surprising fact about art", image_url: "https://example.com/art_fact4.png" },
  { title: "Amazing Fact", description: "This is an amazing fact about art", image_url: "https://example.com/art_fact5.png" },
  { title: "Interesting Tidbit", description: "This is an interesting tidbit about art", image_url: "https://example.com/art_fact6.png" },
  { title: "Fun Fact", description: "This is a fun fact about art", image_url: "https://example.com/art_fact7.png" },
  { title: "Curious Fact", description: "This is a curious fact about art", image_url: "https://example.com/art_fact8.png" },
  { title: "Little Known Fact", description: "This is a little known fact about art", image_url: "https://example.com/art_fact9.png" },
  { title: "Trivia", description: "This is a piece of art trivia", image_url: "https://example.com/art_fact10.png" }
]

art_facts.each do |art_fact|
  ArtFact.create!(art_fact)
end

# Seed data for Users
users = [
  { email: "user1@example.com", password_digest: BCrypt::Password.create('password'), first_name: "John", last_name: "Doe", admin: false },
  { email: "admin@example.com", password_digest: BCrypt::Password.create('password'), first_name: "Jane", last_name: "Smith", admin: true },
  { email: "user2@example.com", password_digest: BCrypt::Password.create('password'), first_name: "Mary", last_name: "Johnson", admin: false },
  { email: "user3@example.com", password_digest: BCrypt::Password.create('password'), first_name: "Bob", last_name: "Williams", admin: false },
  { email: "user4@example.com", password_digest: BCrypt::Password.create('password'), first_name: "Alice", last_name: "Brown", admin: false },
  { email: "user5@example.com", password_digest: BCrypt::Password.create('password'), first_name: "David", last_name: "Jones", admin: false },
  { email: "user6@example.com", password_digest: BCrypt::Password.create('password'), first_name: "Karen", last_name: "Davis", admin: false },
  { email: "user7@example.com", password_digest: BCrypt::Password.create('password'), first_name: "Tom", last_name: "Wilson", admin: false },
  { email: "user8@example.com", password_digest: BCrypt::Password.create('password'), first_name: "Jenny", last_name: "Taylor", admin: false },
  { email: "user9@example.com", password_digest: BCrypt::Password.create('password'), first_name: "Peter", last_name: "Anderson", admin: false },
  { email: "user10@example.com", password_digest: BCrypt::Password.create('password'), first_name: "Lisa", last_name: "Thompson", admin: false }
]

users.each do |user|
  User.create!(user)
end




  