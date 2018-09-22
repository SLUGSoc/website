# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'yaml'
seed_file = Rails.root.join('db', 'committee.yml')
committee = YAML::load_file(seed_file)
committee.each do |member|
  internal_member = Member.create(
    name: member['name'],
    blurb: member['blurb'],
    image_link: member['image'],
    alias: member['alias'],
    role: member['role']
  )
  next if member['id'].nil?
  member['id'].each do |platform, tag|
    next if platform == 'steam64'
    PlatformAccount.create(
      member: internal_member,
      platform: Platform.find_or_create_by(name: platform.titleize),
      tag: tag
    )
  end
end
