class Customer < ApplicationRecord
  has_one_attached :image

  # Allow Ransack to search these attributes
  def self.ransackable_attributes(auth_object = nil)
    %w[id full_name email phone_number notes created_at updated_at]
  end

  # Allow Ransack to search associations (if any)
  def self.ransackable_associations(auth_object = nil)
    []
  end

  validates :full_name, presence: true
  validates :phone_number, presence: true
  validates :notes, presence: true
  validates :image, presence: true
end
