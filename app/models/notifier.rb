class Notifier < ActionMailer::Base  

  default_url_options[:host] = "#{AppConfig['base_domain']}"  
  
  def password_reset_instructions(user)
    setup_email(user, "Password Reset Instructions")    
  end  
  
  protected

    def setup_email(user,subj=nil)
      recipients  "#{user.email}"
      from        %{"India ISD" <no-reply@IndiaISD.com>}
      subject     "[www.IndiaISD.com] #{subj}"
      sent_on     Time.now
      body        :user => user
    end

end