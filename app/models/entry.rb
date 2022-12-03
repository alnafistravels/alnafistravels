class Entry
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :name, type:Array, default:[]
  field :price, type:Integer
  field :from, type:String
  field :to, type:String
  field :s_type, type:String
  field :service_name, type:String
  field :id_number, type:String
  field :phone, type:String
  field :paid, type:Integer
  field :bill_no, type:String
  field :date, type:DateTime

  attr_accessor :days, :flight1, :flight2
end
