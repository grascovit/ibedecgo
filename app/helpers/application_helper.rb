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

  def format_timestamp(timestamp)
    timestamp.strftime('%d/%m/%Y %H:%M')
  end
end
