module ApplicationHelper
  include Pagy::Frontend

  def type_to_word(str)
    str == "income" ? "доходи" : "витрати"
  end

  def current_link_class(path)
    current_page?(path) ? 'active-link' : ''
  end

end
