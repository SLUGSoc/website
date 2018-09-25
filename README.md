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

Copy the output of `rails secret` and run `rails credentials:edit`. Reset the existing `secret_key_base` to this new value, save, and exit.

Create [Twitter](https://apps.twitter.com/) and [Facebook](https://developers.facebook.com)  developer apps using those services'
developer sites. They should give you the following credentials, which you should set to these environment variables:

```
TWITTER_CONSUMER_KEY
TWITTER_CONSUMER_SECRET
TWITTER_ACCESS_TOKEN
TWITTER_ACCESS_TOKEN_SECRET
FACEBOOK_USER_ACCESS_TOKEN
FACEBOOK_PAGE_ID
```

You will also want to create a webhook for your Discord server. You can do this under Server Settings > Webhooks if you have the correct permissions. Set the environment variable `DISCORD_WEBHOOK_URL` to this URL.

Run the following:

```
bundle install # This installs all dependencies
rails db:setup # This creates and seeds the database with data
rails s        # This starts the server
```

You'll then be able to access the site at localhost:3000.

## Usage

The site is front-facing and gets seeded with a lot of data for this purpose by
default, including:

- Platforms
- Some games
- Links between the two, which are called 'releases'
- A 'code' of rules, being the LAN rules

In order to change any of this from the frontend, you'll need to go to
`/users/sign_in` and sign in.

### Seeding accounts

There is no default account seeded (at present) -
you'll need to enter the Rails console (`rails c`) and run this command:

```
User.create(email: '<your email>', password: '<a secure(!!) password>')
```

Substitute `<your email>` and `<a secure password>` for...well, those things
exactly.

Use this to create accounts for the rest of the committee, setting some default password that they can reset using the site's Forgot Password functionality..
