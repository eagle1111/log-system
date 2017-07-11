module Admin::EventsHelper
  def registration_filters(options)
    params.permit(:status, :ticket_id, :department_id, :job_id).merge(options)
  end
end
