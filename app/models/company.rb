class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type:["image/jpg", "image/jpeg", "image/png"]

  has_many :from_messages, class_name: "Message", foreign_key: "from_id", dependent: :destroy
  has_many :to_messages, class_name: "Message", foreign_key: "to_id", dependent: :destroy
  has_many :sent_messages, class_name: "Message", through: "from_messages", source: :from
  has_many :received_messages, class_name: "Message", through: "to_messages", source: :to

  def send_message(student, room_id, content)
    from_messages.create!(to_id: student.id, room_id: room_id, content: content)
  end

  def name
    "#{family_name} #{first_name}"
  end

  def name_kana
    "#{family_name_kana} #{first_name_kana}"    
  end

end
