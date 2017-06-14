module Admin::UsersHelper
  def gender_i18n(key)
    t("activerecord.attributes.user.genders.#{key}")
  end

  def gender_options
    User.genders.map { |key, _value| [gender_i18n(key), key] }
  end
end
