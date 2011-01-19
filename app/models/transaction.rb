class Transaction < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end
 
  belongs_to :customer, :class_name => "User"

  belongs_to :company, :class_name => "User"

  lifecycle do

    state :submitted, :accepted

     create :submit, :params => [ :company ], :become => :submitted,
                     :available_to => "User",
                     :user_becomes => :customer do
                     puts "  submit"
    end

     transition :accept, { :submitted => :accepted }, :available_to => :customer do
     puts "transaction success"
    end

  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
