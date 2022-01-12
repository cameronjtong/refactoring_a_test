FactoryBot.define do
  factory :address do
    street { "123 John Street" }
    city { "Toronto" }
    province { "Ontario" }
    postal_code { "L2N 1B3" }
    country { "Canada" }
    to_create do |instance|
      DB.save(instance)
      instance
    end
  end
end
