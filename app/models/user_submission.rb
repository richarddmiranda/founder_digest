class UserSubmission < ApplicationRecord
  PLAN_NAMES = ['free', 'pro']

  # validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text
  # validates :plan_name, inclusion: { in: PLAN_NAMES }

  after_update :send_mailer

  def name
    "#{first_name} #{last_name}"
  end

  def send_mailer
    puts "SENDING MAILER"
    UserSubmissionMailer.reject(self).deliver if status == 'Reject'
    UserSubmissionMailer.accept(self).deliver if status == 'Accept'

  end
end

