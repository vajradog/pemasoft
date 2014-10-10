class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Job
  
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    #alias_action :create, :read, :update, :destroy, :to => :crud

    if user.is? :admin
      can :manage, :all
      can :assign_roles, User

      #if user.role? :guest
      #  cannot :read, Job
      elsif user.role? :moderator 
       can :manage, Candidate
       can :manage, Vote
       can :manage, Comment

      else user.is? :registered
        can :create, Candidate
        can :read, Candidate, :user_id => user.id
    end

  




          
          
    #elsif user.role? :moderator
    #  can :manage, Candidate do |candidate|
    #    candidate.user
    #  end
    #else
#      can :read, Job
#      can :manage, @candidate
#     # cannot :assign_roles, User
#    end#

#    if user.role?(:moderator)
#     can :manage, @candidate
#    #    candidate.user
#    #  can :crud, Vote do |vote|
#   #     vote.try(:user) == user
#    end
##
#      #

#    #  can :read, Job do |job|
#    #    job.try(:job) == user || user.role?(:moderator)
#   #   end#

#   #   can :read, Candidate# do |candidate|
#        #candidate.try(:user) == user || user.role?(:moderator) 
#    #  end
#  #  end#

#    if user.role? :registered
#      can :crud, Candidate do |candidate|
#        candidate.user == user
#      end
#    end#

#    if user.role? :banned
#      can :read, Job
#    end


    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
