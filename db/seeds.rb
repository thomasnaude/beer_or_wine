User.destroy_all
Beer.destroy_all
# Wine.destroy_all

user = User.create!(email: 'user@email.com', password: 'azerty')

ipa = Beer.create!(name: "Punk IPA", style: "IPA", country: "GB", brewery: "Brewdog")

cros = Wine.create!(name: "Chateau du Cros", appellation: "Bordeaux", country: "FR", year: 2016, color: "blanc")

Wine.create!(name: "Chateau Monconseil Gazin, grande réserve", appellation: "Blaye Côtes de Bordeaux", year: 2013, country: "FR", color: "rouge")

Wine.create!(name: "Chateau Brown", appellation: "Pessac Léognan", year: 2012, country: "FR", color: "rouge")
