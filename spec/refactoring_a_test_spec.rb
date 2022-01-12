require "bigdecimal"

RSpec.describe RefactoringATest do
  context '#initialize' do
  it "creates a line item" do
    billing_address = Address.new("1222 1st St SW", "Calgary", "Alberta", "T2N 2V2","Canada")
    shipping_address = Address.new("1333 1st St SW", "Calgary", "Alberta", "T2N 2V2", "Canada")
    customer = Customer.new(99, "John", "Doe", BigDecimal("30"), billing_address, shipping_address)
    product = Product.new(88, "SomeWidget", BigDecimal("19.99"))
    invoice = Invoice.new(customer: customer)

    item = LineItem.new(invoice, product, 10, 15)

    expect(item).to have_attributes(invoice: invoice, product: product,
                                    quantity: 10, percent_discount: 15)
  end
end
context '#add_item_quantity' do
  it "adds an item to an invoice" do
      billing_address = FactoryBot.create(
        :address,
        street: "1222 1st St SW" ,
        city: "Calgary",
        province: "Alberta",
        postal_code: "T2N 2V2",
        country: "Canada"
      )
      shipping_address = FactoryBot.create(
        :address,
        street: "1333 1st St SW",
        city: "Calgary",
        province: "Alberta",
        postal_code: "T2N 2V2",
        country: "Canada"
      )
      customer = FactoryBot.create(
        :customer,
        number: 99,
        name: "John",
        last_name: "Doe",
        percent_discount: BigDecimal("30"),
        billing_address: billing_address,
        shipping_address: shipping_address
      )
      product = FactoryBot.create(:product, number: 88, code: "SomeWidget", unit_price: BigDecimal("19.99"))
      invoice = FactoryBot.create(:invoice, customer: customer)

      invoice.add_item_quantity(product, 5)

      expect(invoice.line_items).to contain_exactly(having_attributes(invoice: invoice, product: product,
                                                                       quantity: 5, percent_discount: 30))
  end
end

end
