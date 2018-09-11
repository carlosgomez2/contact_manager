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

  def active?(path)
    "active" if current_page?(path)
  end

  def nav_link(path)
    if current_user.present?
      dashboard_path
    else
      root_path
    end
  end

  def has_error?(resource, attribute)
    'is-invalid' if resource.errors.messages[attribute].present?
  end
end