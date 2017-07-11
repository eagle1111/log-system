class Registration < ApplicationRecord

  STATUS = ["pending", "confirmed"]
  validates_inclusion_of :status, :in => STATUS
  validates_presence_of :status, :ticket_id, :department_id, :job_id

  attr_accessor :current_step
  validates_presence_of :name, :if => :should_validate_basic_data?
  validates_presence_of :name, :if => :should_validate_all_data?

  belongs_to :event
  belongs_to :ticket
  belongs_to :department
  belongs_to :job

  belongs_to :user, :optional => true

  before_validation :generate_uuid, :on => :create

  scope :by_status, ->(s){ where( :status => s ) }
  scope :by_ticket, ->(t){ where( :ticket_id => t ) }
  scope :by_department, ->(d){ where( :department_id => d ) }
  scope :by_job, ->(j){ where( :job_id => j ) }

  def to_param
    self.uuid
  end

  protected

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def should_validate_basic_data?
    current_step == 2  # 只有做到第二步需要验证
  end

  def should_validate_all_data?
    current_step == 3 || status == "confirmed"  # 做到第三步，或最后状态是 confirmed 时需要验证
  end

end
