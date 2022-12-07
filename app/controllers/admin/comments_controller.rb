class Admin::CommentsController < ApplicationController
  @comments= Comment.all
end
