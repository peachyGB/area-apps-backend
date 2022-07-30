Business.destroy_all
Interaction.destroy_all
User.destroy_all

User.create(username:"Peachy_Serene", password_digest:"1234", admin: true)
User.create(username:"Angy_Peachy", password_digest:"4321", admin: false)
puts "users done..."

Business.create(busName:"Flatiron School", appName:"FIS", link:"https://google.com", appImage:"https://coursereport-s3-production.global.ssl.fastly.net/uploads/school/logo/8/original/flatironschool.png", address:"11 Broadway, NY, NY", category: "School")
Business.create(busName:"Cyberdyne Systems Corp.", appName:"Skynet", link:"https://meta.com", appImage: "https://i.pinimg.com/originals/8d/43/4c/8d434cb99f0bc932fa58ed3738e09d9f.png", address:"1000 Wilshire Blvd, Los Angeles, CA", category:"Killer Robots")
puts "businesses done..."

Interaction.create(user_id:1, business_id:1, bookmark: true, download:true, error_report:false, rating:-1 )
Interaction.create(user_id:2, business_id:2, bookmark: false, download:false, error_report:true, rating:1)
puts "interactions done..."

puts "seeding done!"