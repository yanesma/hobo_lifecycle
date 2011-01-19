class Transaction < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end
 
  belongs_to :customer, :class_name => "User"
  belongs_to :company, :class_name => "User"

  lifecycle do

    initial_state :inactive
    state :submitted, :approved, :delivered

    create :submit, :params => [ :company, :card_number, :expiry_date , :quantity], :become => :submitted,
      :available_to => "User",
      :user_becomes => :customer do
      puts " transaction submitted "
    end

    transition :approve, { :submitted => :approved }, :available_to => :company do
      #send to customer
      puts "transaction success"
    end


    transition :reject, { :submitted => :destroy }, :available_to => :company do
      puts "transaction failed"
    end

    transition :deliver, { :approved => :delivered }, :available_to => :company do
      puts "Package send"
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
