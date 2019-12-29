class BillRequest < ApplicationRecord
  belongs_to :manager
  belongs_to :bill

  validates :message, :approved_at, :updated_at, presence: true

  enum approved_status: { accept: 0, decline: 1, need_to_review: 2}
end
