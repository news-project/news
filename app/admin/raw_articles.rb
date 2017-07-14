ActiveAdmin.register RawArticle do
  index do
    column :id
    column :press
    column 'Title' do |raw_article|
      link_to(raw_article.title, raw_article.link, target: '_blank')
    end
    actions
  end

  form do


  end
end
