module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    opts[:id] = "avatar"
    image_tag user.avatar,
              opts
  end

# modal for login !
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    User
  end

end
