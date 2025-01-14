class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :ensure_pending_status, only: [:edit, :update, :destroy]

  # GET /employees or /employees.json
  def index
    if params[:status] == 'Verified'
      @employees = Employee.where(status: 'Verified')
    elsif params[:status] == 'Pending Verification'
      @employees = Employee.where(status: 'Pending Verification')
    else
      @employees = Employee.all
    end
  end


  # GET /employees/1 or /employees/1.json
  def show
    @employee = Employee.find(params[:id])
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    @employee.generate_employee_id

    if @employee.invalid?
      puts "Validation errors: #{@employee.errors.full_messages}"  # Debugging line
    end

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy!

    respond_to do |format|
      format.html { redirect_to employees_path, status: :see_other, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:full_name, :email, :position, :department, :status, :phone_number, :employee_id, :emergency_contact, :date_of_joining)
    end

    def ensure_pending_status
      if @employee.status == 'Verified'
        redirect_to employees_path, alert: 'Verified employees cannot be edited or deleted'
      end
    end
end
