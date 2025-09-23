Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006A7B943C7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 06:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128119.1468585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0unt-0000ek-Ei; Tue, 23 Sep 2025 04:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128119.1468585; Tue, 23 Sep 2025 04:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0unt-0000cE-80; Tue, 23 Sep 2025 04:39:01 +0000
Received: by outflank-mailman (input) for mailman id 1128119;
 Tue, 23 Sep 2025 04:38:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt6+=4C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v0unr-0000c8-Ji
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 04:38:59 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36ac2dbf-9837-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 06:38:55 +0200 (CEST)
Received: from BYAPR08CA0013.namprd08.prod.outlook.com (2603:10b6:a03:100::26)
 by SJ2PR12MB9164.namprd12.prod.outlook.com (2603:10b6:a03:556::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 04:38:51 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:100:cafe::63) by BYAPR08CA0013.outlook.office365.com
 (2603:10b6:a03:100::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 04:38:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Tue, 23 Sep 2025 04:38:50 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 21:38:44 -0700
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
X-Inumbo-ID: 36ac2dbf-9837-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWSv2VIFYL+JwV777NKB+Bf+CPU1RvTX+h2qfOZ8LGZFohVdSfIA7fpwF7EN2UhmBtGgYb1SJpaghwncmeE+J66/Tenmeb/uT4i4LliojhCTexIkp8I3RFZQKunHet92eldQU3T+ODlw9z+PuZP/kl7wIBNEIGXMW7cQX7IuubBmMWPDoFm8cNLjSrNOJbFwitMIFB0sE1fr45adgZfEEpeIUNrK4yUO715oEo1VlvlViAwsi1Xul8ZXUs+56kLTsPbWbe7SoZvpo4QstzyvjAYMB6tlBwf197G9UtpWDnHUFw8h/92T0EFEU3zkb/E/sm39LcPn7BgDMjAp84A37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDKT571nNE3HEQZoCkNhftzvp3C5GIsHOtJv3Ch4T1Y=;
 b=bH6wmWbVSEjnjST0A2P0woQXTVoRs9z+4XPQb6imnlhe3Jq4u9wny0czgySLvvuLmCl0Lckn8DZvKeCS1t79n6RmPZpbBHg1S7hjp1yyPWmhYHaCFFrcWv4UcLxdjxmRWu935s5x7LiHOWk59/o1j3V/fIDUccLTxvxa8APZtl0AQqGyJXgojwsmVck0idwzdRTkrB/C4xE+07P78pheGDMgroEyO1nsD/cy+Gr+n7waPYOxMKa2Sna8aqp0ADpKrwjcwgznDZ66e9WLg5DT4jWBV0vdMzBGJUUjv4plz3e4Rt6GgqfdzjNA2nB9JDJvyIIl+kzVytqaQYesSPh1uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDKT571nNE3HEQZoCkNhftzvp3C5GIsHOtJv3Ch4T1Y=;
 b=KqslLfArqr6wlzfe3wdV3RatUiarYhEkNitisyL1FMYMlbl6v6IWO8cDUlKcxhl9hLVtfOkOmnM3t+48cia9JwrBj2xb95x8OArouVNzHjyp5/n5ivZT08SO5ju2jbizywEd1gGwaGi4Phhdt3IMjlNwhw7PM/8qe2J/UAQJCwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Juergen Gross" <jgross@suse.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v10 0/8] amd-cppc CPU Performance Scaling Driver
Date: Tue, 23 Sep 2025 12:38:18 +0800
Message-ID: <20250923043826.3831957-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SJ2PR12MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bc600d-4ae5-451f-28b3-08ddfa5b17c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LoMEO/x1FBCOjlQrVoxV7smF3WoQAQWnyqPk6mXZ4edQCR7r4qojC9IpOPd2?=
 =?us-ascii?Q?ZxvKt8HLLpe/F8rDyd+b9eiuPASOVSB8hwqAmdNj7XUBQDDVyA03hQVtyoL/?=
 =?us-ascii?Q?U+bMm+DvPzlvq5QNjPgX8UIzwc2GYqOW16049VwonbXKJucEgCh7VRrr0y0P?=
 =?us-ascii?Q?LjsWrSSCTeA2eiVu9h9tKFzpZS89WgHyvmeV4K2+C1cubbsQLH1yIy2M9Izp?=
 =?us-ascii?Q?tLA1uPNRWVuxJNe6yMAX1RHr0Sj2CYgGI0hXUKVFZ6KAig46vGyXA7/MoMOH?=
 =?us-ascii?Q?6523TY9+63m5Zw6timOSEzrZdtyK0TFFhit9/7mIycKIxSZCu3EgFH9pgH7w?=
 =?us-ascii?Q?Scutngn2VGkVXBuLxlrSlfujGHmyGuHJDdIjio9maTHA4elQga/tOuHIA+3c?=
 =?us-ascii?Q?MdjPLIOYgUobMlKv4SDLNCoiJTw6Ol4P1X0r1mEa7WzIoXorKM7yWARbbOYZ?=
 =?us-ascii?Q?3UEKX8osCdTDi7TZ8+wckIB3br1mO5na3DbyXmi1zMWPwTTr6SXaIWpPntyB?=
 =?us-ascii?Q?+cyl0+gVruO43A84jzKdhP7m59EeZg/MGURS357Cx+TUf47uNz6ZylazNuf4?=
 =?us-ascii?Q?Qpxun4ChIbOkq6W6bkD5uAc46Hx42GzldxoM0L6zrpUSPjYuTEwDcrn2gIRc?=
 =?us-ascii?Q?ALvYBCUZQZwMMDr0CeP+hGqYP8hvoyTAyHb5hSfLmbf9sFH12TsbLf95Mnwd?=
 =?us-ascii?Q?FBWgxm/OVOjhKraXqsXL8SD7OgGQ5ag+/x40th9oYYfS9JDSjNXd8TECyJH5?=
 =?us-ascii?Q?QPyRuzew1zuGNRZviq5A89ycuYiCearenZVfyG+v9rZ/boR2PUZ/dP8VolYf?=
 =?us-ascii?Q?FzXCv6lFfwnynByNXm2ydt24iuMnypVo/gToU4eUMZgPM63mfZ+/qotsKrF8?=
 =?us-ascii?Q?QJcnRWaJLiwA14pYjnBtUIFqAwBRk2zJr08ftxui8KOrE3lxMurLg/Hh5FXc?=
 =?us-ascii?Q?lDI0GF41tVxtfr8e6bQaSqoEGCpuxLXDx732GhHHpPC1JZYZ3MW+0e8Tkj27?=
 =?us-ascii?Q?RfijC3z/4USiyLWzniQYBFCBxe9F6ANTBNZ77N2zSexK5jCKEqcsHqo6327L?=
 =?us-ascii?Q?22pDBl2QlG5oACh++q46Hd0uQ1ScYehkMtGNSxP9729uzZO5iY8FnMDOJI6M?=
 =?us-ascii?Q?VwdXVBmmcIErOyUVQ1GeVa7abvWANxZkiL4QvfiUEfiozgPgYH9iLpZG9Rnd?=
 =?us-ascii?Q?LjO8k6dwMZ2gMStOJTgbIFhm+7t3Pzcw+86I2ysyORkwIK7+ZA8WegqmwrVd?=
 =?us-ascii?Q?SJ3/wE5M+FvzRf77p7Ygu5rSF5kL8F9YsTFuyswXvP4QatoRxbFgER699YSk?=
 =?us-ascii?Q?Z56o23OZ751hUjUdOacOP514oDD0869/Pubt96Mhki+uqjaMk+nN/dzdWHfB?=
 =?us-ascii?Q?f33FEG+0n5tFfNWgyiVjlNCG8MDhvyAnojFoR8d+IYHPBcZvEZgjEQcVVr03?=
 =?us-ascii?Q?MPqj29XMZI8Vr//s9Ax29ZmYchvlnGRoG6WVskIC7RUVMEQUabPQeLt7Gl4G?=
 =?us-ascii?Q?ZuaX5IpkFQ9p/ooQL5NMeRLksbeaeC4xm6Ho?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 04:38:50.2967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bc600d-4ae5-451f-28b3-08ddfa5b17c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9164

amd-cppc is the AMD CPU performance scaling driver that introduces a
new CPU frequency control mechanism on modern AMD APU and CPU series in
Xen. The new mechanism is based on Collaborative Processor Performance
Control (CPPC) which provides finer grain frequency management than
legacy ACPI hardware P-States. Current AMD CPU/APU platforms are using
the ACPI P-states driver to manage CPU frequency and clocks with
switching only in 3 P-states. CPPC replaces the ACPI P-states controls
and allows a flexible, low-latency interface for Xen to directly
communicate the performance hints to hardware.

amd_cppc driver has 2 operation modes: autonomous (active) mode,
and non-autonomous (passive) mode. We register different CPUFreq driver
for different modes, "amd-cppc" for passive mode and "amd-cppc-epp"
for active mode.

The passive mode leverages common governors such as *ondemand*,
*performance*, etc, to manage the performance tuning. While the active mode
uses epp to provides a hint to the hardware if software wants to bias
toward performance (0x0) or energy efficiency (0xff). CPPC power algorithm
in hardware will automatically calculate the runtime workload and adjust the
realtime cpu cores frequency according to the power supply and thermal, core
voltage and some other hardware conditions.

amd-cppc is enabled on passive mode with a top-level `cpufreq=amd-cppc` option,
while users add extra `active` flag to select active mode.

With `cpufreq=amd-cppc,active`, we did a 60s sampling test to see the CPU
frequency change, through tweaking the energy_perf preference from
`xenpm set-cpufreq-cppc powersave` to `xenpm set-cpufreq-cppc performance`.
The outputs are as follows:
```
Setting CPU in powersave mode
Sampling and Outputs:
  Avg freq      580000 KHz
  Avg freq      580000 KHz
  Avg freq      580000 KHz
Setting CPU in performance mode
Sampling and Outputs:
  Avg freq      4640000 KHz
  Avg freq      4220000 KHz
  Avg freq      4640000 KHz
```

Penny Zheng (8):
  xen/cpufreq: make HW_ALL the only expected value for CPPC mode
  xen/cpufreq: implement amd-cppc driver for CPPC in passive mode
  xen/cpufreq: implement amd-cppc-epp driver for CPPC in active mode
  xen/cpufreq: get performance policy from governor set via xenpm
  tools/cpufreq: extract CPPC para from cpufreq para
  xen/cpufreq: bypass governor-related para for amd-cppc-epp
  xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
    driver
  CHANGELOG.md: add amd-cppc/amd-cppc-epp cpufreq driver support

 CHANGELOG.md                         |   1 +
 docs/misc/xen-command-line.pandoc    |   9 +-
 tools/include/xenctrl.h              |  27 +-
 tools/libs/ctrl/xc_pm.c              |  47 +-
 tools/misc/xenpm.c                   | 118 +++--
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 709 ++++++++++++++++++++++++++-
 xen/arch/x86/cpu/amd.c               |   8 +-
 xen/arch/x86/include/asm/amd.h       |   2 +
 xen/arch/x86/include/asm/msr-index.h |   6 +
 xen/drivers/acpi/pm-op.c             |  78 ++-
 xen/drivers/cpufreq/cpufreq.c        |  10 +
 xen/drivers/cpufreq/utility.c        |  15 +
 xen/include/acpi/cpufreq/cpufreq.h   |  34 ++
 xen/include/public/sysctl.h          |  33 +-
 14 files changed, 985 insertions(+), 112 deletions(-)

-- 
2.34.1


