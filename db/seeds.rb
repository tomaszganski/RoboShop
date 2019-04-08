# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generujemy 8 kategorii z losową nazwą generowaną przez Faker::Hacker.ingverb

# Wszystkie numery ID tych kategorii przechowujemy w zmiennej category_ids
# Metoda pluck(:id) przyjmuje nazwę kolumny id i zwraca tabelę z wartościami wszystkich wierszy z bazy danych czyli wszystkie id

# W tym bloku dodajemy losowo wybrane produkty - 200 sztuk
# Losujemy nazwę produktu, krótki opis, długi opis
# Wybieramy losową kategorię. Metoda sample zwraca losowy element z tablicy category_ids
# Generujemy losowa cenę. Cena 3-cyfrowa i ma 2 miejsca po przecinku

# Dodatkowo generujemy za pomocą Fakera losowy obrazek produktu
# Rozmiar 640x480, format jpg, ma pochodzić z 1, 2 lub 3 setu, tło losowe 1 lub 2
# Po nadaniu wszystkich atrybutów zapisujemy produkt i stawiamy "." żeby wiedzieć że skrypt się wykonuje - Sprytne!

8.times do
  Category.create! name: Faker::Hacker.ingverb.capitalize
end

category_ids = Category.pluck(:id)

print "Product"
200.times do
  product = Product.create! name: "#{Faker::Hacker.verb} #{Faker::Hacker.noun}".capitalize,
                            description: Faker::Hacker.say_something_smart,
                            long_description: Faker::Lorem.paragraphs(3).join("\n\n"),
                            category_id: category_ids.sample,
                            price: Faker::Number.decimal(3, 2)

  product.remote_photo_url = Faker::Avatar.image(
      product.name.parameterize,
      "640x480",
      "jpg",
      "set#{[1, 2, 3].sample}",
      "bg#{[1, 2].sample}")
  product.save
  print "."

end
puts