class Category < ApplicationRecord
    has_many :skills, dependent: :destroy
    validates :name, presence:true, uniqueness:true
    validates :color, presence:true

      COLORS = ['#007bff', '#28a745', '#ffc107', '#dc3545', '#17a2b8', '#6610f2'].freeze
end
