Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67965C8B06A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173111.1498225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIdt-0000Qe-Pm; Wed, 26 Nov 2025 16:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173111.1498225; Wed, 26 Nov 2025 16:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIdt-0000M2-IN; Wed, 26 Nov 2025 16:45:21 +0000
Received: by outflank-mailman (input) for mailman id 1173111;
 Wed, 26 Nov 2025 16:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIds-0008SW-7j
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:20 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47c5448f-cae7-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 17:45:14 +0100 (CET)
Received: from CH2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:610:50::38)
 by SA5PPF8BD1FB094.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 16:45:05 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::96) by CH2PR16CA0028.outlook.office365.com
 (2603:10b6:610:50::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Wed,
 26 Nov 2025 16:44:55 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 16:45:04 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:01 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 47c5448f-cae7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5DysOYmMYrOsKf13NPJJdM0iD1Vc/r+2Dw/LMDSPe7ASTOkmhmL0zLU1wfKS7iNcwz31BPUNvXHjlgqrR+sFwVmJGiNMNg29LWfgxuT4T4cp9Gd4yfZQqoK+h5TE/mlYFC+9zlaAYbXh3FUkesoPFSXeYy+u+HhadpmMgh9ttwqxV8qgG5cfmXHjUy3F7g9Zo57NNrju8/EWBwWSx6u/rGfwhnRrXLS63jGAuOSmI/0ARraf0TVEaaECgLemUM4zEZ+lZOoLOkCUAhSN8YTyZ3617zmN3DtUnQNSfXaK9BBw7xmBkqGH+td0m/A/lIOmQfJnqJrIFotUuhVwWgU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EplJzbtcbWrbwKevxxCDtdCswvihUhiPV2NmbncaWfY=;
 b=ImkJ2L3kADIrpU16IUs9nQ9wd7AGU3ouRbOMDOTy9WUKHYP6mUcY6uYE6F+/o2L7Lp5KyhAblmvJBgeXLtN5y3CYy/Gjfx2f4/u3j4ZPtIYFWVeukpvT1hqc1hqXHZJz1VNhDyxFhtQF9BCbyJmp9dy1LZKvTZUCVZTAjO/IDicKet/F3Awno8+DuVEPhAVA5JPpds2fHhFjcR7OwRIjNFxcOG0e5icrh27pRvNOMTDO3VUm7O0q/bo3AJS2PvYa6EyKOvhi1Ts1fDNskDu4jY6cnGD8eN1iyCIXf/Pfh11ecTQu1EnbPCh2z8yAnF0IoxzNP97ais+InOOhMpsSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EplJzbtcbWrbwKevxxCDtdCswvihUhiPV2NmbncaWfY=;
 b=E3eKS+yly7Hs7fvgLn3H0/NR92ytskCpK5Yz8smwRiTM8hMqqplC+bnGOYUmNspKd4DH0mDl/DyhAKMlg2mFYlKitwF9iqGWe5TnDadPJp+12OwCZ5eSKGYd0Nvpw4Ufo7vNjNGifWuXcwQcnvRpwRrRg0eMq1C1isq785/W5W0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH 00/11] x86 vendor check optimisations
