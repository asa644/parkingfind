desc "Send email to users"

task email_sender: :environment do |_, args|
  User.find_each do |user|
    UserMailer.welcome(user).deliver# if <YOUR_LOGIC_TO_CHECK_IF_YOU_NEED_TO_SEND_EMAIL>
  end
end
