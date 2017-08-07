User.destroy_all
Beer.destroy_all
# Wine.destroy_all

user = User.create!(email: 'user@email.com', password: 'azerty')

ipa = Beer.create!(name: "Punk IPA", style: "IPA", country: "GB", brewery: "Brewdog")

# cros = Wine.create!(name: "Chateau du Cros", appellation: "Bordeaux", country: "FR", color: :white)
