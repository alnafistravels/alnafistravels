class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :message, type: String
  field :number, type: Integer
  
  validates :number, presence: true, length: { minimum: 8, maximum: 16 }
end
