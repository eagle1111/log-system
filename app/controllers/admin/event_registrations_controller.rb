class Admin::EventRegistrationsController < ApplicationController
  layout "admin"
  before_action :find_event

   def index
     @registrations = @event.registrations.includes(:ticket, :department, :job).order("id DESC").page(params[:page]).per(10)
   end

   def destroy
     @registration = @event.registrations.find_by_uuid(params[:id])
     @registration.destroy

     redirect_to admin_event_registrations_path(@event)
   end

   protected

   def find_event
     @event = Event.find_by_friendly_id!(params[:event_id])
   end

   def registration_params
     params.require(:registration).permit(:status, :ticket_id, :department_id, :job_id, :name, :email, :cellphone, :description)
   end

end
