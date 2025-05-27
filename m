Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE5AC4A9F
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997942.1378737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpzx-00031s-GD; Tue, 27 May 2025 08:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997942.1378737; Tue, 27 May 2025 08:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpzx-00030B-Br; Tue, 27 May 2025 08:49:25 +0000
Received: by outflank-mailman (input) for mailman id 997942;
 Tue, 27 May 2025 08:49:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJpzv-0002ks-US
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2413::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 776ab30a-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:14 +0200 (CEST)
Received: from MW4PR04CA0159.namprd04.prod.outlook.com (2603:10b6:303:85::14)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 27 May
 2025 08:49:14 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::2c) by MW4PR04CA0159.outlook.office365.com
 (2603:10b6:303:85::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 27 May 2025 08:49:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:12 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:06 -0500
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
X-Inumbo-ID: 776ab30a-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9LxXrz4Ck6RanNgT2/Dv41yYywfygHIo9mFVp31FFpRIJgj4f2Kf41FI2Zjm2NCJZdBhpFb0XJTr/IFJFZozcAk4DqmAYx/wEV9+sJsqUD++7sF2H0+QgyKsCmwUeLEQrnAer1+4FZoEifJ6Z+Nwpo5lOpLcdfw1ibuYCzGIn4eL/rxATAcNgPSqY9A+XA2lEKjiJQxJB4BJP9ioQCbSyN/t1eQ1dstAxf5fMf47kVLyY7f4V72LfrnGrUrKGRwYlk43eguQ2y+avu63xKPdR/BUt3b5aq2uos09QHgrp8WD3T0chdsahmDpjfIn07bEQy+uB3PSsx+NkxHlO7TFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz/bPWf90rgKVsHMue4aMMms4AT0/+u95OXPEnMq1ew=;
 b=TQJjlacmSn5f7zRskxrlLkQlqtZXYLgdx7GClSrDaXHEIHJurUumjpGnjWjGhDxFmtrqGZhOADGuF1m3nRaGdwGF/XbneRMiz+d3S5Pc4BZ4AdmbQETR+IAPVx36qnMkXv55rwNpHfXBsBI2KgT1KnCVZu4ESdkZYKkyLydvKjKCnR9VLsCZHzqJb8BL9am/U04RLKiras/KF2BDtmmJz34Q9XLNoPO69Zb21u4bDfXGUpXkApgtwpMEqw1hhCBPJBXlMqceUgrjM4H4nlqkkC9ILuuaWmsvVSfzEJmbj0fLvAdQ5NOeelFOaOUg6ufj0K7n++eCfQ/hxRtJlTahJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz/bPWf90rgKVsHMue4aMMms4AT0/+u95OXPEnMq1ew=;
 b=MWh2TGMrb2CCDl4SSYkENK0MlGoJbIGk2XVQSWqw4PotJ9NgU6YXm0oceW4AwZB/a1NDwDvzntvwJVzUoyWzKcAqgbLoxgjTwH+JH03zIQTm+8HgZEDR+PCqpQuHY/fIXJAuaviRGNkT0NDeTh9D4CfBHpSOfFWBdb//5CRzixQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Juergen Gross" <jgross@suse.com>
Subject: [PATCH v5 00/18] amd-cppc CPU Performance Scaling Driver
Date: Tue, 27 May 2025 16:48:15 +0800
Message-ID: <20250527084833.338427-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: a002f5d1-dacc-4a0d-a014-08dd9cfb5ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XruPRAI6/PE1Fl6lUZ3lfphdI81K2FYySVy8/2YAJySmaqqY9+I1e67YtKZg?=
 =?us-ascii?Q?j5ushAVdcGryscR9IvL2Iy6N9Fm9DuzhYbHlqI0i9jSYeRbO/zCr5tr32owJ?=
 =?us-ascii?Q?Wp9EngIrZmNMzMN7DJ7HMmt+0mZQlxQr0HFUNxmKRiYDhmV/IK8lqH7kZFvZ?=
 =?us-ascii?Q?D1kNbsax3Zik0xbkNpwzqtElrOstKqKICQ+zxuG0sfbKl+rMY539dv9MHsAB?=
 =?us-ascii?Q?qQzA2JjGOnvT/O4Wo7jUqkmoCxfKYEpSp7mCgd969f/4e36nNVOlfZ8qVYJ3?=
 =?us-ascii?Q?dT0vUmKKicqxTf3dx6UiGeyUmQQeSFXFIp0VAP8DaoHAxeHBR5tVyp9Go4wx?=
 =?us-ascii?Q?HMRdwc9gX//Tw3fAfJ3aSpuIE9CMOgtasgr82gg9t7YhNmTrabd7uyJb0q25?=
 =?us-ascii?Q?41Rl9wiqInWf5uPM5aoTs5ltmBgP9UeINi25OIVmK7ZczPJ7QEY3Y9Oarsmp?=
 =?us-ascii?Q?5oEXX7c+0iI7lc05BdJeN3gFp2ELTMvPcHKEJesr377KCwrj+SSDtgEBcBw1?=
 =?us-ascii?Q?/2vxnnBO/b5Jdn5hx/5HzyOTo9nXdmnL0RzcthZt9SAgRV+9gQoUWKZWX11x?=
 =?us-ascii?Q?pvzOe7+KXcVAJ6+29eyP/1+P93b5f7mv9Fn4mmALZpXsK441tyFKS0rVPMWo?=
 =?us-ascii?Q?2cHMCA5Jbh1TnOFS6KGb5h1K7YjwnBz0rLPUeFKlb1TkV5inrvR46EAcKqpy?=
 =?us-ascii?Q?juhex9RqUzU4Uvwd9sm+tfZUo2WCOoMLwXDfRS19YTZQBnW4/TFtU82p1gbX?=
 =?us-ascii?Q?zAztUnCdWTbERhsRdaFZ+exTz9I+q74gkEaMLY0y+yIM8Bc8iBK8h0bdnwi2?=
 =?us-ascii?Q?seDfBYkEcX4i7/VWxwnIajZtZ2i5FAo++GhSn1LRBOiTyn0/IuhL9jXYJ1Hl?=
 =?us-ascii?Q?iOTIkD27HmbFIMCYAW+glwLxN0YQ3jpiJWeqU9NV5z/4zJhLR5FAP7lyx5V3?=
 =?us-ascii?Q?W+oyn/h1WulmdKAnzq6ZoLjFhVp6W7MUoX8T0/4+DXR/Gr7jIQSWanXhHBpi?=
 =?us-ascii?Q?pjJPC/3Srn9kjm00lJQkJ29/WUKJ4TcjifpxxVy1WPL2vh/hdlj4AMQYAsu5?=
 =?us-ascii?Q?w7UKqRm+SniF9q3EH8j4JGiaQdIRnhx9Z0Nk0TTkEf0n4YlwhX+boCeFoI/Z?=
 =?us-ascii?Q?eropwn2XYcQCYgwSKyAVbfrDSBDkvSHWOOL7X48Pg2vk+JMJG+xCciXq/XzJ?=
 =?us-ascii?Q?pHhCn3kGRaYlL/pvGXwIXm0TWhXQKfqJgq1zEkduYanynihfsqr+tUB6dvt9?=
 =?us-ascii?Q?Orwf1PBtgYL8jYaVIE/vhRs+79RABTRI/OcZaIx//uJ9HwPyOjJ0Vk6SCspw?=
 =?us-ascii?Q?z+6t0V8zYfZb7m+jBrc80jl+DMhftfZpJTA+iN9gdqAT3c4KZzHCVbL8ZmK9?=
 =?us-ascii?Q?vsxG+YIhZZj4jVm4bazscMqd5sVYGVYjlpk+kphKjBmt3oLfW1q78tgvQAP9?=
 =?us-ascii?Q?rDTjHL0huELD4aG7NbmxW0fGZ2t8IOMa4up0vBjem+1EKrQkBNerWtbVrW/R?=
 =?us-ascii?Q?IuUc4Eh6pOdWbCkD7YFeoIpmB34FBFS9b5hj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:12.7983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a002f5d1-dacc-4a0d-a014-08dd9cfb5ab8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073

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

Penny Zheng (18):
  xen/cpufreq: guard perf.states[] access with XEN_PX_INIT
  xen/cpufreq: move "init" flag into common structure
  xen/cpufreq: extract _PSD info from "struct xen_processor_performance"
  xen/cpufreq: introduce new sub-hypercall to propagate CPPC data
  xen/cpufreq: refactor cmdline "cpufreq=xxx"
  xen/cpufreq: introduce "cpufreq=amd-cppc" xen cmdline
  xen/cpufreq: disable px statistic info in amd-cppc mode
  xen/cpu: Expand core frequency calculation for AMD Family 1Ah CPUs
  xen/amd: introduce amd_process_freq() to get processor frequency
  xen/cpufreq: introduce a new amd cppc driver for cpufreq scaling
  xen/cpufreq: implement EPP support for the amd-cppc driver in active
    mode
  xen/cpufreq: get performance policy from governor set via xenpm
  xen/cpufreq: normalize hwp driver check with hwp_active()
  xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
  xen/cpufreq: bypass governor-related para for amd-cppc-epp
  tools: drop "has_num" condition check for cppc mode
  tools: optimize cpufreq average freq print
  xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
    driver

 docs/misc/xen-command-line.pandoc         |  15 +-
 tools/include/xenctrl.h                   |   3 +-
 tools/libs/ctrl/xc_pm.c                   |  71 ++-
 tools/misc/xenpm.c                        | 121 ++--
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 674 ++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |  63 +-
 xen/arch/x86/cpu/amd.c                    |  83 ++-
 xen/arch/x86/include/asm/amd.h            |   2 +
 xen/arch/x86/include/asm/msr-index.h      |   6 +
 xen/arch/x86/platform_hypercall.c         |  18 +-
 xen/arch/x86/x86_64/cpufreq.c             |  19 +
 xen/arch/x86/x86_64/platform_hypercall.c  |   3 +
 xen/drivers/acpi/pmstat.c                 |  65 ++-
 xen/drivers/cpufreq/cpufreq.c             | 316 ++++++++--
 xen/drivers/cpufreq/utility.c             |  15 +
 xen/include/acpi/cpufreq/cpufreq.h        |  24 +-
 xen/include/acpi/cpufreq/processor_perf.h |  11 +-
 xen/include/public/platform.h             |  30 +
 xen/include/public/sysctl.h               |  10 +-
 xen/include/xen/pmstat.h                  |   5 +
 xen/include/xlat.lst                      |   1 +
 22 files changed, 1416 insertions(+), 140 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

-- 
2.34.1


