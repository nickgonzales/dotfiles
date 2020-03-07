import os
import util


home_dir = os.environ['HOME']
home_src = os.path.join(util.repo_dir, 'home')

util.copy_recursive_with_replace(home_src, home_dir)
