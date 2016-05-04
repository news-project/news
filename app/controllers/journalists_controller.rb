class JournalistsController < ApplicationController
  def index
    @journalists = [
      {name: "주진우 기자", publisher: "시사IN", clarity: "+234", num_comments: "23", num_views: "1234", num_articles: "1444", img_url: "https://upload.wikimedia.org/wikipedia/ko/archive/6/6e/20121016024552!JJW.JPG"},
      {name: "홍성호 기자", publisher: "조선일보", clarity: "+2", num_comments: "223", num_views: "12234", num_articles: "141", img_url: "http://sgsg.hankyung.com/pdsdata/sgsg.hankyung.com/images/photo/201604/01.11487065.1.jpg"},
      {name: "한보람 디자이너", publisher: "한겨례", clarity: "-123", num_comments: "2333", num_views: "5555", num_articles: "12", img_url: "http://www.ginnews.kr/data/ginnews_kr/mainimages/201307/2013061858463680.jpg"}
    ]    


  end
end   