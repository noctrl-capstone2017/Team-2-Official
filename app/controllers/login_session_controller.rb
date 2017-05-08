class LoginSessionController < ApplicationController
   is_impressionable
   impressionist actions: [:show], unique: [:session_hash]
end
