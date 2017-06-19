module Admin::JudgementsHelper
  def category_i18n(key)
    t("activerecord.attributes.judgement.categories.#{key}")
  end

  def category_options
    Judgement.categories.map { |key, _value| [category_i18n(key), key] }
  end
end
