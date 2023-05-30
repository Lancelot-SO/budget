class ExpensesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses.order('created_at DESC')
  end

  def new
    @expense = current_user.expenses.new
    @group = Group.find(params[:group_id])
  end

  def create
    @expense = current_user.expenses.new(expense_params.slice(:name, :amount))
    if @expense.save
      @expense_group = ExpenseGroup.new(expense_id: @expense.id, group_id: params[:expense][:group_id])

      redirect_to user_groups_path(current_user), notice: 'Expense created successfully' if @expense_group.save
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit!
  end
end
