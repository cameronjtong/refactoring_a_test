FactoryBot.define do
  factory :customer do
    number { 99 }
    name { "Tom" }
    last_name { "Cruise" }
    billing_address factory: :address
    shipping_address factory: :address
    to_create do |instance|
      DB.save(instance)
      instance
    end
  end
end
