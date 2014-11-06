namespace :mytask do
  desc "mytask"

  task :create_test_data => :environment do
    Entry.delete_all
    Comment.delete_all

    e1 = Entry.new(title: 'はじめてのエントリー', body: 'はじめまして！')
    e1.save

    c1 = e1.comments.build
    c1.body = 'てすてす'
    c1.status = 'approved'

    c2 = e1.comments.build
    c2.body = 'どうもどうも'
    c2.status = 'unapproved'
    c2.save

    Entry.create(title: '２番目のエントリー', body: 'おひさしぶりです！')

    e3 = Entry.new(title: '３番目のエントリー', body: 'もうくじけました・・・')
    e3.save

    c3 = e3.comments.build
    c3.body = 'こんにちはこんにちは！'
    c3.status = 'approved'
    c3.save
  end

  task :comments_of_entry1 => :environment do
    entry1 = Entry.find(1)
    entry1.comments
  end

  task :status_eq_unapproved => :environment do
    Entry.joins(:comments).where("comments.status = 'unapproved'")
  end
end
