# frozen_string_literal: true

# Mailer for the application. Settings defined here can be overridden by lower
# classes.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
