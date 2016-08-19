module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    opts[:id] = "avatar"
    image_tag user.avatar,
              opts
  end
end
