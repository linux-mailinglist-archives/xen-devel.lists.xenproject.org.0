Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B47A87925
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949116.1345759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERm-0000Rb-7P; Mon, 14 Apr 2025 07:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949116.1345759; Mon, 14 Apr 2025 07:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERm-0000Ny-1U; Mon, 14 Apr 2025 07:41:38 +0000
Received: by outflank-mailman (input) for mailman id 949116;
 Mon, 14 Apr 2025 07:41:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERl-0000Ks-E8
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:37 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2414::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deeda027-1903-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 09:41:27 +0200 (CEST)
Received: from CH5PR02CA0003.namprd02.prod.outlook.com (2603:10b6:610:1ed::23)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 07:41:21 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::2e) by CH5PR02CA0003.outlook.office365.com
 (2603:10b6:610:1ed::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 07:41:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:17 -0500
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
X-Inumbo-ID: deeda027-1903-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7qIhwNTKoLnyXI5kyEG03uWRU7k3Gld9QLJKo1Rc82L2BudtxqyokrY8rlKBFM/a6b4zL+4NYRu0hYNps2Iwdu9yZAZ8ZJdBSGR6LtOiaQwtPebTAc58ALFPWQ/745n4PaWdhqkYSjp/qSi9o0qjLYjMoC2xFE2/DcGqf/E3zupJ//X+PKBrWShBYuyP21+UvESmr8Qov8sLekHE581NwEe3GEolKqTfDm5dV+FYxOCB8HaU+DYlWBsSPPD/X15eseyTSuWFkZgnwyLl1ksk5vUbkWsiwPc8FVa8cgLWvq//T+s2rWaySNK1sCoDtNH8hgK91pMJF6VN3sEdTNuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aWSOaLrDAtsZ68wXr0GvYxggqEV3GwqC9s74GUmA2Y=;
 b=pkR/MRkHNNLRo27CppXiS717O1OHBGCspSXSbWRJzk6DLHEkRoFoSuboyCVs1uPu9RLDiVyi2C1+2SsG0PoGyXr5YRP5vQpZPg7QL8rpS9izPat7iaXOay0SSc+6mfpcaANIkGcBHMy9/NblFu9u1swmWNp/JBECZQwgftOobn6vSFSH35XrOSWiwJF3P0OjsWZV1jJwExjO1JHmphtgx7UARRYc2ZMwZiLOBp/R4FzH/TBJhwz1h6Bon6lqjYJXZBov2ah5VkmK4Fhv1fQNI1+W9xE7HidNpFZMkJSg0Ai3sij5X2hiFHNQMKqTShlNRFy6y7fYOteEbg8FXExnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aWSOaLrDAtsZ68wXr0GvYxggqEV3GwqC9s74GUmA2Y=;
 b=qnNbo9P9TkYCM2PaJBj2hc21xeHiVXmlcK9AiVmnU4OWCPsd056pwH296wH93RKAyVc4dC3cSOnfaIcEzA+qaGI5YvLR4W7Fo+xwn3bFfxw29cUZPIQpE5tvyJVQ/3P+pcDXVb8LTq9dhqcFTFc+PMjhgT8rjFXi1kKSVFi6Atg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v4 00/15] amd-cppc CPU Performance Scaling Driver
