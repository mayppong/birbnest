# Birbnest
[![Build Status](https://travis-ci.org/mayppong/birbnest.png)](https://travis-ci.org/mayppong/birbnest)

Birbnest is a plug's Store implementation using Agent. This allows you to store your session data in a process which can be directly messaged in a distributed network unlike ETS.

## Usage

  1. Add `birbnest` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:birbnest, "~> 0.1"}]
    end
    ```

  2. Ensure `birbnest` is started before your application:

    ```elixir
    def application do
      [applications: [:birbnest]]
    end
    ```

  3. If you are using [Phoenix Framework](https://github.com/phoenixframework/phoenix),
     you need to change the Session plug setting in the application's Endpoint module.

    ```elixir
    plug Plug.Session,
      store: Birbnest.Nest
    ```


## Contributing

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
