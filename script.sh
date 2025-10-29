check_updates() {
    echo "Checking for updates..."
    sudo apt update -y > /dev/null 2>&1
    updates=$(apt list --upgradable 2>/dev/null | sed 1d | wc -l)
    echo "-----------------------------------"
    if [ "$updates" -eq 0 ]; then
        echo "No updates available."
    else
        echo " System Updates Available: $updates"
        echo " Run 'sudo apt upgrade' to install."
    fi
    echo "-----------------------------------"
}

install_updates() {
    echo "Installing updates..."
    sudo apt upgrade -y
    echo "Updates installed successfully!"
}

clean_system() {
    echo "Cleaning up old packages..."
    sudo apt autoremove -y
    sudo apt autoclean -y
    echo "System cleaned successfully!"
}

system_info() {
    echo "System Information:"
    echo "-----------------------------------"
    lsb_release -a 2>/dev/null
    uname -r
    echo "-----------------------------------"
}

exit_program() {
    echo "Exiting System Update Notifier."
    exit 0
}

while true; do
    clear
    echo "=================================="
    echo "       SYSTEM UPDATE NOTIFIER     "
    echo "=================================="
    echo "1. Check for Updates"
    echo "2. Install Updates"
    echo "3. Clean System"
    echo "4. Show System Info"
    echo "5. Exit"
    echo "----------------------------------"
    read -p "Enter your choice [1-5]: " choice

    case $choice in
        1) check_updates ;;
        2) install_updates ;;
        3) clean_system ;;
        4) system_info ;;
        5) exit_program ;;
        *) echo "Invalid option! Please try again." ;;
    esac

    echo ""
    read -p "Press Enter to continue..."
done