Date: Mon, 14 Apr 2025 15:40:41 +0800
Message-ID: <20250414074056.3696888-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 5797dcd2-ecb9-46f8-4df0-08dd7b27bf9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eKW5+5mMMvtnGkqKx5M/LJ8GPGJxV7wWbw6LaXDyjZaiJ034uPN2i9cfOyJF?=
 =?us-ascii?Q?REZoEQFyoY85tuOZBT+oDYSS9RddfaiKf8/WL1S14eiyOq/cah+PoKS3qnLy?=
 =?us-ascii?Q?3KJjs1K2xm1xtkz+5m+yBHZ6DBP7eXrQRRj5q98TYikV2U1kyTCLoWgyRhG6?=
 =?us-ascii?Q?Y6z41NjlWQXNYOj474YjY5G48bKHXg16+1aV0I2VesODigI9miPE+dueWzVT?=
 =?us-ascii?Q?tg+EyjP+5z5uktclpkJN98u9PPPKKdDIu23pk5EcgcgAWYTfYrNTMyXYxnHm?=
 =?us-ascii?Q?EnnyRBZS1koLpqL0y+NVoh8uhRxlalnmH6Di0dPAmcRs85v8CrYPaJ6/q54M?=
 =?us-ascii?Q?lMkoIE2cgMb4qnEpTc5Akq79iYbsSgJa+GmUHM/6m3mpPH9w9joh+NPEnVKc?=
 =?us-ascii?Q?5zcog412O3fgwLAurRu6nW+PGnYDPbmAb2SbjFbaSi+dkZr/fzK4yiB9WYdF?=
 =?us-ascii?Q?xTTwoEq6h2Gk/K3Zv/aYepHeDrtCNBJ6xfhglSWVjJcaYOd8EQCekN+9kgOe?=
 =?us-ascii?Q?xnabKtFpDGrRkTt5tXXbvW098RUbJf9/yfuzeCR6z4WW0Jw2ngUypld2mWzP?=
 =?us-ascii?Q?x8AOZEEcVs5Mn0xmroA7i5OTqqgfg1rMUNhsH4jlik+vUf2P/cyyVZ18W3/A?=
 =?us-ascii?Q?REBo3bsQktIigx/0Wc1jshzMIc/fkjQMXJnGT4RRnlhWfd+ciT4YmAOjTZ8q?=
 =?us-ascii?Q?tIXqwoiO8JCTTyPvGwAbsJUtKevtVHAzuvb/ue/8breU0OHRBinSaCQClN0i?=
 =?us-ascii?Q?ZsQ9zJehamiqCk2hfAom4rIHsBFfijUFklwxzwUzkvaeeRGBFfmUkxOV4jni?=
 =?us-ascii?Q?NCR2DgS27ccEAa7O0FyWugHAcBeZJYlAnWkIPu6LtoghUKZoxDZrYK+gYuRr?=
 =?us-ascii?Q?S5xgchK0z1klqlyofs/cXLxJZsP4QJ1flmyUHP4DISFA2IvhbAKW/3G9HCDp?=
 =?us-ascii?Q?Sg7snMNQLFIpQDS7nkXtSqojFWOTN2fNq2/uMLpYpH53HbkHJHmrBzoK/TDc?=
 =?us-ascii?Q?Bry1+b48UB5iQmmHtC+eK2zszFsc/xHgeY/Em44JrLAmtjNEvkqhhCqTKdws?=
 =?us-ascii?Q?hYboxrUeSVPm6asi1+Sxu3+YDjSuwWZBIVZBC9qnyb/GdL3TBlEWG96KTkZT?=
 =?us-ascii?Q?Bm1pcHjbGSUNe83uR+W7BhU0LMQRkvcxBEzcGW/YxJ7X/zUAT0VKBnMVVreR?=
 =?us-ascii?Q?JvtNAzVJP3ClpFSNYhfg+3N7jDGhiUJXkwIwa8HsqwhqNOm2NG5n4rrsuTCG?=
 =?us-ascii?Q?k//i7mtf8NEFCeXTPDHOWzJW50UYWGTr4YmrXT/5dqcAOSdAmPKsssR1Jbsc?=
 =?us-ascii?Q?XGf8n9kmnkH0aZi83eYf/uNJ1rA/klUop2rbFI3p7XOLwP8a3EanI1eZt8BW?=
 =?us-ascii?Q?AFxdJYAoZczT50eZgKOF9oc9DQT6JQCjK4Hbe2yD6n8LDb0JfSORjjlvgdos?=
 =?us-ascii?Q?GvxN0UjkV1kK53ynFpd+2vDw53bu218MGcklcjTGHpDxXXMl1QqOrhNjhCWm?=
 =?us-ascii?Q?wuQNd2KYMW2CINOTuUHup47hO89GRjNi/+Jr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:20.4461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5797dcd2-ecb9-46f8-4df0-08dd7b27bf9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246

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
*performance*, etc, to manage the performance hints. And the active mode
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
  Avg freq      2000000 KHz
  Avg freq      2000000 KHz
  Avg freq      2000000 KHz
Setting CPU in performance mode
Sampling and Outputs:
  Avg freq      4640000 KHz
  Avg freq      4220000 KHz
  Avg freq      4640000 KHz

Penny Zheng (15):
  xen/cpufreq: move "init" flag into common structure
  xen/cpufreq: extract _PSD info from "struct xen_processor_performance"
  xen/x86: introduce new sub-hypercall to propagate CPPC data
  xen/cpufreq: refactor cmdline "cpufreq=xxx"
  xen/x86: introduce "cpufreq=amd-cppc" xen cmdline
  xen/cpufreq: disable px statistic info in amd-cppc mode
  xen/cpufreq: fix core frequency calculation for AMD Family 1Ah CPUs
  xen/amd: introduce amd_process_freq() to get processor frequency
  xen/x86: introduce a new amd cppc driver for cpufreq scaling
  xen/cpufreq: only set gov NULL when cpufreq_driver.setpolicy is NULL
  xen/x86: implement EPP support for the amd-cppc driver in active mode
  tools/xenpm: Print CPPC parameters for amd-cppc driver
  tools/xenpm: fix unnecessary scaling_available_frequencies in CPPC
    mode
  tools/xenpm: remove px_cap dependency check for average frequency
  xen/xenpm: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
    driver

 docs/misc/xen-command-line.pandoc         |  13 +-
 tools/libs/ctrl/xc_pm.c                   |  45 +-
 tools/misc/xenpm.c                        |  20 +-
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/acpi.c          |  14 +-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 708 ++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |  34 +-
 xen/arch/x86/cpu/amd.c                    |  81 ++-
 xen/arch/x86/include/asm/amd.h            |   4 +
 xen/arch/x86/include/asm/msr-index.h      |   6 +
 xen/arch/x86/platform_hypercall.c         |  16 +
 xen/drivers/acpi/pmstat.c                 |  42 +-
 xen/drivers/cpufreq/cpufreq.c             | 306 ++++++++--
 xen/drivers/cpufreq/utility.c             |  14 +
 xen/include/acpi/cpufreq/cpufreq.h        |  22 +-
 xen/include/acpi/cpufreq/processor_perf.h |  11 +-
 xen/include/public/platform.h             |  36 +-
 xen/include/public/sysctl.h               |   2 +
 xen/include/xen/pmstat.h                  |   2 +
 xen/include/xlat.lst                      |   1 +
 20 files changed, 1268 insertions(+), 110 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

-- 
2.34.1


