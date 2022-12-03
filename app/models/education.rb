class Education
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  
  field :name, type:String
  field :father_name, type:String
  field :address, type:String
  field :contact_number, type:Integer
  field :college_name, type:String
  field :course, type:String
  field :location, type:String
  field :payment, type:Integer
  field :bill_no, type:String

end
