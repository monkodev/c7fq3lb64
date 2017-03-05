class ExpensesController < ApplicationController
	before_action :authenticate_user!
  def index

  		@expenses = Expense.order("date DESC")
  		@expenses = Expense.where("user_id = ?",current_user)
  		#@expenses = Expense.where("user_id = ?",1)
     	if params[:concept].present?
     		@expenses=@expenses.where("concept LIKE ?","%#{params[:concept]}%")
		end	
		if params[:category_id].present?
     		@expenses = @expenses.where("category_id = ?", params[:category_id])
     	end
   end
end
