get '/' do
  
  @tags = Tag.all
  @posts = Post.all.sort
  erb :index
end

post '/create_post' do
  post = Post.create(title: params[:title], body: params[:body])
  new_params = params[:tag].split(/\W | \b/)
  new_params.each do |new_tags|
  post.tags.create(tag: new_tags)
  end
   redirect '/'
end

get '/post/:id' do 
  @post = Post.find(params[:id])
  erb :post
end

post '/edit_post' do
  @post = Post.find(params[:id])
  @post.title = params[:title]
  @post.body = params[:body]
  new_params = params[:tag].split(/\W | \b/)
  new_params.each do |new_tags|
  @post.tags.create(tag: new_tags)
  end
  @post.save
    redirect '/'
end


# post '/delete_post' do
#   p params
#   @post = Post.find(params[:id])
#   @post.title = params[:title]
#   @post.body = params[:body]
#   new_params = params[:tag].split(/\W | \b/)
#   new_params.each do |new_tags|
#   @post.tags.create(tag: new_tags)
#   end
#   @post.save
#     redirect '/'
# end
post '/delete_post' do
  p params
  # @post = Post.find(params[:id])
  # @post.destroy
  Post.find(params[:id]).destroy
  redirect '/'
end
