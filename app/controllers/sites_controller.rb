require 'rest-client'
class SitesController < ApplicationController
  def home
  end

  def contact
    @message = Message.new

  end
  def message_create
    @message = Message.new(message_params)
    if @message.save
      # AdminMailer.new_feedback(message_params[:name],message_params[:number],message_params[:message]).deliver
      # send_simple_message
      redirect_to sites_contact_path, flash: {success: "Submitted Successfully"}
    else
      redirect_to sites_contact_path, flash: {danger: "All fields are required & should be a vaild one"}
    end

  end
  def send_simple_message
	RestClient.post "https://api:46d0e843c413788b5e5c39f2029eccfb-2ac825a1-0dfbde71"\
	"@api.mailgun.net/v3/sandbox4a1f74dcd1ec4daba1fe771713e902e1/messages",
	:from => "Excited User <mailgun@sandbox4a1f74dcd1ec4daba1fe771713e902e1.mailgun.org>",
	:to => "riyasyacub@gmail.com",
	:subject => "Hello",
	:text => "Testing some Mailgun awesomness!"
end
  def services
  end

  def news
    @blogs = Blog.all
  end

  def staff_login
    @user = User.new
  end

  private
    def message_params
      params.require(:message).permit(:name,:number,:message)
    end
end
