class AddShortenedUrlToWebsites < ActiveRecord::Migration[5.2]
  def change
    add_column :websites, :shortened_url, :string
  end
end
