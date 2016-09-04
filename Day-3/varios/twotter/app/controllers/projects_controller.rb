class ProjectsController < ApplicationController
    def new
        @twot = Twot.new
    end

    def create
        @twot = Twot.new params[:twot].permit(:body)
        if @twot.save
            flash[:notice] = 'Twot was successfully created.'
            redirect_to projects_path
        else
            flash[:error] = 'Error!!!'
            render :new
        end
    end
end