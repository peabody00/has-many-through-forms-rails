class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  accepts_nested_attributes_for :categories


  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.post_categories.build(category: category) # Does this line do what the next line does?  This was already in the code.  Doesn't match example from lab.
      # self.categories << category
    end
  end

end
