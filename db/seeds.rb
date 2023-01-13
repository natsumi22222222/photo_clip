# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create([
    { name: '自然' },
    { name: '天体' },
    { name: '夜景'},
    { name: '建築物'},
    { name: '乗り物'},
    { name: 'スポーツ'},
    { name: 'ファッション'},
    { name: 'ミリタリー'},
    { name: 'ポートレート'},
    { name: 'ウェディング'},
    { name: '動物'},
    { name: 'グルメ'},
    { name: 'アート'},
    { name: '白黒'},
    { name: 'その他'},
    ])

    Admin.create!(
    email: 'PhotoCliptesttest@test.com',
    password: 'testPhotoCliptest',
)