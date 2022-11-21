# --
# Copyright (C) 2012-2022 Znuny GmbH, https://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

use Kernel::System::VariableCheck qw(:all);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $HelperObject       = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $PackageSetupObject = $Kernel::OM->Get('var::packagesetup::ZnunyZoomArticleDetailsExpand');
my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
my $SysConfigObject    = $Kernel::OM->Get('Kernel::System::SysConfig');
my $ZnunyHelperObject  = $Kernel::OM->Get('Kernel::System::ZnunyHelper');

my $ConfigOptionName   = 'Ticket::Frontend::ArticleHeadVisibleDefault';
my $SysConfigOptionSet = $SysConfigObject->SettingsSet(
    UserID   => 1,
    Comments => 'Enabling Ticket::Frontend::ArticleHeadVisibleDefault.',
    Settings => [
        {
            Name           => $ConfigOptionName,
            EffectiveValue => 1,
            IsValid        => 1,
        },
    ],
);

$ZnunyHelperObject->_RebuildConfig();

$Self->True(
    scalar $PackageSetupObject->CodeInstall(),
    'CodeInstall()',
);

$Self->True(
    scalar $PackageSetupObject->CodeReinstall(),
    'CodeReinstall()',
);

$Self->True(
    scalar $PackageSetupObject->CodeUpgrade(),
    'CodeUpgrade()',
);

$Self->True(
    scalar $PackageSetupObject->CodeUninstall(),
    'CodeUninstall',
);

my $ArticleHeadVisibleDefault = $ConfigObject->Get($ConfigOptionName);

$Self->Is(
    $ArticleHeadVisibleDefault,
    0,
    'Check ArticleHeadVisibleDefault',
);

1;
