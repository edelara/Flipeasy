# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

law_firm = LawFirm.create!(
  name: "Legalab"
)

user_one = User.new(
  email: "elena@flipeasy.fr",
  first_name: "Elena",
  last_name: "Thing",
  password: "123459"
)

user_one.law_firm = law_firm
user_one.save!

user_two = User.new(
  email: "toto@flipeasy.fr",
  first_name: "toto",
  last_name: "Thing",
  password: "123459"
)

user_two.law_firm = law_firm
user_two.save!


project = Project.new(
  name: "XX",
  start_at: "10/20/2022",
  end_at: "10/20/2022",
  progress: "20%",
  company_name: "blabla",
  company_email: "hh@flipeasy.fr"
  )
project.user = user_two
project.save!
