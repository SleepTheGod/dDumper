#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

use if $^O eq "MSWin32", 'Win32::Console::ANSI';
use LWP::UserAgent;
use Term::ANSIColor;
use HTTP::Request::Common qw(POST);

sub clear_screen {
    system($^O eq 'MSWin32' ? 'cls' : 'clear');
}

sub print_banner {
    clear_screen();
    print color('green');
    say "MMM...[banner]...MMM";
    print color('bold red'), "\n=================================\n";
    print color('bold white'), "Welcome to dDumper\n";
    print color('bold white'), "[+]Coded By: yak0d3\n";
    print color('bold white'), "[+]Version: 1.0\n";
    print color('bold white'), "[+]Github: https://github.com/yaKode/dDumper\n";
    print color('bold yellow'), "\n\t***********DISCLAIMER***********\n\tI do not take any responsibility and I am not liable for\n\tany damage caused through use of this product.\n\tI do not take responsibility for any illegal usage.\n\t********************************\n";
    print color('bold red'), "\n=================================\n";
}

sub get_input {
    print color('bold magenta'), shift;
    print color('bold white');
    chomp(my $input = <STDIN>);
    return $input;
}

sub exit_code {
    print_banner();
    say color('bold white'), "\n\n Bye!\n\n";
    exit;
}

sub commands {
    my $cmd = shift;

    if ($cmd eq "exit") {
        exit_code();
    } elsif ($cmd eq "run" or $cmd eq "start" or $cmd eq "exploit") {
        # Placeholder for the actual start of exploit.
        say "Starting the exploitation...";
    } else {
        say color('bold red'), "\nUnknown command!\n", color('bold white'), "Type help for `help` screen.\n";
        return 0;
    }
}

# Main program starts here
print_banner();

my $list = get_input("Enter siteslist path > ");
until(-e $list) {
    exit_code() if $list eq 'exit';
    say "File doesn't exist!";
    $list = get_input("\nEnter siteslist path > ");
}

my $output = get_input("Enter outputs filename/path > ");
exit_code() if $output eq 'exit';

print_banner();
say color('bold white'), "\t|Type help for `help` screen and `run` to start|";

my $cmd = get_input("\nDumper > ");
while (commands($cmd) eq 0) {
    $cmd = get_input("\nDumper > ");
}
