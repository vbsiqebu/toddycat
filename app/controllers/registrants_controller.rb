class RegistrantsController < ApplicationController

def index
	render json: Registrant.all.entries
end

def show
end

def new
end

def create
end

def edit
end

def update
end

def destroy
end


end