class CreateApplicationAuthorizations < ActiveRecord::Migration
  def change
    create_table :application_authorizations do |t|
      t.string :name
      t.string :client_id,      null: false
      t.text   :client_secret,  null: false
      t.string :scalus_slug,    null: false

      t.timestamps null: false
    end
  end
end
