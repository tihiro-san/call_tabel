# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by(
    email: 'admin@test',
    password: '123456'
)

grades = %w(A B C)
rank_contents = %w(資料送付 新規訪問 デモアポイン)

attribures = grades.zip(rank_contents).map{|o| { grade: o[0], rank_content: o[1]} }
attributes.each{|attr| Valuation.create!(attr) }