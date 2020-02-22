import os
import os.path as path
import shutil


repo_dir = path.realpath(path.join(__file__, '../..'))
home_dir = os.environ['HOME']

home_src = path.join(repo_dir, 'home')

for root, dirs, files in os.walk(home_src):
    rel_file_dir = path.relpath(root, home_src)
    os.makedirs(path.join(home_dir, rel_file_dir), exist_ok=True)

    for file in files:
        src_file_path = path.join(root, file)
        dst_file_path = path.join(home_dir, rel_file_dir, file)

        if path.islink(dst_file_path):
            os.unlink(dst_file_path)
        elif path.isfile(dst_file_path):
            os.remove(dst_file_path)
        
        shutil.copyfile(src_file_path, dst_file_path)
