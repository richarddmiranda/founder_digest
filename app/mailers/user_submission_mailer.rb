class UserSubmissionMailer < ApplicationMailer

  def accept(user_submission)
    @name = user_submission.name
    puts "User received acceptance email"
    mail(to: user_submission.email, subject: "Congrats, you were accepted!")
    

  end
  
  def reject(user_submission)
    @name = user_submission.name
    puts "User received rejection email"
    mail(to: user_submission.email, subject: "Sorry, you were rejected!")
    
  end
end

