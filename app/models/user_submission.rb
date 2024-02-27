class UserSubmission < ApplicationRecord

end

rails g model Subscription project:references user:references