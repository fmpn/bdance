FactoryGirl.define do
  factory :teacher do
    first_name "Dancer"
    last_name  "Vader"
    sequence :email do |n|
      "#{first_name}.#{last_name}#{n}@example.com".downcase
    end
    password '12345678'
    wage 1200
    responsibility 'Teacher'

    after(:create) do |teacher, evaluator|
      create_list(:phone_number, 2, user: teacher.user)
    end
  end
end
