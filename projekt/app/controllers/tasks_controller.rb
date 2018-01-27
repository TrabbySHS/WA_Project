class TasksController < ApplicationController
	before_action :authenticate_user!
	def index
		#TODO Make so user only see task of his own group. Maybe switch to dropdown format.
		@tasks=Task.all.order("created_at DESC")
	end

	def edit
		#TODO Time limited, or only 1 time? Maybe put delay on another edit? Goal: prevent users from "New JSON" spamming.
		@task=Task.find(params[:id])	
	end

	def create

		#TODO Make it so task have assinged group ID specified in user data. 
		#Add subtasks, that can be confirmed as done to micromanage bigger tasks?
		#current_user.group
		
		@task=current_user.tasks.build(params.require(:task).permit(:title,:description,:priority,:group))
		if @task.save
			redirect_to tasks_path
		else
			render 'new'
		end
	end

	def update
		@task=Task.find(params[:id])
		if @task.update(params[:title, :description, :priority, :group])
			#Make it work \/\/\/\/\/\/
			#Task.update(:group => current_user.group)
			#@task.group=current_user.group
			redirect_to task_path
		else
			render 'edit'
		end
	end

	def destroy
		@task=Task.find(params[:id])
		@task.destroy
		redirect_to tasks_path
	end

	def show
		@task=Task.find(params[:id])

		#JSON, TODO: figure out how to get those in android as a singular JSON. 
		#Maybe create it in index (! if whole data transfered !) and scrap the show page.

		respond_to do |format|
			format.html
			format.json{ render json: @task.as_json(except: [:updated_at])}
		end

	end

	def new
		@task=current_user.tasks.build
	end


end
