class Time
  def humanize
    self.strftime("%d " + I18n.t("month.#{self.month}") + " %Y")
  end
end
