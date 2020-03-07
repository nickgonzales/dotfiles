import os
import os.path as path
import shutil


repo_dir = path.realpath(path.join(__file__, '../..'))


def copy_recursive_with_replace(src, dst):
    for root, _, files in os.walk(src):
        rel_file_dir = path.relpath(root, src)
        os.makedirs(path.join(dst, rel_file_dir), exist_ok=True)

        for file in files:
            src_file_path = path.join(root, file)
            dst_file_path = path.join(dst, rel_file_dir, file)

            if path.islink(dst_file_path):
                os.unlink(dst_file_path)
            elif path.isfile(dst_file_path):
                os.remove(dst_file_path)
            
            shutil.copyfile(src_file_path, dst_file_path)
