# frozen_string_literal: true

module Cabinets::CabinetsHelper
  def set_main_title(title)
    content_tag(:div, content_tag(:h1, title, class: 'h2'),
                class: 'd-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom')
  end
end
