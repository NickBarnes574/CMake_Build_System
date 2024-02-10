import cmd
import paramiko
from scp import SCPClient


class SCPShell(cmd.Cmd):
    intro = "Welcome to the SCP shell. Type help or ? to list commands.\n"
    prompt = "(scp) "

    def __init__(self):
        super(SCPShell, self).__init__()
        self.ssh = None
        self.scp = None

    def do_connect(self, args):
        """Connect to a device: connect <hostname> <username> <password>"""
        try:
            hostname, username, password = args.split()
            self.ssh = paramiko.SSHClient()
            self.ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            self.ssh.connect(hostname, username=username, password=password)
            self.scp = SCPClient(self.ssh.get_transport())
            print("Connected to", hostname)
        except ValueError:
            print("Invalid arguments. Usage: connect <hostname> <username> <password>")
        except Exception as e:
            print("Failed to connect:", e)

    def do_put(self, args):
        """Copy a file to the device: put <local_path> <remote_path>"""
        if not self.scp:
            print("Not connected. Use 'connect' first.")
            return
        try:
            local_path, remote_path = args.split()
            self.scp.put(local_path, remote_path)
            print(f"File {local_path} copied to {remote_path}")
        except ValueError:
            print("Invalid arguments. Usage: put <local_path> <remote_path>")
        except Exception as e:
            print("Failed to copy file:", e)

    def do_get(self, args):
        """Retrieve a file from the device: get <remote_path> <local_path>"""
        if not self.scp:
            print("Not connected. Use 'connect' first.")
            return
        try:
            remote_path, local_path = args.split()
            self.scp.get(remote_path, local_path)
            print(f"File {remote_path} retrieved to {local_path}")
        except ValueError:
            print("Invalid arguments. Usage: get <remote_path> <local_path>")
        except Exception as e:
            print("Failed to retrieve file:", e)

    def do_exit(self, _):
        """Exit the SCP shell"""
        if self.scp:
            self.scp.close()
        if self.ssh:
            self.ssh.close()
        print("Goodbye!")
        return True

    def do_EOF(self, line):
        return self.do_exit(line)


if __name__ == "__main__":
    SCPShell().cmdloop()
