# --
# Copyright (C) 2012-2020 Znuny GmbH, http://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::Znuny4OTRSZoomArticleDetailsExpand;    ## no critic

use strict;
use warnings;

use utf8;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::SysConfig',
    'Kernel::System::ZnunyHelper',
);

use Kernel::System::VariableCheck qw(:all);

=head1 NAME

var::packagesetup::Znuny4OTRSZoomArticleDetailsExpand - code to execute during package installation

=head1 SYNOPSIS

All code to execute during package installation

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    my $CodeObject    = $Kernel::OM->Get('var::packagesetup::Znuny4OTRSZoomArticleDetailsExpand');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    my $ZnunyHelperObject = $Kernel::OM->Get('Kernel::System::ZnunyHelper');

    $ZnunyHelperObject->_RebuildConfig();

    return $Self;
}

=head2 CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    $Self->_DisableConfigOptionArticleHeadVisibleDefault(%Param);

    return 1;
}

=head2 CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    $Self->_DisableConfigOptionArticleHeadVisibleDefault(%Param);

    return 1;
}

=head2 CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    $Self->_DisableConfigOptionArticleHeadVisibleDefault(%Param);

    return 1;
}

=head2 CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

sub _DisableConfigOptionArticleHeadVisibleDefault {
    my ( $Self, %Param ) = @_;

    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    my $UserID = 1;

    # Since OTRS 6.0.18 there is a SysConfig option to automatically show article details.
    # When installing this package, this option has to be disabled.
    my $ConfigOptionName          = 'Ticket::Frontend::ArticleHeadVisibleDefault';
    my $ArticleHeadVisibleDefault = $ConfigObject->Get($ConfigOptionName);

    # Option not found (OTRS < 6.0.18) or set, so it's not necessary to disable it.
    return 1 if !$ArticleHeadVisibleDefault;

    my $SysConfigOptionSet = $SysConfigObject->SettingsSet(
        UserID => $UserID,
        Comments
            => 'Disabling Ticket::Frontend::ArticleHeadVisibleDefault on installation of package Znuny4OTRS-ZoomArticleDetailsExpand.',
        Settings => [
            {
                Name           => $ConfigOptionName,
                EffectiveValue => 0,
                IsValid        => 1,
            },
        ],
    );
    return if !$SysConfigOptionSet;

    return 1;
}

1;
