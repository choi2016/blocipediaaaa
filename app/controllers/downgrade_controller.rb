class DowngradeController < ApplicationController
  def destroy
    flash[:notice] = "You have downgraded your account and your wikis are now publicized."
    current_user.standard!
    redirect_to wikis_path
  end
end