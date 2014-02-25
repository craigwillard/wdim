Paperclip.interpolates :user do |attachment, style|
  "#{attachment.instance.user_id}"
end

Paperclip.interpolates :banner do |attachment, style|
  "#{attachment.instance.id}"
end