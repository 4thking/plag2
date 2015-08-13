class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_filter :landing_page
  before_action :authenticate_user!
  before_action :pass_test, only: [:show]
  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all
    @user = current_user
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @sections = Section.find(params[:id])
    @all_sections = Section.all
  end

  # GET /sections/new
  def new
    @section = Section.new
    @test = Test.all
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:title, :body, :test_id)
    end

    def landing_page
       @disable_nav = true
    end
    
    def pass_test
      @user = current_user
      passed_tests = current_user.pssed_sections
      if passed_tests.include?(@section.test_id)
        true
      else
        redirect_to :controller => :take_tests, :action => :show
      end
    end
end
