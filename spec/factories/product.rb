FactoryBot.define do
  factory :product do
    number { 88 }
    code { "widget" }
    unit_price { 19.99 }
    to_create do |instance|
      DB.save(instance)
      instance
    end
  end
end
