User.create(
  first_name: 'User',
  role: 'admin',
  email: Faker::Internet.email,
  password: Faker::Internet.email
)

10.times do |i|
  Product.create(
    name:  Faker::Name.name,
    meta_title: Faker::Name.name,
    item_no: rand(10),
    slug: Faker::Internet.slug,# label summary items_keywords overview ingredients how_to_use
    active: [true, false][rand(2)]
  )

  Article.create(
    title:  Faker::Name.name,
    teaser: Faker::Name.name,
    main_body: Faker::Name.name,
    slug: Faker::Internet.slug,
    active: [true, false][rand(2)]
  )

  DataSheet.create(
    filename:  Faker::Name.name,
    search_terms: Faker::Name.name,
    active: [true, false][rand(2)]
  )
end
