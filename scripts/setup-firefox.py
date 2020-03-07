import configparser
import os
import util


firefox_dir = os.path.join(os.getenv('HOME'), '.mozilla', 'firefox')
profile_ini_path = os.path.join(firefox_dir, 'profiles.ini')

profile = configparser.ConfigParser()
profile.read(profile_ini_path)
profile_dir = os.path.normpath(os.path.join(firefox_dir, profile.get('Profile0', 'Path')))

util.copy_recursive_with_replace(os.path.join(util.repo_dir, 'firefox'), profile_dir)
