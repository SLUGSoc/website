# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'yaml'
platform_seed_file = Rails.root.join('db', 'platforms.yml')
platforms = YAML::load_file(platform_seed_file)
platforms.each do |platform|
  Platform.create(
    name: platform['name'],
    icon: platform['icon']
  )
end
committee_seed_file = Rails.root.join('db', 'committee.yml')
committee = YAML::load_file(committee_seed_file)
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
    sub_platform = Platform.find_by(name: 'Battle.net') if platform == 'battlenet'
    PlatformAccount.create(
      member: internal_member,
      platform: sub_platform || Platform.find_or_create_by(name: platform.titleize),
      tag: tag
    )
  end
end
