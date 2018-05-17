class UserPolicy < ApplicationPolicy

  def update?
    user == tweet
  end

end
