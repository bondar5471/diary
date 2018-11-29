# frozen_string_literal: true

class Notice < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true, length: { maximum: 50 }
end
