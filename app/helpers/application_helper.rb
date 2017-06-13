module ApplicationHelper
  def active_menu_item_class(path)
    current_page?(path) ? 'active' : ''
  end
end
