module UsersHelper
  def attended_past(event)
    event.description if event.date < Time.current
  end

  def attended_future(event)
    event.description if event.date > Time.current
  end
end
