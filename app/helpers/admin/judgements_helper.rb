module Admin::JudgementsHelper
  def judgement_category_i18n(key)
    t("activerecord.attributes.judgement.categories.#{key}")
  end

  def judgement_category_options
    Judgement.categories.map { |key, _value| [judgement_category_i18n(key), key] }
  end
end
