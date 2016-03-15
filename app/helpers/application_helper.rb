module ApplicationHelper
def profile_img(user)
  if user.provider == 'facebook'
    img_url = "https://graph.facebook.com/#{user.uid}/picture?width=100&height=100"
  elsif user.provider == 'twitter'
    img_url = "http://www.paper-glasses.com/api/twipi/#{user.name}/bigger"
  else
    img_url = user.image
  end
  image_tag(img_url, alt: user.name)
end
end
