class Image < ApplicationRecord
  mount_uploader :data, AssetUploader
end
