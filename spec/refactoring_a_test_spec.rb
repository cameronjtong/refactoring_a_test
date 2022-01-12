RSpec.describe RefactoringATest do
  context "#initialize" do
    it "creates a line item" do
      customer = create(:customer, percent_discount: 15)
      product = create(:product)
      invoice = create(:invoice, customer: customer)

      item = LineItem.new(invoice, product, 10, 15)

      expect(item).to have_attributes(
        invoice: invoice,
        product: product,
        quantity: 10,
        percent_discount: 15
      )
    end
  end
  context "#add_item_quantity" do
    it "adds an item to an invoice" do
      customer = create(:customer, percent_discount: 30)
      product = create(:product)
      invoice = create(:invoice, customer: customer)

      invoice.add_item_quantity(product, 5)

      expect(invoice.line_items).to contain_exactly(
        having_attributes(
          invoice: invoice,
          product: product,
          quantity: 5,
          percent_discount: 30
        )
      )
    end
  end
end
