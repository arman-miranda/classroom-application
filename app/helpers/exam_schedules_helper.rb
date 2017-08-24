module ExamSchedulesHelper
  def format_date(date_time)
    date_time.strftime("%B %d %Y @ %I:%M %p")
  end
end
