class Admin::EventJobsController < ApplicationController
  layout "admin"
  before_action :find_event

   def index
     @jobs = @event.jobs
   end

   def new
     @job = @event.jobs.new
   end

   def create
     @job = @event.jobs.new(job_params)
     if @job.save
       redirect_to admin_event_jobs_path(@event)
     else
       render "new"
     end
   end

   def edit
     @job = @event.jobs.find(params[:id])
   end

   def update
     @job = @event.jobs.find(params[:id])

     if @job.update(job_params)
       redirect_to admin_event_jobs_path(@event)
     else
       render "edit"
     end
   end

   def destroy
     @job = @event.jobs.find(params[:id])
     @job.destroy

     redirect_to admin_event_jobs_path(@event)
   end

   protected

   def find_event
     @event = Event.find_by_friendly_id!(params[:event_id])
   end

   def job_params
     params.require(:job).permit(:name, :description)
   end
end
