# frozen_string_literal: true

module UsersHelper
  def attended_past_d(event)
    event.description if event.date < Time.current
  end

  def attended_future_d(event)
    event.description if event.date > Time.current
  end

  def attended_past_l(event)
    event.location if event.date < Time.current
  end

  def attended_future_l(event)
    event.location if event.date > Time.current
  end

  def attended_past_w(event)
    event.date if event.date < Time.current
  end

  def attended_future_w(event)
    event.date if event.date > Time.current
  end
end
