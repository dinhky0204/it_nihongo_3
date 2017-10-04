# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! email: "linhttd.bk@gmail.com",
             password: "linh123456",
             is_admin: 0, name: "Dieu Linh Tran", avatar: "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/18893284_1364010630331365_8484294660424703703_n.jpg?oh=ef2e6922e3d581bb43fcda4da6e1e84c&oe=5A7DDBBD"
User.create! email: "linh.haenie.bk@gmail.com",
             password: "linh123456",
             is_admin: 1, name: "Tao Xanh", avatar: "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/18300964_1340195982712830_7376374535615802746_n.jpg?oh=1c2e33ae9bf0db25e61ba07bff15d791&oe=5A4C74EF"
Publisher.create! name: "ABC"
Game.create! name: "Dota",
             story: "abcduowjfw awmflwjf",
             description: "Dota la mot game rat hay, khien nhieu anh em vo cung hung thu",
             guide: "jalfwnwhfon anflwhf",
             photo: "http://cdn.ndtv.com/tech/gadgets/valve_dota2_.jpg",
             publisher_id: 1
Review.create!([
                 {user_id: 1,
                  content: "KIRKUS REVIEW
      A witty book that turns the science of the stuff we breathe into a delightful romp through history.
      Kean (The Tale of the Dueling Neurosurgeons: The History of the Human Brain as Revealed by True Stories of Trauma, Madness, and Recovery, 2014, etc.), an award-winning science writer whose previous books may have sounded off the wall but tackled serious subjects, has done it again, using his free-wheeling style to translate hard scientific facts into lively stories. He divides the narrative into three sections, the first of which examines the origins of the air on our planet. Here, we learn about the contribution of volcanic eruptions, including a diverting piece on one unfortunately stubborn resident of Mount Saint Helens, the eruption of which served as “the greatest geology lesson in American history.” In the second section, Kean takes up the various components of air, starting with the major one, nitrogen, and concluding with the much rarer helium and the noble gases. Here, each chapter explores how human beings have exploited the different gases, which gives the author the opportunity to tell more entertaining stories, including ones about anesthesia and ballooning. In the third section, Kean takes a look at recent changes in the composition of our air and at the significance of the atmospheres of other planets. Of special interest, however, are the interspersed sections called “Interludes,” in which the author tells related human interest anecdotes—e.g., an exploding lake in Cambodia, a failed bank robbery in Germany, spontaneous combustion of humans, and the special talents of Le Pétomane, a highly paid “fartiste” at the Moulin Rouge. Kean cannot resist sharing other gems he uncovered in his research, and readers will appreciate them. For these, see the back-of-the-book section, “Notes and Miscellanea.” Some are priceless.
      Great fun for general readers curious about our world and an especially appropriate gift for a young person considering a career in the sciences.",
                  title: "CAESAR'S LAST BREATH",
                  game_id: 1
                 },
                 {user_id: 1,
                  content: "KIRKUS REVIEW
      A witty book that turns the science of the stuff we breathe into a delightful romp through history.
      Kean (The Tale of the Dueling Neurosurgeons: The History of the Human Brain as Revealed by True Stories of Trauma, Madness, and Recovery, 2014, etc.), an award-winning science writer whose previous books may have sounded off the wall but tackled serious subjects, has done it again, using his free-wheeling style to translate hard scientific facts into lively stories. He divides the narrative into three sections, the first of which examines the origins of the air on our planet. Here, we learn about the contribution of volcanic eruptions, including a diverting piece on one unfortunately stubborn resident of Mount Saint Helens, the eruption of which served as “the greatest geology lesson in American history.” In the second section, Kean takes up the various components of air, starting with the major one, nitrogen, and concluding with the much rarer helium and the noble gases. Here, each chapter explores how human beings have exploited the different gases, which gives the author the opportunity to tell more entertaining stories, including ones about anesthesia and ballooning. In the third section, Kean takes a look at recent changes in the composition of our air and at the significance of the atmospheres of other planets. Of special interest, however, are the interspersed sections called “Interludes,” in which the author tells related human interest anecdotes—e.g., an exploding lake in Cambodia, a failed bank robbery in Germany, spontaneous combustion of humans, and the special talents of Le Pétomane, a highly paid “fartiste” at the Moulin Rouge. Kean cannot resist sharing other gems he uncovered in his research, and readers will appreciate them. For these, see the back-of-the-book section, “Notes and Miscellanea.” Some are priceless.
      Great fun for general readers curious about our world and an especially appropriate gift for a young person considering a career in the sciences.",
                  title: "CAESAR'S LAST BREATH",
                  game_id: 1
                 },
                 {user_id: 2,
                  content: "KIRKUS REVIEW
      A witty book that turns the science of the stuff we breathe into a delightful romp through history.
      Kean (The Tale of the Dueling Neurosurgeons: The History of the Human Brain as Revealed by True Stories of Trauma, Madness, and Recovery, 2014, etc.), an award-winning science writer whose previous books may have sounded off the wall but tackled serious subjects, has done it again, using his free-wheeling style to translate hard scientific facts into lively stories. He divides the narrative into three sections, the first of which examines the origins of the air on our planet. Here, we learn about the contribution of volcanic eruptions, including a diverting piece on one unfortunately stubborn resident of Mount Saint Helens, the eruption of which served as “the greatest geology lesson in American history.” In the second section, Kean takes up the various components of air, starting with the major one, nitrogen, and concluding with the much rarer helium and the noble gases. Here, each chapter explores how human beings have exploited the different gases, which gives the author the opportunity to tell more entertaining stories, including ones about anesthesia and ballooning. In the third section, Kean takes a look at recent changes in the composition of our air and at the significance of the atmospheres of other planets. Of special interest, however, are the interspersed sections called “Interludes,” in which the author tells related human interest anecdotes—e.g., an exploding lake in Cambodia, a failed bank robbery in Germany, spontaneous combustion of humans, and the special talents of Le Pétomane, a highly paid “fartiste” at the Moulin Rouge. Kean cannot resist sharing other gems he uncovered in his research, and readers will appreciate them. For these, see the back-of-the-book section, “Notes and Miscellanea.” Some are priceless.
      Great fun for general readers curious about our world and an especially appropriate gift for a young person considering a career in the sciences.",
                  title: "CAESAR'S LAST BREATH",
                  game_id: 1
                 },
                 {user_id: 2,
                  content: "KIRKUS REVIEW
      A witty book that turns the science of the stuff we breathe into a delightful romp through history.
      Kean (The Tale of the Dueling Neurosurgeons: The History of the Human Brain as Revealed by True Stories of Trauma, Madness, and Recovery, 2014, etc.), an award-winning science writer whose previous books may have sounded off the wall but tackled serious subjects, has done it again, using his free-wheeling style to translate hard scientific facts into lively stories. He divides the narrative into three sections, the first of which examines the origins of the air on our planet. Here, we learn about the contribution of volcanic eruptions, including a diverting piece on one unfortunately stubborn resident of Mount Saint Helens, the eruption of which served as “the greatest geology lesson in American history.” In the second section, Kean takes up the various components of air, starting with the major one, nitrogen, and concluding with the much rarer helium and the noble gases. Here, each chapter explores how human beings have exploited the different gases, which gives the author the opportunity to tell more entertaining stories, including ones about anesthesia and ballooning. In the third section, Kean takes a look at recent changes in the composition of our air and at the significance of the atmospheres of other planets. Of special interest, however, are the interspersed sections called “Interludes,” in which the author tells related human interest anecdotes—e.g., an exploding lake in Cambodia, a failed bank robbery in Germany, spontaneous combustion of humans, and the special talents of Le Pétomane, a highly paid “fartiste” at the Moulin Rouge. Kean cannot resist sharing other gems he uncovered in his research, and readers will appreciate them. For these, see the back-of-the-book section, “Notes and Miscellanea.” Some are priceless.
      Great fun for general readers curious about our world and an especially appropriate gift for a young person considering a career in the sciences.",
                  title: "CAESAR'S LAST BREATH",
                  game_id: 1
                 },
             ])
