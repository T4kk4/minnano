class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    if user.admin?
      can :manage, :all
    elsif user.normal?
      can :manage, ActiveAdmin::Page, name: "Dashboard"
      can :manage, ActiveAdmin::Page, name: "Article Import"
      can :manage, ActiveAdmin::Page, name: "Topic Article Import"
      can [:index, :read, :update], AdminUser, id: user.id
      can :manage, Article
      can :manage, ArticleContent
      can :manage, TopicArticle
      can :manage, TopicArticleContent
      can :manage, Image
      can [:index, :read], Contact
      can [:index, :read], Entry
      can :manage, TaxAccountant
      can :manage, Breadcrumb
      can [:index, :read], City
    end
  end
end
