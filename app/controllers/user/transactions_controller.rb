class User::TransactionsController < User::BaseController
  before_action :find_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all
    @transactionitems = TransactionItem.all
  end

  def new
    @transaction = Transaction.new
    @transaction.transaction_items.new
  end
  
  def create
    @transaction = current_user.transactions.new(transaction_params)
    if @transaction.save
      redirect_to user_transactions_path, notice: '完成一筆帳目新增'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      # byebug
      redirect_to user_transactions_path, notice: '完成一筆帳目更新'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to user_transactions_path, notice: '完成一筆帳目刪除'
  end

  private

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:invoice_num, :invoice_photo, :amount, :status, :data, transaction_items_attributes: [:id, :title, :quantity, :price, :total])
  end
end