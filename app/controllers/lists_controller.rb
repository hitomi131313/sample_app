class ListsController < ApplicationController
  def new
    # View(new.html.erb)へ渡すためのインスタンス変数
    # インスタンス変数に空のModelオブジェクト(とは？)を生成する
    @list = List.new
  end


  # 最初にまとめてcreateアクションを作成しなかったのは、viewファイルに保存機能のcreateファイルはいらないから？
  # 対応するviewファイルがなくて受け渡しも必要ないから＠でインスタンス変数にする必要がなく、ローカル変数を利用
  def create
    # 入力されたデータを受け取り、そのデータをもとに、新規登録するためのインスタンスを作成
    # ↑のデータをデータベースに保存するために、↑で作成されたインスタンスにsaveメソッドを実行
    # top画面へ遷移(リダイレクト)
    list = List.new(list_params)
    list.save
    redirect_to list_path(list.id)
  end


  # indexでデータの一覧を表示する
  def index 
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  # privateは一種の境界線(⁼ここから下はこのcontrollerの中でしか呼び出せません)
  private
  # ストロングパラメータ(保存するデータの絞り込み)
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
