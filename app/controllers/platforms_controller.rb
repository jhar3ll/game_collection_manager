class PlatformsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @platforms = Platform.ordered_by_name 
    end 
end
