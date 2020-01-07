module Cabinets::ManagerHelper
  def bill_requests?
    false
  end

  def notifications?
    false
  end

  def set_manager_nav_bar
    content_for :navbar do
      render 'navbar/manager'
    end
  end

  def set_manager_side_bar
    content_for :manager_cabinet_side_bar do
      render 'navbar/cabinets/cabinetManager'
    end
  end
end
