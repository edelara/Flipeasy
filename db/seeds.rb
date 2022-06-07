# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'

Project.destroy_all
User.destroy_all
LawFirm.destroy_all

# Avatar users
elena = URI.open("https://res.cloudinary.com/dsc1uchot/image/upload/v1654246240/elena_xrnowd.jpg")
camille = URI.open("https://res.cloudinary.com/dsc1uchot/image/upload/v1654246209/camille_ebyitl.jpg")
rena = URI.open("https://res.cloudinary.com/dsc1uchot/image/upload/v1654246307/rena_b5oti8.jpg")
lydia = URI.open("https://res.cloudinary.com/dsc1uchot/image/upload/v1654246277/lydia_bro8dn.jpg")
thomas = URI.open("https://res.cloudinary.com/dsc1uchot/image/upload/v1654246331/thomas_xphezy.jpg")

# Law firm
law_firm = LawFirm.create!(
  name: "Legalab"
)

# users
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

# Company logo
matera = URI.open("https://res.cloudinary.com/dsc1uchot/image/upload/v1654615593/matera_ye6tjn.png")
skello = URI.open("https://res.cloudinary.com/dsc1uchot/image/upload/v1654615613/skello_pupdsp.png")
grow_box = URI.open("https://res.cloudinary.com/dsc1uchot/image/upload/v1654615581/akagreen_yjott5.jpg")


# Projects
project_one = Project.new(
  name: "FlipSkello",
  start_at: "Tue, 21 June 2022",
  end_at: "Tue, 26 July 2022",
  progress: 50,
  company_name: "Skello",
  company_email: "cyril@skello.com",
  company_landing_page: "https://www.skello.io/?utm_medium=cpc&utm_source=g&utm_campaign=1652578690&gclid=CjwKCAjw7vuUBhBUEiwAEdu2pCSTiqY2ml2BUTMlk7hZGZqdOHpHx8Tx4neqggVKXzaNv1TY40B7CRoCnZcQAvD_BwE",
  duration: 21
)

project_one.photo.attach(io: skello, filename: "skello")

project_one.user = user_three
project_one.save!

project_two = Project.new(
  name: "FlipCohabs",
  start_at: "Tues, 03 May 2022",
  end_at: "Tues, 07 June 2022",
  progress: 20,
  company_name: "Cohabs",
  company_email: "malik@cohabs.com",
  duration: 30
)

project_two.user = user_three
project_two.save!

project_three = Project.new(
  name: "FlipMatera",
  start_at: "Tue, 14 June 2022",
  end_at: "Tue, 19 July 2022",
  progress: 0,
  company_name: "Matera",
  company_email: "victor@matera.com",
  duration: 45,
  company_landing_page: "https://matera.eu/fr",
)

project_three.user = user_three
project_three.save!

project_four = Project.new(
  name: "FlipGrowBox",
  start_at: "Fri, 20 May 2022",
  end_at: "Fri, 1 July 2022",
  progress: 11,
  company_name: "Grow Box",
  company_email: "jb@growbox.fr",
  company_landing_page: "https://www.aka.green/",
  duration: 21
)

project_four.user = user_three
project_four.save!

project_five = Project.new(
  name: "FlipTribu",
  start_at: "Fri, 27 May 2022",
  end_at: "Fri, 1 July 2022",
  progress: 20,
  company_name: "Tribu",
  company_email: "mylene@tribu.com",
  duration: 30
)

project_five.user = user_four
project_five.save!

project_six = Project.new(
  name: "FlipSmarty",
  start_at: "Wed, 18 May 2022",
  end_at: "Fri, 17 June 2022",
  progress: 100,
  company_name: "Smarty",
  company_email: "patrick@smarty.com",
  duration: 45
)

project_six.user = user_four
project_six.save!
