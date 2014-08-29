class AddNumberToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :number, :string
  end
end
