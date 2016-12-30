require 'grape'
require 'otr-activerecord'

class TestApi < Grape::API

  helpers do
    def testput
        puts '--------------------------------'
    end
  end
  
  format  :json
  get 'test' do
    {message:"hello world #{params[:name]}",status:1}
  end
  
  params do
     requires :avatar, type: File
  end
  
  post 'upload' do
    filename= params.avatar.filename # => 'avatar.png'
    #params.avatar.type     # => 'image/png'
    #params.avatar.tempfile # => #<File>
    #params.avatar.head
    #params.avatar
   f=File.open(filename,'w')
   f.binmode
   f.write(params.avatar.tempfile.read)
   f.close
  end
  
   post 'upload1' do
    testput
    filename= params[:avatar][:filename] # => 'avatar.png'
    #params.avatar.type     # => 'image/png'
    #params.avatar.tempfile # => #<File>
    #params.avatar.head
    #params.avatar
   f=File.open(filename,'w')
   f.binmode
   f.write(params[:avatar][:tempfile].read)
   f.close
  end
 

end 