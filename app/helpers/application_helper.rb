module ApplicationHelper
  DOCX_MIME_TYPE = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'.freeze
  DOC_MIME_TYPE = 'application/msword'.freeze
  PDF_MIME_TYPE = 'application/pdf'.freeze

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

  def attachment_icon_class(type)
    if type == PDF_MIME_TYPE
      'massive red file pdf outline document icon'
    elsif type == DOC_MIME_TYPE || type == DOCX_MIME_TYPE
      'massive blue file word outline document icon'
    end
  end
end
