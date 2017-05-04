class UserDecorator < Draper::Decorator
  delegate_all

  def gender_info
    if gender.blank?
      'Gender is unknown'
    else
      gender
    end
  end

  def age_info
    if age.blank?
      'Age is unknown'
    else
      age
    end
  end

  def interests_info
    if points_of_interests.any?
      points_of_interests.each do |poi|
       return "#{poi.name} type-of
         #{poi.type_of_interest}"
      end
    else
      'User has no interests'
    end
  end

  def can_delete
    if h.current_user.admin?
      if user != h.current_user
        h.link_to '', h.home_path(user), method: :delete, class: 'glyphicon glyphicon-trash'
      else
        'You cannot delete yourself'
      end
    end  
  end

  def can_edit
    if h.current_user.admin?
      h.link_to 'Edit', h.edit_admin_user_path(user)
    end
  end
end
