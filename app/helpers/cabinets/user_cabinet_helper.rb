module Cabinets::UserCabinetHelper
  def set_user_side_bar
    content_for :user_cabinet_side_bar do
      render 'navbar/cabinets/cabinetUser'
    end
  end
end
