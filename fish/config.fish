#
# Init file for fish
#

#
# Some things should only be done for login terminals
#

if status --is-login

	#
	# Set some value for LANG if nothing was set before, and this is a
	# login shell.
	#

	if not set -q LANG >/dev/null
		set -gx LANG en_US.UTF-8
	end

	# Check for i18n information in
	# /etc/sysconfig/i18n

	if test -f /etc/sysconfig/i18n
		eval (cat /etc/sysconfig/i18n |sed -ne 's/^\([a-zA-Z]*\)=\(.*\)$/set -gx \1 \2;/p')
	end

	#
	# Put linux consoles in unicode mode.
	#

	if test "$TERM" = linux
		if expr "$LANG" : ".*\.[Uu][Tt][Ff].*" >/dev/null
			if which unicode_start >/dev/null
				unicode_start
			end
		end
	end
end

function fish_prompt
    if [ $status != 0 ]
        set_color red
        echo -n "✗ "
    else
        set_color green
        echo -n "✓ "
    end


    set_color normal;

    set_color blue
    echo -n (date +"%T")' '

    set_color green
    echo -n (whoami)'@'(hostname)': '

    set_color cyan
    echo -n (prompt_pwd)

    if git status > /dev/null 2>&1
        set -l git_status (git status --porcelain|wc -l)
        set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')

        set_color green;
        if [ $git_status != 0 ]
            set_color red
        end

        echo -n '{'"$git_branch"'}'
    end
    echo -n ' $: '

    set_color normal

end



#"\[\033[01;37m\]\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo ' \[\033[01;36m\]\t \[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w :\$\[\033[00m\] "
