class ExpensesController < ApplicationController
  before_action :require_user

  def index
    return if current_user.expenses.size.zero?

    redirect_to root_path if session[:author_id].nil?
    @expenses = current_user.expenses.where(author_id: session[:author_id]).includes(groups: [image_attachment: :blob])
    @expenses = @expenses.filter { |expense| !expense.groups.empty? }
  end

  def external
    return if current_user.expenses.size.zero?

    @expenses = current_user.expenses.includes(%i[groups author]).select do |expense|
      expense.groups.exists? && expense.author.id == session[:author_id]
    end
  end

  def new
    @expense = Expense.new
    @groups = current_user.groups
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    @group = Group.find_by(id: group_params[:group_id])
    @expense.groups << @group unless @group.nil?

    if @expense.save
      flash[:success] = 'Expense created successfully!'
      redirect_to expenses_path
    else
      flash.now[:error] = @expense.errors.full_messages
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def group_params
    params.require(:expense).permit(:group_id)
  end
end
