class DowngradeController < ApplicationController
  def destroy
    flash[:notice] = "You have downgraded your account and your wikis are now publicized."
    current_user.standard!
    current_user.wikis.update_all(:private => false)
    redirect_to wikis_path
  end
end