# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

orgs = YAML::load_file(Rails.root.join("db/seed_files/orgs.yml"))
orgs.each{|org| Organization.find_or_create_by!(name: org[:name], fb_url: org[:fb_url])}