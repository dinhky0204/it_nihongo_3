RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  # config.included_models = ["like", "comment", "notification", "game_genre"]

  config.actions do
    dashboard
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.default_items_per_page = 10

  config.model 'Review' do
    list do
      field :title
      field :user
      field :game
      field :like, :integer do 
        def value
          bindings[:object].likes.count
        end
      end
      field :comment, :integer do 
        def value
          bindings[:object].review_comments.count
        end
      end
      field :created_at
      
    end
  end

  config.model 'Game' do
    list do
      field :name
      field :story
      field :guide
      field :publisher
      field :view
      field :review, :integer do
        def value
          bindings[:object].reviews.count
        end
      end
    end
  end

  config.model 'Genre' do
    list do
      field :name
      field :game, :integer do
        def value
          bindings[:object].games.count
        end
      end
      field :created_at
      field :updated_at
    end
  end

  config.model 'User' do
    list do
      field :email
      field :name
      field :avatar
      field :is_admin
      field :address
      field :birthday
      field :followings, :integer do
        def value
          bindings[:object].following.count
        end
      end
      field :followers, :integer do
        def value
          bindings[:object].followers.count
        end
      end
      field :like, :integer do
        def value
          bindings[:object].likes.count
        end
      end
      field :created_at
      field :updated_at
    end
  end

end
