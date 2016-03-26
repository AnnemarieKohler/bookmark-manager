class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(
      url: params[:url],
      title: params[:title])
    tags = Tag.make_tags(params[:tags])
    tags.each do |name|
      tag = Tag.create(tag: name)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end
end
