# frozen_string_literal: true

# Module which allow to set and get manufacturer
module Factory
  def factory=(factory_name)
    @manufacturer = factory_name
  end

  def factory
    @manufacturer
  end

  @manufacturer = ''
end
