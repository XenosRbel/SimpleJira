# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
	  # Define abilities for the passed in users here. For example:
	  #
	  user ||= User.new # guest users (not logged in)
       if User.admins[user.admin] == User.admins[:Admin]
         can :manage, :all
       else
         can :read, :all
       end
	  #
	  # The first argument to `can` is the action you are giving the users
	  # permission to do.
	  # If you pass :manage it will apply to every action. Other common actions
	  # here are :read, :create, :update and :destroy.
	  #
	  # The second argument is the resource the users can perform the action on.
	  # If you pass :all it will apply to every resource. Otherwise pass a Ruby
	  # class of the resource.
	  #
	  # The third argument is an optional hash of conditions to further filter the
	  # objects.
	  # For example, here the users can only update published articles.
	  #
	  #   can :update, Article, :published => true
	  #
	  # See the wiki for details:
	  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
