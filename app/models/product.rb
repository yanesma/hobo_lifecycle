class Product < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    code :integer
    name :string
    price :float
    timestamps
  end

  has_many :transactions

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
