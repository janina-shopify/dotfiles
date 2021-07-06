echo "Copying .zshrc..."
cp ~/dotfiles/.zshrc ~/.zshrc

echo "Reportify setup..."
if [[ "$SPIN" = 1 ]]
then
  # Only run nested steps in Spin + shopify/shopify workspaces.
  if [[ "$SPIN_REPO_SOURCE_PATH" = "/src/github.com/shopify/shopify" ]]
  then
    cd "$SPIN_REPO_SOURCE_PATH"
    # This will always be the author of the cartridge
    # Do **NOT** replace this username with your username.
    cartridge insert mollybillions/finances-overview-dev
    . /cartridges/finances-overview-dev/setup.sh
    restart
  fi
fi