Date: Wed, 26 Nov 2025 17:44:02 +0100
Message-ID: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SA5PPF8BD1FB094:EE_
X-MS-Office365-Filtering-Correlation-Id: dde126b5-db81-480a-8518-08de2d0b26a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QdsC2DtHsUZ+AY4OXaIUKb2lKUcnwQri/4QN1+jkr4iZYojUbPKhfBWPnMgp?=
 =?us-ascii?Q?C9ZspxEoDjopKqC3VgYYSEb2W6FBkSeV/I0XHoRaUENp37Iw/lecxOLb08Io?=
 =?us-ascii?Q?udaW2YPI6SmlJkErWFq6d9KMWJLC/mWDY/KQRls56HyKDk2tEqmDf40S2BKl?=
 =?us-ascii?Q?nTzp+CRw87x3Vep+oes1VALAy7P+6Y3O+2iQm3NFZbg/uZthN8YAeipMVXaH?=
 =?us-ascii?Q?LlN71AaEgnToY01UpctzOYnZFtDMGFBtqQiXsrSKlW/N4sTghxZjT4+jmr0S?=
 =?us-ascii?Q?Wi7i71N6pqNk8T/qUiTFuXaEnqiOQACsXk5v63sznmKyiXhrI1Qjb01qM7xP?=
 =?us-ascii?Q?rftg2v3ixRi8IHe6vV7mkw84WUfXI+NbTlrJqakLU01zUUxgqUbepTX5dg1J?=
 =?us-ascii?Q?invorarogX+usAm0T/u9Xa2tpbWGR/E+FmaJsVxZkLoTTzYeHRWYQN7C5fX3?=
 =?us-ascii?Q?ASKrNLDX9xH+J+Cc43e95vvw6fgvebVnZ/xnIi0ZqXSGihK7cW8VfO3m93o9?=
 =?us-ascii?Q?WmSBDTTOycDgUpufCPWpdDHGJ1gcTSSUBeoVjF4BjHXV0OmWN61WoaGQphfq?=
 =?us-ascii?Q?cCs7mt9BaPuJaaiyHPTXiR4oYCzcg4FHrEF/qIqDTaO9FBpUqj+hQFGBBqyH?=
 =?us-ascii?Q?YICRmF/DU1b/i22N3PwNePtz2AzEU9ZEfaJutbcbGgcCd/gOFjzPxGA6bieL?=
 =?us-ascii?Q?u4av6RED8jU3nAi4lCGv7ncYE6OdzBt8ui2/nlWi5Bkevyt08Yf0psqdXDYl?=
 =?us-ascii?Q?5FAGbpEaFKmFNifVFbhGhfJI+2qAL0zHZmN1wdboyPheFWwZ1HvnJPPUM3Bn?=
 =?us-ascii?Q?TeGkI1KOAItceYBSCFeahBHcS3K/BB5AVYBFTEFvDeILqgYzVmdyF3mLqnxZ?=
 =?us-ascii?Q?v8hYGm96V7OBACZQrpfdEXfi0vUbC6fXP56JhB+nWr0TzA69YyD1oq+s+R0a?=
 =?us-ascii?Q?JDdnwpgNlxerRlZfZWu3vNKPclZ5/zN1P9y4HYTWN77vJIG4gswXPhzpDHmD?=
 =?us-ascii?Q?hS/74sTVyEu54IrWGlm7akEaBvBbdlcLBpO8Q31whx4ofoJxCTVAhMFjo4nk?=
 =?us-ascii?Q?bMESS+xgSzDxmQBfIem+wKWa/3DUl6OkKL62XaTjU1YhXvkkgZaM+Bm/qbr0?=
 =?us-ascii?Q?57yF/iEq+VJxR0xrdIZ4vMGgY9FvdUab5A09YBMpi8Y8cV+mjb6KVxHHWZ7o?=
 =?us-ascii?Q?vTKS8halFJv9Y0e15k7ESZ4CqX0n0907mhv6Qve0VuQlqEK+7iqkzJ1nerW6?=
 =?us-ascii?Q?PUwrDD1V1KJf5KmHhdfXGH7Hw7g2qxU8+WyRqvhWlU84KXJ+bfQZsc4QQMzo?=
 =?us-ascii?Q?mWu28m+mJTwXHEZKtzb71yzdPoove5IOXi/GxaGwrbxHhI2pUcp9PQrCSXLT?=
 =?us-ascii?Q?DAc1UFHcqpfJPDaMcjmIsN8PDN18LpNNjuzE99nUwGKfzBMTt6sqk7WUV8fd?=
 =?us-ascii?Q?Q4nwRja3nULr8LcMRZdqdct3P3949RuZviCrZCkwuwFcn1nno745KuykSU3/?=
 =?us-ascii?Q?6nfdut8O+MJQWGWqkdZn2QLA94BP9pchaS/fruNAI8KqGuIbeWxIAwi4ra0P?=
 =?us-ascii?Q?N2OZAXCa/21UnQAQ/0I=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:04.9217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dde126b5-db81-480a-8518-08de2d0b26a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8BD1FB094

Hi,

I'd like some input on some rather aggressive optimisations I'm after.

