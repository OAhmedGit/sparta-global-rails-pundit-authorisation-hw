class ApplicationPolicy
  attr_reader :user, :tweet

  def initialize(user, tweet)
    @user = user
    @tweet = tweet
  end

  def index?
    false
  end

  def show?
    scope.where(:id => tweet.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, tweet.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
