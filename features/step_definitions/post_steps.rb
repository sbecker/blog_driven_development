Given /^the following posts:$/ do |posts|
  posts.hashes.each do |post_hash|
    Post.create!(post_hash.merge(:password => "brian_and_scott"))
  end
end

When /^I delete the (\d+)(?:st|nd|rd|th) post$/ do |pos|
  visit posts_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see textilized "([^\"]*)"$/ do |textile|
  textiled = RedCloth.new(textile).to_html
  response.body.include?(textiled).should be_true
end

Then /^I should see the following posts:$/ do |posts|
  posts.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      if j == 0
        response.should have_selector("ul[id=posts] > li:nth-child(#{i+1}) a") do |a|
          a.inner_text.should contain(cell)
        end
      else
        response.should have_selector("ul[id=posts] > li:nth-child(#{i+1}) div[class=body]") do |div|
          div.inner_text.should contain(cell)
        end
      end
    end
  end
end
