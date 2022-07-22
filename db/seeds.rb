Business.destroy_all
Interaction.destroy_all
User.destroy_all

User.create(username:"Peachy_Serene", password_digest:"1234", admin: true)
User.create(username:"Angy_Peachy", password_digest:"4321", admin: false)

Business.create(name:"Flatiron School", link:"google.com", address:"11 Broadway, NY, NY", category: "School")
Business.create(name:"Skylink", link:"google.com", address:"1000 Wilshire Blvd, Los Angeles, CA", category:"Killer Robots")

Interaction.create(user_id:1, business_id:1, bookmark: false, download:false, error_report:false, rating:0)
Interaction.create(user_id:2, business_id:2, bookmark: false, download:false, error_report:true, rating:0)

puts "seeding done"
