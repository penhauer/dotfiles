FROM ubuntu:latest

RUN apt-get update 
RUN apt-get install -y curl git zsh tmux vim


RUN useradd --create-home --shell /bin/zsh amir
RUN echo "amir:pass" | chpasswd
WORKDIR /home/amir
USER amir

# # oh-my-zsh
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 
# 
# # powerlevel10k
# RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# RUN sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
# VOLUME ./.p10k.zsh /home/amir/.p10k.zsh


# # Oh my tmux
# RUN git clone https://github.com/gpakosz/.tmux.git ~/.config/tmux
# RUN ln -s ~/.config/tmux/.tmux.conf ~/.config/tmux/tmux.conf
# RUN ln -s ~/.config/tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local


# Set EDITOR
ENV EDITOR=vim

SHELL ["/bin/zsh", "-c"]


COPY . ./dotfiles
RUN cd dotfiles && bash ./build.sh

CMD ["zsh"]
