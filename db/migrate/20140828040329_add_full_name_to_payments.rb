class AddFullNameToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :full_name, :string
  end
end
