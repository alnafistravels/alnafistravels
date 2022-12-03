class Money
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :name, type:String
  field :company, type:String
  field :from, type:String
  field :country, type:String
  field :acc_no, type:String
  field :ifsc, type:String
  field :aadhar_no, type:String
  field :pan_no, type:String
  field :amount, type:Integer
  field :address, type:String
  field :id_no, type:String
  field :phone, type:String
  field :bill_no, type:String
end
