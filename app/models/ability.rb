class Ability
 include CanCan::Ability

  def initialize(user)
   

    user ||= User.new # guest user 

    if user.role == 'pengguna_admin'
      can :manage, :all 
    end

    if user.role == 'pengguna_biasa'
     can :roll, :logs
    end 

  end


end