This is a WIP series (so, don't pay attention to bisectability just yet) to
perform aggressive DCE based on vendor checks. I've added some bloat-o-meter
outputs for the everything-enabled vs an amd-only builds for comparison. The
results are very promising.

Please focus on patch 3, as that's the key to the optimisations.

What I'm ultimately after is what I've come to call the "single-vendor
optimisation". In doing this it's fairly easy to optimise other cases too, such
as removing unused vendors and any branches they use exclusively. Please, tell
me what you think of the approach taken by the series.

  Single-vendor optimisation
  ==========================

  - If we compile Xen for a single-vendor AND
    Xen validates it always boots on such vendor AND
    We remove the default CPU path AND
    Xen sanitises guest CPU policies so they always match the boot vendor, THEN
    It's fair game to fold all vendor checks onto true/false depending on
    whether you're testing against the single vendor you compiled-in or not.
    Effectively ignoring the runtime component, and allowing DCE to perform
    eliminations left, right and center. The results are fairly dramatic in
    places like init_speculation_mitigations(). See bloat-o-meter below.

  Compiled-out-vendor elimination
  ===============================

  - If we have all possible x86 vendors described in Kconfig AND
    We compile out a vendor from Xen THEN
    It should be possible to remove such vendor from every vendor check in the
    system. Either we didn't boot it or we're using the default CPU ops anyway. 
    This causes &-checks to turn into ==- checks (more size-efficient) for
    multi-vendor checks turning into single-vendor checks, or even straight-up
    "false" when all vendors in the check are compiled out.
    This is key to enable transparent DCE-removals in multi-vendor settings.

This allows very transparent removal of all Hygon, Centaur and Shanghai code
in the system when it's not required, as it's most typically found in branches
around common x86 code gated by a runtime vendor check.

The secret sauce is a static always_inline function that operates on the
assumption that the second argument is always a constant and the first always
a variable (as it invairably is the case with these checks). It's written
carefully to fold everything into a constant for the appropriate cases. There's
a few more optimisations in the code, like a no-vendor optimisation where the
checks always return false when comparing against a non-unknown vendor when
no explicit vendor is compiled in.

Patch 1 adds the missing vendors and the default path to Kconfig, as they are
currently absent.

Patch 2 ensures consistency between host and guest CPU policies wrt CPU vendor

Patch 3 introduces the x86_vendor_is() function. This is the key.

Patch 4 migrates the early_cpu_init() vendor switch. It's a bit tricky because
it must be done compatibly with the single-vendor optimisation, but there's
nothing complex about it.

Patch 5 is simply code removal at the Makefile level for free thanks to DCE

Patches 6 through 11 is replacements of regular checks with x86_vendor_is(),
with 6 being the one with the most dramatic effect in the diffstat.

===============================================================================
                                 Bloat-o-meter
===============================================================================

all-vendors+default-path
========================

add/remove: 0/1 grow/shrink: 12/10 up/down: 175/-266 (-91)
Function                                     old     new   delta
start_vmx                                   1507    1582     +75
x86_cpu_policies_are_compatible              157     194     +37
xen_config_data                             1479    1506     +27
early_cpu_init                               948     958     +10
setup_apic_nmi_watchdog                      977     986      +9
init_speculation_mitigations                9836    9841      +5
intel_mcheck_init                           2398    2401      +3
set_cx_pminfo                               1691    1693      +2
init_bsp_APIC                                193     195      +2
guest_common_max_feature_adjustments         110     112      +2
disable_lapic_nmi_watchdog                   119     121      +2
do_get_hw_residencies                       1289    1290      +1
mce_firstbank                                 37      36      -1
mcheck_init                                 1227    1225      -2
hvm_vcpu_virtual_to_linear                   631     628      -3
init_nonfatal_mce_checker                    160     156      -4
domain_cpu_policy_changed                    677     672      -5
recalculate_misc                             898     890      -8
traps_init                                   543     527     -16
default_cpu                                   16       -     -16
cpufreq_driver_init                          468     441     -27
vmce_wrmsr                                   993     909     -84
vmce_rdmsr                                  1134    1034    -100
Total: Before=3726243, After=3726152, chg -0.00%

amd-only+no-default-path
========================

add/remove: 0/14 grow/shrink: 4/58 up/down: 93/-10948 (-10855)
Function                                     old     new   delta
x86_cpu_policies_are_compatible              157     194     +37
amd_check_entrysign                          807     829     +22
init_guest_cpu_policies                     1364    1382     +18
xen_config_data                             1471    1487     +16
opt_gds_mit                                    1       -      -1
nmi_p6_event_width                             4       -      -4
nmi_p4_cccr_val                                4       -      -4
init_e820                                   1037    1033      -4
pci_cfg_ok                                   307     301      -6
get_hw_residencies                           213     205      -8
recalculate_cpuid_policy                     909     900      -9
init_amd                                    2508    2499      -9
dom0_setup_permissions                      3809    3800      -9
arch_ioreq_server_get_type_addr              250     241      -9
cpu_has_amd_erratum                          230     219     -11
parse_spec_ctrl                             2321    2307     -14
amd_nonfatal_mcheck_init                     192     177     -15
shanghai_cpu_dev                              16       -     -16
hygon_cpu_dev                                 16       -     -16
default_init                                  16       -     -16
default_cpu                                   16       -     -16
centaur_cpu_dev                               16       -     -16
x86emul_0fae                                2758    2741     -17
vmce_init_vcpu                               153     136     -17
cpufreq_cpu_init                              34      15     -19
nmi_watchdog_tick                            534     514     -20
vmce_restore_vcpu                            160     139     -21
init_nonfatal_mce_checker                    142     120     -22
ucode_update_hcall_cont                      888     865     -23
mce_firstbank                                 37      10     -27
init_shanghai                                 29       -     -29
validate_gl4e                                617     587     -30
l4e_propagate_from_guest                     451     421     -30
guest_walk_tables_4_levels                  3411    3381     -30
clear_msr_range                               30       -     -30
acpi_dead_idle                               430     398     -32
print_mtrr_state                             719     684     -35
amd_mcheck_init                              451     416     -35
hvm_vcpu_virtual_to_linear                   631     595     -36
do_IRQ                                      1783    1747     -36
init_bsp_APIC                                193     149     -44
cpu_callback                                4650    4600     -50
mc_memerr_dhandler                           903     851     -52
mcheck_init                                 1187    1122     -65
microcode_nmi_callback                       205     139     -66
disable_lapic_nmi_watchdog                   119      49     -70
__start_xen                                 9448    9378     -70
alternative_instructions                     154      82     -72
traps_init                                   543     468     -75
protmode_load_seg                           1904    1829     -75
set_cx_pminfo                               1691    1614     -77
init_intel_cacheinfo                        1191    1111     -80
is_cpu_primary                                93       -     -93
do_mca                                      3181    3085     -96
guest_cpuid                                 2395    2292    -103
guest_common_max_feature_adjustments         110       -    -110
read_msr                                    1431    1319    -112
x86emul_decode                             12729   12597    -132
guest_common_default_feature_adjustments     232      62    -170
do_microcode_update                          787     602    -185
cpufreq_driver_init                          453     263    -190
vmce_wrmsr                                   967     768    -199
recalculate_misc                             898     689    -209
vmce_rdmsr                                  1083     872    -211
early_cpu_init                               948     732    -216
guest_wrmsr                                 2853    2622    -231
init_centaur                                 238       -    -238
domain_cpu_policy_changed                    677     408    -269
write_msr                                   1749    1465    -284
x86_emulate                               222198  221891    -307
init_hygon                                   389       -    -389
start_vmx                                   1507    1105    -402
guest_rdmsr                                 2308    1881    -427
setup_apic_nmi_watchdog                      977     276    -701
do_get_hw_residencies                       1289       9   -1280
init_speculation_mitigations                9714    6788   -2926
Total: Before=3679044, After=3668189, chg -0.30%

There's a few more patches needed to add conditional inclusion of amd.c and
intel.c at the Makefile level, but that can be done just as well. It just adds
5 patches worth of noise I don't want to discuss atm.

Just knowing x86_vendor_is() is "good to have" is good enough as it enables our
downstream to customise it with whatever optimisations we need.

I also suspect other areas of the hypervisor could benefit from this meld of
runtime+compiletime sort of checking, allowing transparent code removal.

I'm thinking DOM0LESS_BOOT vs DOM0_BOOT vs PVSHIM_BOOT, or AMD_SVM vs INTEL_VMX
in HVM-only builds, or family checks to have (i.e) a explicit "older-than-zen"
Kconfig option with a similar approach on a family range check.

This is maybe one of several such uses.

So... thoughts? I'm definitely fond of the single-vendor bloat-o-meter output.

Cheers,
Alejandro

Alejandro Vallejo (11):
  x86: Add more granularity to the vendors in Kconfig
  x86: Reject CPU policies with vendors other than the host's
  x86: Add x86_vendor_is() by itself before using it
  x86: Refactor early vendor lookup code to use x86_vendor_is()
  x86: Conditionalise the inclusion of Hygon/Centaur/Shanghai cpu/ files
  x86: Migrate switch-based vendor checks to x86_vendor_is()
  x86: Migrate MSR handler vendor checks to x86_vendor_is()
  x86: Migrate insn emulator to use x86_vendor_is()
  x86: Migrate spec_ctrl vendor checks to x86_vendor_is()
  x86: Migrate everything under cpu/ to use x86_vendor_is()
  x86: Migrate every remaining raw vendor check to x86_vendor_is()

 xen/arch/x86/Kconfig.cpu               | 45 +++++++++++++++++++++
 xen/arch/x86/acpi/cpu_idle.c           | 19 ++++-----
 xen/arch/x86/acpi/cpufreq/acpi.c       |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c    | 32 +++++----------
 xen/arch/x86/alternative.c             | 30 ++++++--------
 xen/arch/x86/apic.c                    |  2 +-
 xen/arch/x86/cpu-policy.c              | 41 +++++++++----------
 xen/arch/x86/cpu/Makefile              |  6 +--
 xen/arch/x86/cpu/amd.c                 |  6 +--
 xen/arch/x86/cpu/common.c              | 50 +++++++++++++++--------
 xen/arch/x86/cpu/intel_cacheinfo.c     |  5 +--
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c     |  3 +-
 xen/arch/x86/cpu/mcheck/mce.c          | 41 +++++--------------
 xen/arch/x86/cpu/mcheck/mce.h          | 20 +++++----
 xen/arch/x86/cpu/mcheck/mce_amd.c      |  6 +--
 xen/arch/x86/cpu/mcheck/mce_intel.c    |  6 +--
 xen/arch/x86/cpu/mcheck/non-fatal.c    | 20 +++------
 xen/arch/x86/cpu/mcheck/vmce.c         | 50 ++++++-----------------
 xen/arch/x86/cpu/microcode/amd.c       |  2 +-
 xen/arch/x86/cpu/microcode/core.c      |  2 +-
 xen/arch/x86/cpu/mtrr/generic.c        |  4 +-
 xen/arch/x86/cpu/mwait-idle.c          |  4 +-
 xen/arch/x86/cpuid.c                   |  4 +-
 xen/arch/x86/dom0_build.c              |  3 +-
 xen/arch/x86/domain.c                  | 37 ++++++++---------
 xen/arch/x86/e820.c                    |  3 +-
 xen/arch/x86/guest/xen/xen.c           | 19 ++++-----
 xen/arch/x86/hvm/hvm.c                 |  5 ++-
 xen/arch/x86/hvm/ioreq.c               |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c             |  6 +--
 xen/arch/x86/include/asm/cpuid.h       | 56 +++++++++++++++++++++++++-
 xen/arch/x86/include/asm/guest_pt.h    |  4 +-
 xen/arch/x86/irq.c                     |  4 +-
 xen/arch/x86/msr.c                     | 41 ++++++++++---------
 xen/arch/x86/nmi.c                     | 18 +++------
 xen/arch/x86/pv/emul-priv-op.c         | 24 +++++------
 xen/arch/x86/setup.c                   |  2 +-
 xen/arch/x86/spec_ctrl.c               | 34 ++++++++--------
 xen/arch/x86/traps-setup.c             | 18 ++++-----
 xen/arch/x86/x86_emulate/private.h     |  4 +-
 xen/arch/x86/x86_emulate/x86_emulate.c |  2 +-
 xen/lib/x86/policy.c                   |  3 +-
 43 files changed, 360 insertions(+), 327 deletions(-)


base-commit: fb0e37df71a31318c61e0715ffed3e149ca8a4aa
-- 
2.43.0


