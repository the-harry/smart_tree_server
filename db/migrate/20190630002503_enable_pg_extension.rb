class EnablePgExtension < ActiveRecord::Migration[5.2]
  def change
    enable_extension "plpgsql"
  end
end
