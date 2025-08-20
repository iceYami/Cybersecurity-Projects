import nfspy
import os
mount_point = '/mnt/nfs_share'
client = nfspy.NFSClient()
client.mount('nfsserver:/remote/share', mount_point)
files = os.listdir(mount_point)
print("Archivos en sistema de archivos remoto:")
for file in files:
    print(file)
client.umount(mount_point)
