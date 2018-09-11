class ContactPolicy < ApplicationPolicy
  def update?
    user.id === record.user.id
  end

  def destroy?
    update?
  end
end
