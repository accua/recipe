require('spec_helper')

describe(PrepList) do
  it {should belong_to(:recipe)}
  it {should belong_to(:ingredient)}
end
