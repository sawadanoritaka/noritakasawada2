module ApplicationHelper
def profile_img(user)
  if user.image?
    img_url = user.image
  elsif user.provider == 'facebook'
    img_url = "https://graph.facebook.com/#{user.uid}/picture?width=100&height=100"
  elsif user.provider == 'twitter'
    img_url = "http://www.paper-glasses.com/api/twipi/#{user.name}/bigger"
  else
    
  end
  image_tag(img_url, alt: user.name)
end
end
