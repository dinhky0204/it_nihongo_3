# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
GameGenre.delete_all
Game.delete_all
Genre.delete_all
Publisher.delete_all
Game.delete_all
Review.delete_all 
# Rate.delete_all 

Publisher.create! id:1, name: "XYZ"
Genre.create! id:1, name: "2D"
Genre.create! id:2, name: "3D"
Genre.create! id:3, name: "4X"

Game.create! id:1,
             name: "Mario",
             story: "Mario story",
             description: "The opportunities introduced by possessing others isn't just an easy source of laughs, but also works hand in hand with Odyssey's ever-present challenges.",
             guide: "no guide",
             image: "https://static.gamespot.com/uploads/screen_kubrick/1197/11970954/3307360-super-mario-odyssey-review-promo1-2.jpg",
             publisher_id: 1
Game.create! id:2,
             name: "Golf Story",
             story: "Golf Story story",
             description: "Fore!",
             guide: "No guide",
             image: "https://static.gamespot.com/uploads/screen_small/1197/11970954/3306584-golf-story-review-promo1-2.jpg",
             publisher_id: 1
Game.create! id:3,
             name: "Assassin's Creed Origins",
             story: "Assassin's Creed Origins story",
             description: "Fore!",
             guide: "No guide",
             image: "https://static.gamespot.com/uploads/screen_small/1197/11970954/3307359-assassins_creed_origins-review-promo12.jpg",
             publisher_id: 1
Game.create! id:4,
             name: "Wolfenstein 2: The New Colossus",
             story: "Wolfenstein 2: The New Colossus story",
             description: "Fore!",
             guide: "No guide",
             image: "https://static.gamespot.com/uploads/screen_small/172/1720905/3308120-wolfenstein-2-review-promo1-2.jpg",
             publisher_id: 1
Game.create! id:5,
             name: "WWE 2K18",
             story: "WWE 2K18 story",
             description: "Fore!",
             guide: "No guide",
             image: "https://static.gamespot.com/uploads/screen_small/1197/11970954/3305493-wwe2k18-promo-1-2.jpg",
             publisher_id: 1
Game.create! id:6,
             name: "Destiny 2",
             story: "Destiny 2 story",
             description: "Fore!",
             guide: "No guide",
             image: "https://static.gamespot.com/uploads/scale_tiny/1574/15746725/3214089-destinysmallthumb.jpg",
             publisher_id: 1
Game.create! id:7,
             name: "South Park",
             story: "South Park story",
             description: "Fore!",
             guide: "No guide",
             image: "https://static.gamespot.com/uploads/scale_tiny/1197/11970954/3078723-66102.jpg",
             publisher_id: 1
Game.create! id:8,
             name: "The Flame in the Flood",
             story: "WWE 2K18 story",
             description: "Fore!",
             guide: "No guide",
             image: "https://static.gamespot.com/uploads/scale_tiny/536/5360430/2889979-untitled-1.jpg",
             publisher_id: 1
Game.create! id:9,
             name: "FIFA 18",
             story: "FIFA 18 story",
             description: "Fore!",
             guide: "No guide",
             image: "https://static.gamespot.com/uploads/scale_tiny/1197/11970954/3245560-fifa.jpg",
             publisher_id: 1
Game.create! id:10,
             name: "Stardew Valley",
             story: "Stardew Valley story",
             description: "Fore!",
             guide: "No guide",
             image: "https://static.gamespot.com/uploads/scale_tiny/536/5360430/3171182-stardew.jpg",
             publisher_id: 1   
Game.create! id:11,
             name: "Dota",
             story: "Dota story",
             description: "Dota la mot game rat hay, khien nhieu anh em vo cung hung thu",
             guide: "jalfwnwhfon anflwhf",
             image: "http://cdn.ndtv.com/tech/gadgets/valve_dota2_.jpg",
             publisher_id: 1
Game.create! id:12,
             name: "Half life",
             story: "abcduowjfw awmflwjf",
             description: "Half life la mot game rat hay, khien nhieu anh em vo cung hung thu",
             guide: "jalfwnwhfon anflwhf",
             image: "http://cdn.ndtv.com/tech/gadgets/valve_dota2_.jpg",
             publisher_id: 1             

