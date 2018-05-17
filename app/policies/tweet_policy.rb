class TweetPolicy < ApplicationPolicy

  def index?
    true
  end

  def destroy?
    user.present? && user.admin?
  end

  def update?
    user.present? && user == record.user
  end

  def new?
    user.present?
  end

  def create?
    user.present? && user == record.user
  end

  private
    def post
      record
    end

end
