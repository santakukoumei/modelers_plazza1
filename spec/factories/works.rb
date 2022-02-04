FactoryBot.define do
  factory :work do
    user
    title          {Faker::Lorem.sentence}
    category_id    {2}
    concept        {Faker::Lorem.sentence}
    explanation    {Faker::Lorem.sentence}

    after(:build) do |work|
      work.image.attach(io: File.open('public/images/work_image.jpg'), filename: 'work_image.jpg')
    end
  end
end