GameGenre.create!([
                      {game_id: 1, genre_id: 2},
                      {game_id: 2, genre_id: 2},
                      {game_id: 3, genre_id: 2},
                      {game_id: 4, genre_id: 2},
                      {game_id: 5, genre_id: 2},
                      {game_id: 6, genre_id: 2},
                      {game_id: 7, genre_id: 2},
                      {game_id: 9, genre_id: 2},
                      {game_id: 10, genre_id: 2},
                      {game_id: 11, genre_id: 2},
                      {game_id: 12, genre_id: 2},
                      {game_id: 1, genre_id: 1},
                      {game_id: 2, genre_id: 1},
                      {game_id: 3, genre_id: 1},
                      {game_id: 4, genre_id: 1},
                      {game_id: 5, genre_id: 1},
                      {game_id: 6, genre_id: 1},
                      {game_id: 7, genre_id: 3},
                      {game_id: 9, genre_id: 3},
                      {game_id: 10, genre_id: 3},
                      {game_id: 11, genre_id: 3},
                      {game_id: 12, genre_id: 3},
                  ])
                 
Review.create!([
                  {user_id: 1,
                  content: "Super Mario Odyssey displays a clear understanding of what makes Mario tick,
                  and is neck and neck for top billing among its esteemed predecessors. 
                  It surprises you with not just inventive mechanics, of which there are many, 
                  but with expertly tuned level design and moments of charismatic wit. 
                  It is comfortable in absurdity and wields this attitude to cut through the limitations of its 
                  otherwise straightforward structure and keep you smiling all along the way.\n

                  Above all else, Odyssey is refined. It generously doles out new worlds to explore, 
                  effortlessly cycling from one charming enemy and unique gameplay idea to the next. 
                  Its collection of open-world Kingdoms is varied and broad, and sometimes clearly inspired by Super Mario 64. 
                  Though it isn't necessarily a groundbreaking game like its ancestor, which redefined expectations for 3D games at large,
                  Odyssey outpaces it at every turn. Its environments are bigger and some of the most interesting
                  ever seen in a Mario game--just wait until you lay eyes on Bowser's elaborate fortress. 
                  All the extra space is invaluable, as the dense layouts of challenges and rewards justifies every building 
                  and landmass you encounter.

                  Your mission to rescue Princess Peach from Bowser--which actually takes a surprising turn for a change--is ultimately the hunt for Power Moons. These are Odyssey's version of the series' star collectables, which are rewarded for feats big and small alike. Acquiring a moon can call upon your platforming skills, but it can also entail quirky activities like answering trivia questions from a charmingly simple-minded Sphinx, or exploring your surroundings for buried treasure with a doting pup (who will also play fetch if you know the trick). From boss battles to tossing your hat onto a peculiar piece of architecture, you can readily stumble into new moons--even 40 hours in--so long as you make sure to constantly shift your perspective on the world and engage with new possibilities as they come into view.",
                  title: "Mario Review",
                  game_id: 1,
                  status: 1
                 },
                 {user_id: 1,
                  content: "Golf Story is zany, unexpectedly funny, and mechanically sound.
                  Those descriptors aren't overly exciting on their own, but then again, 
                  the same could be said of what constitutes contemporary RPGs; you fetch things, 
                  hit other things, and generally do the bidding of others while your heroism goes ignored. 
                  Golf Story is essentially an RPG based on mundane, real-world concerns dialed up to the nth degree, 
                  and it's that relatability that makes it much more charming than it sounds on paper.\n

                  It's a not-so-sneaky homage to titles like Mario Golf considering its central conceit:
                  absolutely everything can be solved with a combination of golf clubs, golf balls, and dogged persistence. 
                  That's where the player-character enters--a man who's lost half his life to a soul-sucking wife 
                  and the general indifference of others--and the fun begins. This is your typical redemption story, 
                  but instead of saving the world, you're trying to simply restore order to your otherwise bleak existence 
                  in memory of your father. It's a small-scale situation, but the the stakes feel enormous.",
                  title: "Golf Story",
                  game_id: 2,
                  status: 1
                 },
                 {user_id: 1,
                  content: "When you need to see the bigger picture, sometimes it's best to return to your roots. 
                  Assassin's Creed Origins takes this thinking to heart and steps into the seamless and dynamic 
                  open world of ancient Egypt. Although this move shows glimmers of a brighter future for the series,
                  it also becomes clear that its core gameplay and presentation have some difficulties keeping up with
                  the newfound pace and scale.\n

                  Blurring the lines between prequel and sequel, Assassin's Creed Origins takes us back to 
                  the beginning of the Assassin Brotherhood, while also laying the groundwork for a new present-day storyline.
                  Set during the time of the Ptolemaic Kingdom in Egypt, you take on the role of Bayek, 
                  a Medjay ranger who embarks on a quest for revenge against a mysterious order that pre-dates the Templars. 
                  Crossing paths with historical figures such as Cleopatra and Julius Caesar, Bayek travels through 
                  the dense and varied lands of Northern Africa. He'll sneak, loot, and stab key figures in the social 
                  and political worlds of Egypt, leading to several unforeseen consequences for the future of the Kingdom, 
                  right up to present day events.",
                  title: "Assassin's Creed Origins Review",
                  game_id: 3,
                  status: 1
                 },
                 {user_id: 1,
                  content: "Above all else, Wolfenstein II: The New Colossus takes a very hard stance on 
                  the righteousness of killing Nazis. It never falters, not once asking whether violent resistance is
                  the wrong way to fight back against oppression--and the game is stronger for it. 
                  The series' tongue-in-cheek attitude provides a respite from both the horrors of the Reich and 
                  the frustration of throwing yourself against its all-powerful war machine. 
                  And despite some heavy-handed moments that feel like missteps in its message, 
                  satisfying Nazi-killing action bolsters its completely bonkers storyline in a way 
                  that only Wolfenstein can achieve.\n

                  The New Colossus picks up right after the events of The New Order, and unsurprisingly,
                  our hero Blazkowicz is in bad shape. Following the explosion during the fight with Deathshead, 
                  BJ's insides are falling out, and the crew of the Kreisau Circle does their best to put him back together again.
                  General Engel tracks them down five months later, and as her troops storm the resistance's 
                  stolen U-boat (Eva's Hammer, your base of operations), Blazkowicz wakes up to shoot more Nazis.",
                  title: "Wolfenstein 2: The New Colossus Review",
                  game_id: 4,
                  status: 1
                 },
                 {user_id: 1,
                  content: "Spectacle and showmanship are as vital to professional wrestling as its storylines and in-ring action.
                  Fans will fondly remember a Superstar's distinctive mannerisms, or the pageantry of a glorious entrance,
                  just as much as a five-star match. WWE 2K18 takes this aspect to heart with a substantial leap 
                  in visual fidelity--further complementing developers Yuke's and Visual Concepts' adherence to wrestling authenticity.
                  However, the game's cosmetic advancements fail to cover up stagnant gameplay mired in technical issues.\n

                  WWE's superlative lighting, character models, and motion captured animations bring each star of the squared circle
                  to life with startling accuracy. And while there are some disparities between the poor saps at the bottom of 
                  the card and those at the very top, the gap isn't as significant as it has been in previous years, 
                  with entrances remaining a dazzling highlight. Small details, like stretch marks and surgery scars, 
                  also contribute to WWE 2K18's graphical showcase.",
                  title: "WWE 2K18 Review",
                  game_id: 5,
                  status: 1
                 },
                 {user_id: 1,
                  content: "Destiny 2 is a lot more Destiny. The structure is largely the same, as is the mechanically
                  excellent shooting and satisfying loot grind. But there are a variety of changes both under 
                  the hood and throughout your activities that make it a significant improvement over the original 
                  and a better experience for more than just the most hardcore players.\n

                  From the onset, there's an overwhelming amount of stuff to do. The Red War story funnels 
                  you through the four areas you can explore, introducing you to each one as you go. At each destination, 
                  there's a bunch of optional activities to choose from, including story-like Adventure missions, 
                  simple loot dungeons called Lost Sectors that lead to hidden areas of the map, and public events and patrols,
                  which return from Destiny 1. Then, as you progress through the story, you'll unlock the strike playlist 
                  and PvP in the Crucible. For a newcomer to Destiny, it can be hard to decide what to do and when.",
                  title: "Destiny 2 Review",
                  game_id: 6,
                  status: 0
                 },
                 {user_id: 1,
                  content: "In South Park: The Fractured But Whole, the fantasy theme of its predecessor gives way 
                  to the equally popular subject of superheroes, parodying the current state of comic book-to-film 
                  oversaturation we see today. This shift is complemented by the change in the combat system, 
                  which proves cerebrally satisfying despite the juvenile sight of your main character using flatulence 
                  to overpower and outsmart everyone from ninjas to a red wine-enraged Randy Marsh. 
                  And when you add town exploration that awards practical character benefits, the resulting game 
                  is a delightfully fart-tinged journey that delivers satisfying gameplay and surprising absurdity in equal measure.",
                  title: "South Park Review",
                  game_id: 7,
                  status: 0
                 },
                 {user_id: 1,
                  content: "Survival games challenge you to gain control of treacherous worlds. You typically start with very little,
                  and need to scavenge for supplies and resources in order to craft the tools needed to help you avoid death. 
                  Success usually means having enough power to establish yourself in a higher place on the food chain, 
                  or hunkering down and building a fortified space strong enough to keep the rest of the food chain out. 
                  The Flame in the Flood doesn’t allow you to achieve either of those goals and is a consistently gripping 
                  experience as a result.",
                  title: "The Flame in the Flood Review",
                  game_id: 8,
                  status: 0
                 },
                 {user_id: 1,
                  content: "FIFA 18 on Nintendo Switch is a tough game to categorize. When compared to the likes of
                  FIFA's past PS Vita, 3DS, and other mobile versions, it's easily the best portable FIFA ever made. 
                  But compared to its current console cousin--FIFA 18 on PS4 / Xbox One--it's lacking features and much of
                  the shine that makes that version so appealing.\n

                  On the pitch, it actually replicates the other editions' gameplay pretty well. Dribbling feels responsive,
                  crosses are accurate, and overall match speed is faster than on PS4 / Xbox One, a change that better 
                  suits the Switch's immediate pick-up-and-play sensibilities. Commentary is also just as impressive,
                  and animations look as smooth as they do on current-gen (though you're better off not looking at 
                  the cardboard cut-out crowds). Shots don't pop like they do on PS4 and Xbox One, and the omission of player
                  instructions is a frustrating and bizarre one. But playing a match of FIFA 18 on Switch is an enjoyable experience.",
                  title: "FIFA 18 Review",
                  game_id: 9,
                  status: 0
                 },
                 {user_id: 1,
                  content: "On the surface, Stardew Valley is a game about farming, but there are more adventures 
                  awaiting curious players beyond cultivating a rich and bountiful garden. From mining and fishing
                  to making friends and falling in love, Stardew Valley's Pelican Town is stuffed with rewarding opportunities. 
                  As modern day woes give way to pressing matters on the farm and within your newfound community,
                  Stardew Valley's meditative activities often lead to personal reflection in the real world. 
                  It’s a game that tugs at your curiousity as often as it does your heart. \n

                  Your journey begins in the field, cleaning up a neglected and rundown farm. Plotting and planning
                  your garden requires care and attention to detail. What fruits and vegetables do you grow? 
                  How much room does each plant need? How do you protect your crops from nature's troublemakers?
                  You learn through practice, and while the basics are easy to grasp, you quickly need to figure out 
                  the best way to outfit your budding farm with new tools and equipment.",
                  title:"Stardew Valley Review",
                  game_id: 10,
                  status: 0
                 },
             ])

RateTable.create!([
    {
                    user_id: 1,
                    game_id: 1,
                    point: 5,
                    message: "Good!"
    }])                 
# Rate.create!([
#                 {
#                     user_id: 1,
#                     game_id: 1,
#                     point: 5,
#                     message: "Good!"
#                 },
#                 {
#                     user_id: 1,
#                     game_id: 2,
#                     point: 4,
#                     message: "Good!"
#                 },
#                 {
#                     user_id: 1,
#                     game_id: 3,
#                     point: 4,
#                     message: "Good!"
#                 },
#                 {
#                     user_id: 1,
#                     game_id: 5,
#                     point: 4,
#                     message: "Good!"
#                 },
#                 {
#                     user_id: 1,
#                     game_id: 6,
#                     point: 3,
#                     message: "Good!"
#                 },
#                 {
#                     user_id: 1,
#                     game_id: 7,
#                     point: 4,
#                     message: "Good!"
#                 },
#                 {
#                     user_id: 1,
#                     game_id: 8,
#                     point: 3,
#                     message: "Good!"
#                 },
#                 {
#                     user_id: 1,
#                     game_id: 9,
#                     point: 3,
#                     message: "Good!"
#                 },
#                 {
#                     user_id: 1,
#                     game_id: 10,
#                     point: 3,
#                     message: "Good!"
#                 },
#                 {
#                     user_id: 1,
#                     game_id: 11,
#                     point: 3,
#                     message: "Good!"
#                 },
#                 {
#                     user_id: 1,
#                     game_id: 12,
#                     point: 3,
#                     message: "Good!"
#                 },
#             ])