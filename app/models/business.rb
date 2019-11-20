class Business < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :main_address, presence: true

  def instagram=(val)
    val.gsub!(/#{URI::regexp}/, '')
    write_attribute(:instagram, val)
  end
end
