class Admin::EventDepartmentsController < ApplicationController
  layout "admin"

  before_action :find_event

   def index
     @departments = @event.departments
   end

   def new
     @department = @event.departments.new
   end

   def create
     @department = @event.departments.new(department_params)
     if @department.save
       redirect_to admin_event_departments_path(@event)
     else
       render "new"
     end
   end

   def edit
     @department = @event.departments.find(params[:id])
   end

   def update
     @department = @event.departments.find(params[:id])

     if @department.update(department_params)
       redirect_to admin_event_departments_path(@event)
     else
       render "edit"
     end
   end

   def destroy
     @department = @event.departments.find(params[:id])
     @department.destroy

     redirect_to admin_event_departments_path(@event)
   end

   protected

   def find_event
     @event = Event.find_by_friendly_id!(params[:event_id])
   end

   def department_params
     params.require(:department).permit(:name, :description)
   end
end
