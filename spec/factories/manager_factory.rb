FactoryGirl.define do
  factory :manager do
    first_name "Dilberts"
    last_name  "Manager"
    sequence :email do |n|
      "#{first_name}.#{last_name}#{n}@example.com".downcase
    end
    password '12345678'
    responsibility 'Manager'
    wage 1200
  end
end
