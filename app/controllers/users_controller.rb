
class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets
  end
end


#pictweetにてトップページからツイート詳細ページにジャンプし、そこでコメントを投稿する際の、tweet_idの受け渡しを、paramsに着目してまとめました。トップページのリンクにtweetsコントローラーshowアクションへのprefixを指定し、tweet_idが代入されることで、paramsを介してshowアクションへ渡され、いったん@tweetにレコードそのものとして格納されます。show.html.erbに、@tweet、@commentが親子関係を示してmodel:キーに渡されたform_withを記述しておきます。railsはform_withからのデータを、ネスト、アソシエーションが示されている場合には、@tweetsのidをtweet_idとしてcreateアクションへ渡します。createアクションは、それをうけ、つくられるcommentの所属するtweetとして記録します。