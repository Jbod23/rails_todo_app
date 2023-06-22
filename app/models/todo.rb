class Todo < ApplicationRecord

  has_many :notes, dependent: :destroy

    before_save :set_content_updated_at
    def set_content_updated_at
      if self.new_record? || (self.changed? && !self.completed_changed?)
        self.content_updated_at = Time.current
      end
    end
  end
  