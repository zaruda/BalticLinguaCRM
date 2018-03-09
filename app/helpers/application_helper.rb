module ApplicationHelper
  def self.delete_attachment(file)
    file.purge_later
  end
end
