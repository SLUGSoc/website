# website-2

This is the new and improved SLUGS (Sheffield University Gaming Society)
website, now running on Ruby on Rails. It gives committee members a platform
to create and share events, update their committee profiles, manage codes of
conduct for the society and LANs, and more.

## Features

- Add event details to the site so that members can go to events
- Update committee profiles so new joiners know some friendly faces
- Manage the platforms and games we own, and attach them to events
- Update and edit rules we keep in place, such as the LAN rules and consitution

## Installation

First and most importantly, **reset the secret key base**. `config/credentials.yml.enc` is in the repository and, if left unchanged, this may leave the system vulnerable.

Remove the credentials file above and run `docker-compose run --rm -e EDITOR="vi" web rails credentials:edit`. Exit by pressing `:` and `q` in sequence to create the new credentials file and associated master key.

Create [Twitter](https://apps.twitter.com/) and [Facebook](https://developers.facebook.com)  developer apps using those services'
developer sites. They should give you the following credentials, which you should set to these environment variables in `.env`:

```
TWITTER_CONSUMER_KEY
TWITTER_CONSUMER_SECRET
TWITTER_ACCESS_TOKEN
TWITTER_ACCESS_TOKEN_SECRET
FACEBOOK_USER_ACCESS_TOKEN
FACEBOOK_PAGE_ID
```

You will also want to create a webhook for your Discord server. You can do this under Server Settings > Webhooks if you have the correct permissions. Set the environment variable `DISCORD_WEBHOOK_URL` to this URL.

You will also want to define the environment you're running the site in as `RAILS_ENV`, either to `development` or `production`.

Run `docker-compose run --rm web rails db:setup` in the directory to seed the site database with the default data. **This only needs to be done on the first run.**

Run `docker-compose up -d` in the directory to expose the site on port 3000 of your local machine.

You'll then be able to access the site at localhost:3000.

To update the site, run `git pull` to retrieve the latest code from the [master branch](https://github.com/SLUGSoc/website/tree/master).

## Usage

The site is front-facing and gets seeded with a lot of data for this purpose by
default, including:

- Platforms
- Some games
- Links between the two, which are called 'releases'
- A 'code' of rules, being the LAN rules

In order to change any of this from the frontend, you'll need to go to
`/users/sign_in` and sign in.

1. Go to [slugsoc.co.uk/users/sign_in](https://slugsoc.co.uk/users/sign_in)
2. Use the admin dropdown to find what you want to add/edit/remove.

### Sections

#### [Events](https://slugsoc.co.uk/admin/events)

Add an event to the SLUGS site and it'll appear:

- on the [homepage](https://slugsoc.co.uk), if it's one of the next three events to happen
- on the [events](https://slugsoc.co.uk/events) page

If you check the 'Post to:' boxes when creating a new event, the event will be posted to:

- our Facebook page, if you check the Facebook box
- our Twitter page, if you check the Twitter box
- `#soc-announcements` in Discord as Snailbot, if you check the Discord box

Wait for the page to finish loading to ensure this happens smoothly once you've hit the Submit button.

#### [Games](https://slugsoc.co.uk/admin/games)

Add a game to the SLUGS site and you'll be able to:

- create a Release for it, so that when it's attached to an event it'll be tagged with whichever platform(s) it is playable on
- attach it to an event

When adding a game, ensure that the title is absolutely correct. For example...

✓ Tom Clancy's Rainbow Six Siege

✗ R6: Siege

✓ A Hat In Time

✗ hat in Time

✓ FEZ

✗ Fez

This does a lot for our image!...and I'm personally pretty pedantic about it, so... --@boardfish

#### [Platforms](https://slugsoc.co.uk/admin/platforms)

Add a platform to the SLUGS site and you'll be able to:

- list all games on that platform
- tag games with that platform

When adding a platform (which you won't need to do often), check the [theme-colors](https://github.com/SLUGSoc/website/blob/master/app/assets/stylesheets/application.scss) array to see if it's got a color, and if not, make a pull request to add it or raise it with a Tech Officer.

Theme colors are found automatically from the name of the platform, so for example `PlayStation 4` would map to color `playstation-4`. If you want to see what you'd get, you can probably gamble on your input coming back in `kebab-case`, but if you want to be 100% sure, then:

- make sure you've got Ruby installed locally, along with the ActiveSupport gem (it's part of Rails)
- run an `irb` console with `irb`

```
2.5.1 :003 > require 'active_support/all'
 => true
2.5.1 :004 > 'string'.parameterize
 => "string"
2.5.1 :005 > 'Super Nintendo Entertainment System'.parameterize
 => "super-nintendo-entertainment-system"
```

#### [Codes of Conduct](https://slugsoc.co.uk/admin/codes)

Add a Code of Conduct to the SLUGS site and you'll be able to:

- add rules to that code of conduct
- edit the rules within it
- display it somewhere

The site is seeded with one Code of Conduct by default, being the LAN rules. These are visible from [the LAN page](https://slugsoc.co.uk/lan).

When each Rule is clicked, it expands to reveal its full content. The idea is that you have an all-encompassing summary as the title, and the details in the full text.

When writing a Rule, **be careful not to conceal vital information**. For example, a good rule would be:

```
COMPARE HANDS WITH YOUR OPPONENT. HIGHEST SCORE SURVIVES.
Compare the cards in your hand with your opponent's cards. Whoever has the highest total stays in the game. In the event of a tie, both players stay in the game.
```

For this example, the mention of a tie doesn't change the rules in a standard situation, but is helpful to ensure clarity.

#### [Sponsors](https://slugsoc.co.uk/admin/sponsors)

Add a Sponsor to the SLUGS site and they'll be visible at the bottom of the homepage. All Sponsors are listed there, along with their social links and a small paragraph detailing who they are and what they do.

It's important that the sponsor's blurb is inviting and describes what they do well enough. It should also detail what they do for us as a society.

**Don't disclose any details of agreements we have with sponsors** in this section, particularly with reference to money.

**Don't list sponsors that we haven't formally hit a deal with yet**. Ideally, wait until they've done something for us.

#### [Committee](https://slugsoc.co.uk/admin/members)

Add a Committee Member to the SLUGS site and they'll be visible at the [committee page](https://slugsoc.co.uk/committee). Each committee member should have a blurb introducing themselves, including:

- their name
- their occupation (course/job)
- which games they enjoy playing
- any other hobbies they enjoy

Keep this informal, but grammatically correct. Don't include anything vulgar or offensive.

Other society members should not edit or remove others' pages without consent. *An update will come to the site that will grant each committee member full ownership of their own page.*

When adding images, we'll want these to be hosted from the site - send one to a tech, and they'll add it to the site for you.

#### [Accounts](https://slugsoc.co.uk/admin/accounts)

Add an Account to the SLUGS site and they'll be visible on a Committee member's profile. An Account represents a committee member's account on a service such as Discord or PlayStation Network, and makes it easier for society members to add or get in touch with them for whatever reason.

#### [Servers](https://slugsoc.co.uk/admin/servers)

Add a Server to the SLUGS site and it'll be visible on the homepage. *An update will come to the site that will check that each server is live.*

### Seeding accounts

There is no default account seeded (at present) - you'll need to enter the Rails console (`docker-compose run web rails c`) and run this command:

```
User.create(email: '<your email>', password: '<a secure(!!) password>')
```

Substitute `<your email>` and `<a secure password>` for...well, those things
exactly.

Use this to create accounts for the rest of the committee, setting some default password that they can reset using the site's Forgot Password functionality. *This is not currently functional in production.* They can also ask a capable Tech Officer to reset the password. For a Tech Officer, a typical password reset might look like this:

```
└─[$] dc run --rm web rails c                                                                                                         [10:18:08]
Starting slugs-website_db_1 ... done
Running via Spring preloader in process 29
Loading development environment (Rails 5.2.1)
irb(main):001:0> u = User.find_by(email: 'si@mon.fish')
  User Load (2.5ms)  SELECT  "users".* FROM "users" WHERE "users"."email" = ? LIMIT ?  [["email", "si@mon.fish"], ["LIMIT", 1]]
=> #<User id: 1, email: "si@mon.fish", created_at: "2018-10-02 13:05:08", updated_at: "2018-10-02 13:05:17">
irb(main):002:0> u.password = 'new password'
=> "new password"
irb(main):003:0> u.save
   (0.1ms)  begin transaction
  User Update (10.5ms)  UPDATE "users" SET "encrypted_password" = ?, "updated_at" = ? WHERE "users"."id" = ?  [["encrypted_password", "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"], ["updated_at", "2018-10-05 09:37:11.020407"], ["id", 1]]
   (25.9ms)  commit transaction
=> true
```

Essentially:

1. Use `u = User.find_by(email: '<email>')` to get the user
2. Use `u.password = '<password>'` to set the new password
3. Use `u.save` to save the change you have made. Expect this to return `true` for the change to have been made successfully.
