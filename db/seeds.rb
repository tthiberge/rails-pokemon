puts "Cleaning the database"
Transaction.destroy_all
Pokemon.destroy_all
User.destroy_all

puts "Seeding"

# Creating the users
theo = User.create!(
  email: "tt@gmail.com" ,
  password: "123456",
  balance: 1000)

harold = User.create!(
  email: "harold@gmail.com" ,
  password: "123456",
  balance: 2000
)


# Creating the Pokemons
pikachu = Pokemon.new(
  name: "pikachu",
  url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.9Gmd97xxfJ-JltpIv-x4eQHaHz%26pid%3DApi&f=1&ipt=bcdf640eb54317f9d766d87b07119e9ad67e946ff49cfe488832b0a187ecd9d5&ipo=images",
  weight: 10,
  height: 50,
  price: 5
)
pikachu.user = theo
pikachu.save

carapuce = Pokemon.new(
  name: "carapuce",
  url: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.waouo.com%2Fwp-content%2Fuploads%2F2011%2F09%2Fcarapucepokemon.png&f=1&nofb=1&ipt=eed42f2a806681c3b412f322423862bb5e574a96916c5566e3eb5cdebbadf76f&ipo=images",
  weight: 30,
  height: 80,
  price: 3
)
carapuce.user = theo
carapuce.save

salameche = Pokemon.new(
  name: "salameche",
  url: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.waouo.com%2Fwp-content%2Fuploads%2F2011%2F09%2Fsalamechepokemon.png&f=1&nofb=1&ipt=da64dae30ce4fdede72cd51f66cebe2d1e01e4ff9e8d97cd25968a98795e757d&ipo=images",
  weight: 25,
  height: 60,
  price: 3
)
salameche.user = theo
salameche.save


ronflex = Pokemon.new(
  name: "ronflex",
  url: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpm1.narvii.com%2F7070%2Fd38e93c6880a7ef15c37a520f15c3759e6580571r1-968-776v2_uhq.jpg&f=1&nofb=1&ipt=aa657e5a4e6e0b996fbd3ede30081967f0384fb89b2995abb020f7d6c393303f&ipo=images",
  weight: 400,
  height: 250,
  price: 4
)
ronflex.user = harold
ronflex.save

dracofeu = Pokemon.new(
  name: "dracofeu",
  url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pokepedia.fr%2Fimages%2Fthumb%2F3%2F34%2FDracaufeu-PDM1.png%2F1200px-Dracaufeu-PDM1.png&f=1&nofb=1&ipt=6fce626f4ddefe99d909ea587fb3887818d2960537c5357eb3491455b0cf7b2f&ipo=images",
  weight: 200,
  height: 300,
  price: 4
)
dracofeu.user = harold
dracofeu.save











# Transactions
transaction1 = Transaction.new
transaction1.user = theo
transaction1.pokemon = pikachu
transaction1.action = "buy from harold for 2 USD_BTC"
transaction1.save

transaction1 = Transaction.new
transaction1.user = harold
transaction1.pokemon = dracofeu
transaction1.action = "buy from theo for 3 USD_BTC"
transaction1.save

transaction1 = Transaction.new
transaction1.user = harold
transaction1.pokemon = ronflex
transaction1.action = "buy from theo for 3 USD_BTC"
transaction1.save

puts "Seeded"
