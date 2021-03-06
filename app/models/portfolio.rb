class Portfolio < ApplicationRecord
  validates :url, presence: true,
                  length: { in: 3..30 },
                  uniqueness: true
  validates_format_of :url, with: /\A[-a-z0-9_]+\z/,
                            message: 'must only contain lowercase alphanumeric characters, hyphens, or underscores'
  validates :color_one, :color_two, :color_three, :color_four, :font_color_one, :font_color_two,
            css_hex_color: true
  validates :theme, inclusion: { in: Themes.array }
  belongs_to :user
  has_many :projects, dependent: :delete_all
  has_many :technologies, dependent: :delete_all
  has_one :portfolio_header, dependent: :delete
  has_one :about, dependent: :delete
end
