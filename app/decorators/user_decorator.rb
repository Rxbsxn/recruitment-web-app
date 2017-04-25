class UserDecorator < Draper::Decorator
  delegate_all

  def has_gender?
    if gender.blank?
      'Gender is unknown'
    else
      gender
    end
  end

  def has_age?
    if age.blank?
      'Age is unknown'
    else
      age
    end
  end

  def has_interests?
    if points_of_interests.any?
      points_of_interests.each do |poi|
        poi.points
      end
    else
      'User has no interests'
    end
  end

  def can_delete?
    if h.current_user.admin?
      if user != h.current_user
        h.link_to '', h.home_path(user), method: :delete, class: 'glyphicon glyphicon-trash'
      else
        'You cannot delete yourself'
      end
    end  
  end
end
