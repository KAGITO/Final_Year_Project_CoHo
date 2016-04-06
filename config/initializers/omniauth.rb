Rails.application.config.middleware.use OmniAuth::Builder do 
   provider :facebook, '495970847257296', 'b88fa2c34e55c1a7a9ea3df0c6da6981'
end