require 'mailgun'
class HomeController < ApplicationController
    
    def index
        
    end
    def write
        
        @title = params[:title]
        @content = params[:content]
        @email = params[:email]
        @send = params[:send]
        
        mg_client = Mailgun::Client.new("key-da8e63960acee3322c9e3a08f9f0b499")
        
        message_params =  {
                   from: @send,
                   to:   @email,
                   subject: @title,
                   text:    @content
                         }

        result = mg_client.send_message('sandboxef3508ff231043b99cd11bd2cc9a8453.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
        
    end
end
