class Transaction < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    
    visa_number :integer
    expiry_date :date
    quantity :integer

    timestamps
  end
 
  belongs_to :customer, :class_name => "User"
  belongs_to :company, :class_name => "User"

  lifecycle do

    state :submitted, :default => true
    state :approved, :delivered

#    create :submit, :params => [ :company, :visa_number,:expiry_date, :quantity], :become => :submitted,
#      :available_to => "User",
#      :user_becomes => :customer do
#      puts " transaction submitted "
#    end

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
