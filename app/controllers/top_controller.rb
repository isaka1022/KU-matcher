class TopController < ApplicationController
    def index
        @company = Company.find(search_id)
    end

    private 
    def search_id
        if params.permitted?
            params.require(:company).permit(:id)
        
        else
            1
        end
    end
end
