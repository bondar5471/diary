# frozen_string_literal: true

class Day < ApplicationRecord
  validates :date, presence: true
  validates :report, presence: true, length: { maximum: 400 }
  # validates :successful, presence: true
end
