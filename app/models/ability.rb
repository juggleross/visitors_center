class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new

        if user.has_role? :admin
         can :manage, :all
        elsif user.has_role? :user
         can :create, :all # author can create status
         # can :update, :all # author can update status
         # can :destroy, Status # #uncomment this line, author can destroy status 
         can :read, :all
        else
         can :read, :all
        end
    end

  def as_json(options = {})
    abilities = []
    rules.each do |rule|
      if rule.actions.include?(:manage)  
        rule.actions << [:read, :destroy, :update, :create]
        rule.actions.flatten!.uniq!
        
      end
      abilities << { can: rule.base_behavior, actions: rule.actions.as_json, subjects: rule.subjects.map(&:to_s), conditions: rule.conditions.as_json }
    end
    abilities
  end
end