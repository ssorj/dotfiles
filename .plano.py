#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

from plano import *

@command
def install():
    """
    Install and configure everything
    """

    install_packages()
    install_config()
    configure_gnome()

@command
def install_packages():
    packages = [
        "asciidoctor",
        "bat",
        "emacs",
        "emacs-goodies",
        "emacs-yaml-mode",
        "fedora-workstation-repositories",
        "git",
        "git-subrepo",
        "gnome-tweak-tool",
        "irssi",
        "podman-docker",
        "python-sphinx",
        "python-yaml",
        "ripgrep",
        "webp-pixbuf-loader",
        "vlgothic-fonts",
    ]

    run(f"sudo dnf -y install {' '.join(packages)}")

    run("sudo dnf -y config-manager --set-enabled google-chrome")

    try:
        # This currently fails on arm
        run("sudo dnf -y install google-chrome-stable")
    except:
        pass

@command
def install_config():
    save_dir = make_temp_dir()

    notice("Saving existing files to {}", save_dir)

    def install_link(source_file):
        target_file = join(get_home_dir(), source_file)
        source_file = get_absolute_path(source_file)

        if exists(target_file):
            move(target_file, save_dir)

        make_link(target_file, source_file)

    with working_dir("home"):
        # XXX Do for each .<file> instead
        install_link(".bashrc")
        install_link(".config/ghost/config.py")
        install_link(".config/systemd/user/flapjack.service")
        install_link(".emacs")
        install_link(".emacs.d/doc-mode.el")
        install_link(".emacs.d/markdown-mode.el")
        install_link(".gdbinit")
        install_link(".gitconfig")
        install_link(".npmrc")
        install_link(".terminfo/d/dumb-emacs-ansi")

@command
def configure_gnome():
    # Key bindings for switching workspaces
    #
    # Gnome 3.32 added a feature that broke my favorite keyboard shortcuts.
    # This disables the new feature and restores them to working order.
    #
    # https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/1828

    for i in range(1, 10):
        run(f"gsettings set org.gnome.shell.keybindings switch-to-application-{i} '[]'")
        run(f"gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-{i} '[\"<Super>{i}\"]'")

    # Key bindings for standard launchers

    run("gsettings set org.gnome.settings-daemon.plugins.media-keys www '[\"<Super>B\"]'")

    # Key bindings for custom launchers

    launchers = [
        {
            "name": "Terminal",
            "command": "/usr/bin/gnome-terminal",
            "binding": "<Super>T",
        },
        {
            "name": "Editor",
            "command": "/usr/bin/emacs",
            "binding": "<Super>E",
        },
        {
            "name": "Files",
            "command": "/usr/bin/nautilus",
            "binding": "<Super>F",
        },
    ]

    paths = [f"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom{i}/" for i in range(len(launchers))]
    paths_string = ", ".join(["\"{}\"".format(x) for x in paths])
    paths_string = "[{}]".format(paths_string)

    run("gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings '{}'".format(paths_string))

    for path, launcher in zip(paths, launchers):
        for key, value in launcher.items():
            run("gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:{} {} '{}'".format(path, key, value))

@command
def clean():
    remove(find(".", "__pycache__"))
