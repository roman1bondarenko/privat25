# frozen_string_literal: true

class Bill < ApplicationRecord
  validates :type, :amount, :expired_bill_at, :percent, presence: true
  validates :amount, numericality: { only_integer: true,
                                     message: ' amount may contain only numbers' }

  validates :regular_replenishment_amount, presence: true, if: type == types.credit
  validates :regular_replenishment_amount,
            numericality: { only_integer: true,
                            message: ' amount may contain only numbers' }, if: type == types.credit

  has_many :manager_notifications
  has_one :bill_request

  enum type: { credit: 0, debit: 1 }
  enum early_closed_status: { not_request_to_close: 0, request_to_close: 1, closed: 2 }
end
