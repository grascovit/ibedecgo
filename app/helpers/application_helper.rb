module ApplicationHelper
  def active_menu_item_class(path)
    current_page?(path) ? 'active' : ''
  end

  def flash_message_class(type)
    if type == 'notice'
      'positive'
    elsif type == 'alert'
      'negative'
    end
  end
end
