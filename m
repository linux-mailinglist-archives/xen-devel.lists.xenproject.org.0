Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9CB011BD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040184.1411589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nS-0002Ns-Po; Fri, 11 Jul 2025 03:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040184.1411589; Fri, 11 Jul 2025 03:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nS-0002LV-MT; Fri, 11 Jul 2025 03:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1040184;
 Fri, 11 Jul 2025 03:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nQ-0002LK-Co
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:36 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54a6dfa4-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:51:32 +0200 (CEST)
Received: from SJ0PR03CA0082.namprd03.prod.outlook.com (2603:10b6:a03:331::27)
 by CH3PR12MB9171.namprd12.prod.outlook.com (2603:10b6:610:1a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 03:51:27 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::37) by SJ0PR03CA0082.outlook.office365.com
 (2603:10b6:a03:331::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 03:51:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:25 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:21 -0500
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
X-Inumbo-ID: 54a6dfa4-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYOZkD+SIZEZGHNjlnrk8mWgT8heEUzLQFyetoiGxloMsgu2+Ig4cMxlXPIJm+0hN+h1LzAZGb9NK0SUE3KKbKBGF2HKCaN/rylgWXsDoFMZffdG2mZHYapmC5vzh3z23GaxHkVF9slija6D3k5zBOW81sWhRWnGdijGFB/wgj9jvla6vAvS7BmocW2SM8wE9fbal5dJgqAxPsdFJz78GIB577vDvOop/krSqpOJ1hflMuwfzXOhSlAElUXjuSEXfU66HPpxm4poDHa/HKvZpn5FYyVJuPyyxTT4hmLGMkr8wpcf0odJ3Cy/ufW3XIfa5hFl39hU5MocMky5bNxmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9C+yV+HmdFTqJaV624vQ6WpSY1VU6tRT3xMWhR+0fw=;
 b=W6Uhi7hhUzdiUEcdc+nVFDT4uR0suqo79+UuyceFpE4YLYlznaZXbH7sDXRW9lB1L0Nkc8T8mncYmqN2PWDhF8x93hg3PlnrvvSr5sbbvMMC7/PBRTp3/JNnk28u/g1FsAQ/kh2DiSl6DTodp61cvt/6+n+n/rb7HWKGG3DvOI8Pd5skLRtNsXznHbytmM737VjdjUf3S5ZBfpHcFrBYnqzDqeG6n2ZnJdsnpiAeqNLMx105KKmjBH2wWW74BY5819RkTbV7wAZfEen67NAQMfDft1U/CoWKx8bi3pl5UTxW9lENWAfw2SUsdUJE7Y+Qd+HS3c9OReKwrjSWhhgQxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9C+yV+HmdFTqJaV624vQ6WpSY1VU6tRT3xMWhR+0fw=;
 b=FdjtMRusm1bL1Vj3HgWg9mHts9vqeqX2WG9u4M05WuVleTxhmV4+6yfqNBNY9us/ZYiDz5ELQyOnnSYO6V6j4gN0na8dn77KXt7feZV3uGOTkYKBpLixpD8EUBQPSNvQy+SVIgqIJn4XnHbhz93Kiolt4wJMrxFh0H+rXGyoJeE=
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
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Michal Orzel
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v6 00/19] amd-cppc CPU Performance Scaling Driver
Date: Fri, 11 Jul 2025 11:50:47 +0800
Message-ID: <20250711035106.2540522-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|CH3PR12MB9171:EE_
X-MS-Office365-Filtering-Correlation-Id: 42448a78-1bb3-489a-2140-08ddc02e35d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IdDF8xh60Xl9VDyjdMJLYsYrXnptyBE/XgmMw1VCInX+cjKfjnsHzibDweb4?=
 =?us-ascii?Q?q8dKti+wNmLLqLcKl0ftbteKbm1SHxNQTSjJBwO4AZakZb+nHM6uytPi4sNH?=
 =?us-ascii?Q?+VX6RFdGQqCAGPPMMBNGXY0HYdyVJnbEnyks8aPBygYllMtV/MG/+wLMmS98?=
 =?us-ascii?Q?qq0nLiD6c4NgvwQSkNAF98vpeB48Ri4KyJ7Upz8zZUPucy1QWp3/UqQ7heYO?=
 =?us-ascii?Q?b6uxCk/I5Dw6gIplSKFJFJ6X92Jss9RMvnZqOLxT9kWnPSpu/fRLBVz5npfa?=
 =?us-ascii?Q?f78LlAqNrz5gYkCsiJdohENDc021ajfwYNUcOvsHc3x2Pfld6IvOxK3yg/2n?=
 =?us-ascii?Q?TM49aMTfhvDDIpNT6GOvVKqCgEfRR5bmkcDzugMxA13eozU683ZdU14iAQVi?=
 =?us-ascii?Q?QewcJpOs8mxk3DhwGn3Tj0rJmGbu9LsQ6WdYP6qxa4NEGdfnsSna7Ck27eYC?=
 =?us-ascii?Q?TMOqFuSA6ozgpvrzKIkeHVsQNzNZ3baTILJkhq9zkYKHUgjwBZW74FMfpS2A?=
 =?us-ascii?Q?rofZipsaNoF1kTc/W9dp+/oPPRZf8/5YsNXMfYm4j5bsLvZSmSw/hOu43sRo?=
 =?us-ascii?Q?iWj0BPwRgYZ65FOFTEb2b0otVuRBH3TVCtz5hP7AKr2BMI0BMm62pM0fVk9V?=
 =?us-ascii?Q?308OzhFmh1RSTZvc6+Vx2+Lwlc5qHDeWpTJTacvRosu56wTRhMl1Us+3nUBK?=
 =?us-ascii?Q?QHRSJ5butNF391WOgAtZQ8BKcRByhIMSaKORGev+N89Z0/cf+VJ6Fc2SSOKq?=
 =?us-ascii?Q?mtFT1N9CpT0ldefVFCoTu7FMwpcfiRg5tySCeHcG7q6dBTmRrCGfPZrLRjSG?=
 =?us-ascii?Q?AFDGSD5J9wYi1gG8sfHtCX25DPGZfWJy51oLE8JRgUC6sZCGj3CUi2sVUFBp?=
 =?us-ascii?Q?1yYukxcpaWbcsW+rUj1vjQcpDkadm1LwHpg6ruIp5fIulE3WwlkZzbHcn24a?=
 =?us-ascii?Q?gMdFWV4HAZuSDoPBL1C9+ABJUIy71XVBonKPvzTpTvkH2uJ4giIkD3/AMJGN?=
 =?us-ascii?Q?p+rSZvsdyR81Xwi5B+Rhlub3+/VUmymDDoyP9VweKQGWXxfg4q/xlLj945Hz?=
 =?us-ascii?Q?svjZZVNBhAA4c14mW9M9g13fvzdK0VME4nGKMd/VE+y139AbGad7sc3cC8ii?=
 =?us-ascii?Q?rclELKXqmOj5+4J2prYPtnKHux2hHSKn4uwaXPuFhn7kDTZAiS0ZMeC3XtWl?=
 =?us-ascii?Q?dP687HK/jhz8JGPkhbUGOxvgmVPOaE7hJO7n+fm7yJGzwWGmoX/oExL7Z/Yp?=
 =?us-ascii?Q?nkGDf9QMzUYxZ8ggdQ6ciU8i8RT3bnu3eJ/eXKTnnra4jUhg2AYYixXuXzFa?=
 =?us-ascii?Q?rM9KEDkV+AOyYFW7w9Y95kEM7eub0OyW5BsdGyfUDUIPvBjFD0HzKRnFaxNL?=
 =?us-ascii?Q?tiznu5Z7JjTNbYgmsLuTwA5Ek73LFxw7jNDpEpkaxPbNDpXTZiFPJ/itM2a4?=
 =?us-ascii?Q?szbDIYXFs0d/Q8qUSnRE3YaD+WSKf9K7NXiV2kUcLzs0miLEXQ0pPpKempPo?=
 =?us-ascii?Q?/PFlhyMhJFVAdh6Qgeio1DmgJUoswhV5JLHO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:25.9458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42448a78-1bb3-489a-2140-08ddc02e35d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9171

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

