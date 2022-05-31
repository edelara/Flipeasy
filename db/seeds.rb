# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Project.destroy_all
User.destroy_all
LawFirm.destroy_all

law_firm = LawFirm.create!(
  name: "Legalab"
)

user_one = User.new(
  email: "elena@legalab.fr",
  password: "123456",
  first_name: "Elena",
  last_name: "Fabulous",
  role: "Wonder Paralegal",
  photo: "elena.png"
)

user_one.law_firm = law_firm
user_one.save!

user_two = User.new(
  email: "camille@legalab.fr",
  password: "123456",
  first_name: "Camille",
  last_name: "Magical",
  role: "Wonder Paralegal",
  photo: "camille.png"
)

user_two.law_firm = law_firm
user_two.save!

user_three = User.new(
  email: "lydia@legalab.fr",
  password: "123456",
  first_name: "Lydia",
  last_name: "Marvellous",
  role: "Legal Ninja",
  photo: "lydia.png"
)

user_three.law_firm = law_firm
user_three.save!

user_four = User.new(
  email: "rena@legalab.fr",
  password: "123456",
  first_name: "Rena",
  last_name: "Fantastic",
  role: "Legal Ninja",
  photo: "rena.png"
)

user_four.law_firm = law_firm
user_four.save!

user_five = User.new(
  email: "thomas@legalab.fr",
  password: "123456",
  first_name: "Thomas",
  last_name: "Epic",
  role: "Legal Geek",
  photo: "thomas.png"
)

# user_five.law_firm = law_firm
# user_five.save!

project_one = Project.new(
  name: "FlipLydia",
  start_at: "Tue, 21 June 2022",
  end_at: "Tue, 26 July 2022",
  progress: "not started",
  company_name: "Lydi",
  company_email: "cyril@lydi.com"
)

project_one.user = user_three
project_one.save!

project_two = Project.new(
  name: "FlipDocto",
  start_at: "Tues, 03 May 2022",
  end_at: "Tues, 07 June 2022",
  progress: "completed",
  company_name: "Doctorib",
  company_email: "stan@doctorib.com"
)

project_two.user = user_three
project_two.save!

project_three = Project.new(
  name: "FlipQonto",
  start_at: "Tue, 14 June 2022",
  end_at: "Tue, 19 July 2022",
  progress: "not started",
  company_name: "Qonco",
  company_email: "alex@qonco.com"
)

project_three.user = user_three
project_three.save!

project_four = Project.new(
  name: "FlipBack",
  start_at: "Fri, 20 May 2022",
  end_at: "Fri, 1 July 2022",
  progress: "in progress",
  company_name: "RackMarket",
  company_email: "thib@rackmarket"
)

project_four.user = user_four
project_four.save!

project_five = Project.new(
  name: "FlipVoodoo",
  start_at: "Fri, 27 May 2022",
  end_at: "Fri, 1 July 2022",
  progress: "in progress",
  company_name: "Voohoo",
  company_email: "alex.yaz@vohoo.com"
)

project_five.user = user_four
project_five.save!

project_six = Project.new(
  name: "FlipContent",
  start_at: "Wed, 18 May 2022",
  end_at: "Fri, 17 June 2022",
  progress: "delayed",
  company_name: "ContentCirle",
  company_email: "jon.cherzy@cc.com"
)

project_six.user = user_four
project_six.save!
