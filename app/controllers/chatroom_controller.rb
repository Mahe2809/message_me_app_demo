class ChatroomController < ApplicationController

    def index
        @messages = Message.all
    end
    

end


#<div class="event">
# <div class="content">
# <div class="summary me">
    # Hello!
# </div>
# </div>
# </div>