Penny Zheng (19):
  xen/amd: introduce amd_process_freq() to get processor frequency
  tools: drop "has_num" condition check for cppc mode
  tools: optimize cpufreq average freq print
  x86/cpufreq: continue looping other than -EBUSY or successful return
  xen/cpufreq: refactor cmdline "cpufreq=xxx"
  xen/cpufreq: make _PSD info common
  cpufreq: rename "xen_cppc_para" to "xen_get_cppc_para"
  xen/cpufreq: rename cppc preset name to
    "XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND"
  xen/cpufreq: neglect unsupported-mode request from DOM0
  xen/cpufreq: introduce new sub-hypercall to propagate CPPC data
  xen/x86: introduce "cpufreq=amd-cppc" xen cmdline and amd-cppc driver
  xen/cpufreq: implement amd-cppc driver for CPPC in passive mode
  xen/x86: implement amd-cppc-epp driver for CPPC in active mode
  xen/cpufreq: get performance policy from governor set via xenpm
  tools/cpufreq: introduce helper to deal with CPPC-related parameters
  xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-op
  xen/cpufreq: introduce helper cpufreq_in_cppc_passive_mode()
  xen/cpufreq: bypass governor-related para for amd-cppc-epp
  xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
    driver

 docs/misc/xen-command-line.pandoc         |  14 +-
 tools/include/xenctrl.h                   |   4 +-
 tools/libs/ctrl/xc_pm.c                   |  68 +-
 tools/misc/xenpm.c                        | 131 +++-
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 777 ++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |  74 ++-
 xen/arch/x86/acpi/cpufreq/hwp.c           |   4 +-
 xen/arch/x86/cpu/amd.c                    |  58 +-
 xen/arch/x86/include/asm/amd.h            |   2 +
 xen/arch/x86/include/asm/msr-index.h      |   6 +
 xen/arch/x86/platform_hypercall.c         |  26 +-
 xen/arch/x86/x86_64/cpufreq.c             |  19 +
 xen/arch/x86/x86_64/platform_hypercall.c  |   3 +
 xen/drivers/acpi/pm-op.c                  |  56 +-
 xen/drivers/acpi/pmstat.c                 |   3 +
 xen/drivers/cpufreq/cpufreq.c             | 308 +++++++--
 xen/drivers/cpufreq/utility.c             |  15 +
 xen/include/acpi/cpufreq/cpufreq.h        |  19 +-
 xen/include/acpi/cpufreq/processor_perf.h |  14 +-
 xen/include/public/platform.h             |  26 +
 xen/include/public/sysctl.h               |  29 +-
 xen/include/xen/pmstat.h                  |   5 +
 xen/include/xlat.lst                      |   1 +
 24 files changed, 1522 insertions(+), 141 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

-- 
2.34.1


