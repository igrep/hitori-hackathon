# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# http://www.oiax.jp/rails/rails3/database_table_and_model.html
# からパクったかのように見えるコード

table_names = %w{ tasks }

table_names.each do |table_name|
  tasks_path = "#{Rails.root}/db/seeds/#{Rails.env}/#{table_name}"
  require tasks_path if File.exist? tasks_path
end
