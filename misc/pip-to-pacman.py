import subprocess

pip = subprocess.Popen(["pip3", "freeze", "--user"], stdout=subprocess.PIPE)
out, err = pip.communicate()
out = [pkg.split('=')[0] for pkg in out.decode().split()]
not_found = []
install = ""
uninstall = ""
for pkg in out:
    try:
        pac_pkg = list(filter(
            lambda pac_pkg: ("python-" + pkg.lower()) in pac_pkg,
            subprocess.Popen(
                ["pacman", "-Sspq", pkg], stdout=subprocess.PIPE)
            .communicate()[0].decode().split()))[0]
        install += pac_pkg + " "
        uninstall += pkg + " "
        # print("{} - {}".format(pkg, pac_pkg))
    except IndexError:
        not_found.append(pkg)

print("pacman -S " + install)
print("pip3 uninstall " + uninstall)
