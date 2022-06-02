# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'nokogiri'

Project.destroy_all
User.destroy_all
LawFirm.destroy_all

# Avatar users
elena = URI.open("https://source.unsplash.com/random/?avatar")
camille = URI.open("https://source.unsplash.com/random/?avatar")
rena = URI.open("https://source.unsplash.com/random/?avatar")
lydia = URI.open("https://source.unsplash.com/random/?avatar")
thomas = URI.open("https://source.unsplash.com/random/?avatar")

law_firm = LawFirm.create!(
  name: "Legalab"
)

user_one = User.new(
  email: "elena@legalab.fr",
  password: "123456",
  first_name: "Elena",
  last_name: "Fabulous",
  role: "Wonder Paralegal",
)
user_one.photo.attach(io: elena, filename: "elena")

user_one.law_firm = law_firm
user_one.save!

user_two = User.new(
  email: "camille@legalab.fr",
  password: "123456",
  first_name: "Camille",
  last_name: "Magical",
  role: "Wonder Paralegal",
)
user_two.photo.attach(io: camille, filename: "camille")

user_two.law_firm = law_firm
user_two.save!

user_three = User.new(
  email: "lydia@legalab.fr",
  password: "123456",
  first_name: "Lydia",
  last_name: "Marvellous",
  role: "Legal Ninja",
)
user_three.photo.attach(io: lydia, filename: "lydia")

user_three.law_firm = law_firm
user_three.save!

user_four = User.new(
  email: "rena@legalab.fr",
  password: "123456",
  first_name: "Rena",
  last_name: "Fantastic",
  role: "Legal Ninja",
)
user_four.photo.attach(io: rena, filename: "rena")

user_four.law_firm = law_firm
user_four.save!

user_five = User.new(
  email: "thomas@legalab.fr",
  password: "123456",
  first_name: "Thomas",
  last_name: "Epic",
  role: "Legal Geek",
)
user_five.photo.attach(io: thomas, filename: "thomas")

user_five.law_firm = law_firm
user_five.save!

project_one = Project.new(
  name: "FlipLydia",
  start_at: "Tue, 21 June 2022",
  end_at: "Tue, 26 July 2022",
  progress: 0,
  company_name: "Lydi",
  company_email: "cyril@lydi.com",
  duration: 30
)

project_one.user = user_three
project_one.save!

project_two = Project.new(
  name: "FlipDocto",
  start_at: "Tues, 03 May 2022",
  end_at: "Tues, 07 June 2022",
  progress: 0,
  company_name: "Doctorib",
  company_email: "stan@doctorib.com",
  duration: 30
)

project_two.user = user_three
project_two.save!

project_three = Project.new(
  name: "FlipQonto",
  start_at: "Tue, 14 June 2022",
  end_at: "Tue, 19 July 2022",
  progress: 0,
  company_name: "Qonco",
  company_email: "alex@qonco.com",
  duration: 30
)

project_three.user = user_three
project_three.save!

project_four = Project.new(
  name: "FlipBack",
  start_at: "Fri, 20 May 2022",
  end_at: "Fri, 1 July 2022",
  progress: 0,
  company_name: "RackMarket",
  company_email: "thib@rackmarket",
  duration: 30
)

project_four.user = user_four
project_four.save!

project_five = Project.new(
  name: "FlipVoodoo",
  start_at: "Fri, 27 May 2022",
  end_at: "Fri, 1 July 2022",
  progress: 0,
  company_name: "Voohoo",
  company_email: "alex.yaz@vohoo.com",
  duration: 30
)

project_five.user = user_four
project_five.save!

project_six = Project.new(
  name: "FlipContent",
  start_at: "Wed, 18 May 2022",
  end_at: "Fri, 17 June 2022",
  progress: 100,
  company_name: "ContentCirle",
  company_email: "jon.cherzy@cc.com",
  duration: 30
)

project_six.user = user_four
project_six.save!
