# scalus.com's API SAMPLE APP

Sample ruby on rails app to connect to scalus.com API

First, we need to add the `oauth2` gem to the Gemfile

```
config.filter_parameters += [:access_token,
                              :refresh_token
                            ]
```


# Store your SCALUS_CLIENT_SECRET

## Keep your SCALUS_CLIENT_SECRET secure

When you store your client secret token be sure to keep it secure.

We advice you to encrypt the secret token.  In rails you can do the following to encrypt the token:

    key = 'some_random_very_long_string_of_charcters'                      # Securely stored in config/secrets.yml
    crypt = ActiveSupport::MessageEncryptor.new(key)                       # => #<ActiveSupport::MessageEncryptor ...>
    encrypted_data = crypt.encrypt_and_sign('my secret data')              # => "NlFBTTMwOUV5UlA1QlNEN2xkY2d6eThYWWh..."

Then to decrypt the data do the following:

    key = 'some_random_very_long_string_of_charcters'                      # Securely stored in config/secrets.yml
    crypt = ActiveSupport::MessageEncryptor.new(key)                       # => #<ActiveSupport::MessageEncryptor ...>
    crypt.decrypt_and_verify(encrypted_data)                               # => "my secret data"

Look at `lib/encryption_helper.rb` & `config/secrets.yml` in this sample app for code that will keep your data secure.

## Attain your application's access token

This is not to be confused with an access token for a user in your application.  Before your user can be authorized your application environment must be authorized to connect to scalus.com.

- this app stores the encrypted SCALUS_CLIENT_SECRET & SCALUS_CLIENT_ID in the ApplicationAuthorization model.

'a3967bfe9eb7bfc2986fbc042f99028fda9e5c3fb641e2ca439c9305f5fabae3'

