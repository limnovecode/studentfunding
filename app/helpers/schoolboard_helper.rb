# app/helpers/schoolboard_helper.rb

module SchoolboardHelper

  def slice
    @slice = (0.30 * @cake).floor(2)
    @total = number_to_currency(@slice, unit: "€", precision: 2)
  end

  def school_overall
    @cake = Receipt.sum(:percentage)
  end

  def school_approved
    @cake = Receipt.where(status: "approved").sum(:percentage)
  end

  def school_pending
    @cake = Receipt.where(status: "pending").sum(:amount)
  end

  def school_conflict
    @cake = Receipt.where(status: "conflict").sum(:amount)
  end

  def school_rejected
    @cake = Receipt.where(status: "rejected").sum(:amount)
  end

end
