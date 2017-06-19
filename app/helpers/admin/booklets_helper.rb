module Admin::BookletsHelper
  def booklet_category_i18n(key)
    t("activerecord.attributes.booklet.categories.#{key}")
  end

  def booklet_category_options
    Booklet.categories.map { |key, _value| [booklet_category_i18n(key), key] }
  end
end
