#!/bin/bash


# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# copy .p10k.zsh config
# alternatively, you can run `p10k configure` to reconfigure the p10k theme
cp ./.p10k.zsh ~/.p10k.zsh

{
cat <<- 'EOF'
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
EOF

cat ~/.zshrc
} > ~/temp && mv ~/temp ~/.zshrc

cat >> ~/.zshrc <<- 'EOF'
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOF



# # Oh my tmux
# RUN git clone https://github.com/gpakosz/.tmux.git ~/.config/tmux
# RUN ln -s ~/.config/tmux/.tmux.conf ~/.config/tmux/tmux.conf
# RUN ln -s ~/.config/tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local

