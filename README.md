# Show me the method

This tiny gem can pretty easy open the method you need in your favorite text
editor(Textmate only for now, PRs are welcome). I spend a lot of time in rails
console and I often have to see how some methods look like and now I can
do it easily:

    User.show_method(:find_by_sql)

or even

    ActiveRecord::ConnectionAdapters::Column.s :string_to_time

Nothing more, enjoy!
