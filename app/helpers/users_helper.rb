module UsersHelper
    def image_for(user)
    if user.image?
       image_tag user.image

      elsif user.provider == "facebook"
      image_tag "https://graph.facebook.com/#{user.uid}/picture?width=320&height=320"

      elsif user.provider == "twitter"
      image_tag user.profile_image_url

    else
      image_tag"sample.jpg"
    end
    end
end
