class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by_friendly_id!(params[:id])
    @registrations = @event.registrations.includes(:ticket, :department, :job).order("id DESC").page(params[:page]).per(10)

    if Array(params[:statuses]).any?
      @registrations = @registrations.by_status(params[:statuses])
    end

    if Array(params[:ticket_ids]).any?
      @registrations = @registrations.by_ticket(params[:ticket_ids])
    end

    if Array(params[:job_ids]).any?
      @registrations = @registrations.by_job(params[:job_ids])
    end
  end
end
