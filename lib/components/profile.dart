class Profile {
  final String name, image, username, password;

  final String webhook;

  Profile({this.username, this.password, this.name, this.image, this.webhook});
}

List<Profile> profiles = [
  Profile(
      username: 'test',
      password: 'test',
      image: 'assests/images/canadian.png',
      name: 'Khairi Baz',
      webhook:
          'https://discord.com/api/webhooks/848627891134005249/P1Vzqf_nPzBQ399p5kskXM4oeUGkC3xE5S3sm4mPm4UTeHja4VdBm7ObI1CMH7VW2LOL'),
];
