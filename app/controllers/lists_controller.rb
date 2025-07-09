class ListsController < ApplicationController

  def new
    # View(new.html.erb)へ渡すためのインスタンス変数
    # インスタンス変数に空のModelオブジェクト(とは？)を生成する
    @list = List.new
  end


  def create
    # 入力されたデータを受け取り、そのデータをもとに、新規登録するためのインスタンスを作成
    # ↑のデータをデータベースに保存するために、↑で作成されたインスタンスにsaveメソッドを実行
    # show画面遷移(リダイレクト) show-routes
    list = List.new(list_params)
    list.save
    redirect_to list_path(list.id)
  end


  def index 
    @lists = List.all
  end


  def show
    @list = List.find(params[:id])
  end


  def edit
    @list = List.find(params[:id])
  end


  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end


  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end



  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
