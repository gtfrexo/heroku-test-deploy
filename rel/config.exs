use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :dev

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"va]TZh_G4`v/*3=_gdbV~`(NqzhcMwT_vAmS/T~8R81/8monG@&]mqlo44k~B>Z3"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"Uix@,7hkXcFf)Qo}Q64HORo%)Ol=9W_~P`lycf@@d]EShZ}4cavrJ5,_Jh05w;6:"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :database do
  set version: current_version(:database)
end

