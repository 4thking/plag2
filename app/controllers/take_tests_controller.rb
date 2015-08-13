class TakeTestsController < ApplicationController
  #before_action :set_take_test, only: [:show, :edit, :update, :destroy]
  

  #SPEC: 7.1.1.2: Adding Create action
 
  def show
    @section = Section.find(params[:id])
    session[:section] = @section.id
    @test    = Test.find(@section.test_id)
    @test_id    = @test.id
    session[:test_id] = @test_id   

    @user = current_user
    if @user.pssed_sections.include?(@test_id)
      flash[:info] = "Already passed"
    end
  end
  
  
  def check
    @user = current_user
    @section = session[:section]
    @test_id = session[:test_id]
    @wrong_answers = []
    params.delete :utf8
    params.delete :authenticity_token
    params.delete :commit
    params.delete :controller
    params.delete :action
    params.each do |question, answer|      
      solution = Answer.find(answer)
      if solution.correct == false
        @wrong_answer = solution.id
      end
    end
    if @wrong_answer == nil
      flash[:info] = "all correct"
      user = User.find(@user.id)
      @test_array =*1..@test_id
      user.update_attribute :pssed_sections, @test_array    
        redirect_to :controller => :sections ,:action => :show, :id => @section  and return
      else
        flash[:info] = "Wrong Answers"
        redirect_to :back and return
      end
    
    
  end 

end