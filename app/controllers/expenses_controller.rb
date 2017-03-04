class ExpensesController < ApplicationController
  def index
  		@expenses = Expense.order("date DESC")
  		@expenses = Expense.where("user_id = ?",params[:user_id])
     	if params[:concept].present?
     		@expenses=@expenses.where("concept LIKE ?","%#{params[:concept]}%")
		end	
		if params[:category_id].present?
     		@expenses = @expenses.where("category_id = ?", params[:category_id])
     	end
   end
end
