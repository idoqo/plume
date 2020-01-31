# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
                        {email: "hello@example.com", full_name: "Plume User", password: "hello-plume-0x"}
                    ])
Category.create([
                                 {name: 'Fashion Designs', description: ''},
                                 {name: 'Technology', description: ''},
                                 {name: 'Clothing/Boutiques', description: ''},
                                 {name: 'Food & Restaurants', description: ''},
                                 {name: 'Cakes/Bakery', description: ''},
                                 {name: 'Events Management', description: ''},
                                 {name: 'Photography', description: ''}
                             ])
Business.create([
                          {name: "Afkit Technologies", logo: "afkit.png",
                           user_id: 1, description: "The tech company you can trust", main_address: "New Market",
                           phone: "+2349000000033", email: "afkit-plume@example.com",
                           whatsapp_phone: "+2349000000033",
                           twitter:"", instagram: "afkit_tech",  category_id: 2
                          }
                      ])