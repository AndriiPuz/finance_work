module ApplicationHelper
  include Pagy::Frontend

  def type_to_word(str)
    str == "income" ? "доходи" : "витрати"
  end
end
