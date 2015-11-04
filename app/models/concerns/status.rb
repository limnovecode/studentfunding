# model/concerns/status.rb

module Status
  extend ActiveSupport::Concern

  included do
    scope :approved_all, -> { where(status: "approved") }
    scope :pending_all, -> { where(status: "pending") }
    scope :conflict_all, -> { where(status: "conflict") }
    scope :rejected_all, -> { where(status: "rejected") }
  end

  # module ClassMethods
  # end
end
