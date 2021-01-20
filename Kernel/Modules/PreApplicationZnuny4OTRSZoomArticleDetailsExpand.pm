# --
# Copyright (C) 2012-2021 Znuny GmbH, http://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::PreApplicationZnuny4OTRSZoomArticleDetailsExpand;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
);

use Kernel::System::VariableCheck qw(:all);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub PreRun {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $AllArticles = $ConfigObject->Get('Core::Znuny4OTRS::ZoomArticleDetailsExpand::AllArticles') || 0;

    $LayoutObject->AddJSData(
        Key   => 'Core::Znuny4OTRS::ZoomArticleDetailsExpand::AllArticles',
        Value => $AllArticles,
    );

    return;
}

1;
