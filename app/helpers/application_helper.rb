module ApplicationHelper
  def conversion_alert(type)
    case type
    when "notice"
      type = "primary"
    when "error"
      type = "danger"
    when "success"
      type = "success"
    when "alert"
      type = "info"
    else
      type = "dark"
    end
  end
end