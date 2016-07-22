# sinatra-dinner-party

  This Sinatra and ActiveRecord driven app relies on Rack to host a website for Supper Club Reservations. Currently the app supports separate user accounts, the ability to make reservations, and the ability to leave comments on reservations and dishes served.

## Install

  Clone the repo, run rake db:migrate, run shotgun (with the options that make sense for your environemnt) and you're set. Admin functions (creating dinners and dishes) are currently only supported via command line so you'll need to create separate migrations or use an app like Tux to directly access the database.

## Usage

  Navigate to your shotgun host address and you should see the welcome page.

## Contributing

  Log an issue or leave a comment via GitHub at https://github.com/joelim01/sinatra-dinner-party. Feel free to fork.

## License

  The gem is available as open source under the terms of the [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.en.html).
