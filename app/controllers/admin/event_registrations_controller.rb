class Admin::EventRegistrationsController < ApplicationController
  layout "admin"
  before_action :find_event

  def index
      @q = @event.registrations.ransack(params[:q])

      @registrations = @q.result.includes(:ticket, :department, :job).order("id DESC").page(params[:page]).per(10)

      if Array(params[:statuses]).any?
        @registrations = @registrations.by_status(params[:statuses])
      end

      if Array(params[:ticket_ids]).any?
        @registrations = @registrations.by_ticket(params[:ticket_ids])
      end

      if Array(params[:job_ids]).any?
        @registrations = @registrations.by_job(params[:job_ids])
      end

      if params[:start_on].present?
        @registrations = @registrations.where( "created_at >= ?", Date.parse(params[:start_on]).beginning_of_day )
      end

      if params[:end_on].present?
        @registrations = @registrations.where( "created_at <= ?", Date.parse(params[:end_on]).end_of_day )
      end

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
