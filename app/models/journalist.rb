class Journalist < ApplicationRecord
  has_many :articles
  validates :name, uniqueness: { scope: [:press_id, :email] }

  class << self
    def find_or_create(journalist)
      return nil if journalist.email == nil || journalist.name == nil
      result = where(press_id: journalist.press_id, name: journalist.name, email: journalist.email).first
      if result
        return result
      else
        journalist.save
        journalist
      end
    end
  end
end

# == Schema Information
#
# Table name: journalists
#
#  id         :integer          not null, primary key
#  press_id   :integer
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
