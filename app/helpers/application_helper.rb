module ApplicationHelper
  def active_menu_item_class(path)
    current_page?(path) ? 'active' : ''
  end

  def format_timestamp(timestamp)
    timestamp.strftime('%d/%m/%Y %H:%M')
  end
end
