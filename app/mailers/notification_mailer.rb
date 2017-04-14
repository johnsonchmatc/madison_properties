class NotificationMailer < ApplicationMailer
    def csv_processed(file_name)
        @file_name = file_name
        mail(to: "meow@meow.com", subject: "File #{@file_name} finished processing")
    end
end
