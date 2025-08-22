Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218BEB315D6
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 12:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089854.1447348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPO7-0000NG-20; Fri, 22 Aug 2025 10:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089854.1447348; Fri, 22 Aug 2025 10:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPO6-0000Kf-UC; Fri, 22 Aug 2025 10:52:50 +0000
Received: by outflank-mailman (input) for mailman id 1089854;
 Fri, 22 Aug 2025 10:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPO5-00083s-7S
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:52:49 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2009::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2076029d-7f46-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 12:52:41 +0200 (CEST)
Received: from BN0PR07CA0001.namprd07.prod.outlook.com (2603:10b6:408:141::12)
 by LV2PR12MB5967.namprd12.prod.outlook.com (2603:10b6:408:170::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 10:52:36 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::b0) by BN0PR07CA0001.outlook.office365.com
 (2603:10b6:408:141::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.19 via Frontend Transport; Fri,
 22 Aug 2025 10:52:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:52:35 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:52:32 -0500
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
X-Inumbo-ID: 2076029d-7f46-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xc4E941inJJ7JuW1HQFc3F0dlBAw/g7spJiphxo4gOy9p7IiC/UAgUcZnDxLBUti9hfreUBDMuK1UeLDEchz82xPAoqrmWTNL06/psnJzDMBzlF5Kyl7b+X+tm/MF5MDbFAG4nZzqVNetFKaRby7RV6s0IPfn7C0rCozPO23m2P6Tt//7KDOrxVtMdrpRKDa2ULBltBOaSWz8+x7B/dSU3UklFQJUxffb7b2CGpEq3e28LmyOijdTx4w7dkucgGxxwx75huL8Erolx2nh4TEQNYZQq7FIeiBMoG/mz4Nfe6/IwUknz/RYBHzmsGghnh0fYr99pr4kUQp3hwkd7a8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyTRsXa1nxvOvIAAQRzY/8n0PjB7nBviO5KjvKKii8A=;
 b=Y8KgQ34cKWW1czYC/kK0aJtM7c7SOnS+6sfqOthi0JmVGqI17w9mv6urzK//WAodp2Th7QDkq5iQ2TbTfRZQEyJOJWgNbTklQvOABG5uPhY3e6juyZkoGKDzP8mHgI3nTP9segwXCuxrP9yuDEyqlohEXMaLoEuIxue80IJwGUtw2kKt5shEaVMpwikDfsNNRtrPqKuKAWZxbJB376d7163t8SbnpgsuhbGJ6asnzBlRfK67IgyXNh0yevuB7xw4islIONiCm+JlvzSl/9RD9qLgyPZ2ZbnEx8QrYBxRavaNmDYG4yIFWdrOWN163Osfy02B8GpmprS1Zpc11iwjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyTRsXa1nxvOvIAAQRzY/8n0PjB7nBviO5KjvKKii8A=;
 b=BpqrKkc4LbkyuwSswOrRsmrjHHjW42HYD01oXT3fmkHY3fOPSTgjmGDs8An2uX336aogIFLROggd0hM1ncAFGaedBWuPeEsu491pcdgGWFF0zzwSnW/AWZhoMK6fIaKa4lHIsXH/3UMJnNtVEJr9okFT1quS4Zsc/N/ONCqzWwU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v7 00/13] amd-cppc CPU Performance Scaling Driver
Date: Fri, 22 Aug 2025 18:52:05 +0800
Message-ID: <20250822105218.3601273-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|LV2PR12MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: 03362aec-0e30-4955-6df4-08dde16a0119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S65i81kCs/B9pDVhArpO931Ctc1iNwQTPq36HgPppXQzARERNmyEoJq6YMS3?=
 =?us-ascii?Q?7Ba2Fr7QPw6vIx55X8unHCjQP/Y4WiRSRnJpm62rbMKAZ9OHtCGDZJZi1L6N?=
 =?us-ascii?Q?OlQyKF49zI3I9miRCbIb9snYXb5T696fKCmk4pzlqMj4MfmjMJD2eaxyG3/F?=
 =?us-ascii?Q?wR0CfU6SkeG7xcBGLPcSde+ifgcFfC8OCDvQMR13Q5kgbuT0laBuPKe+bcT5?=
 =?us-ascii?Q?jzFaa0gM9EfAGWt65xVj2J9u6DtlwI1P0F5DoP5++Snu4/HwLCKd6CGcAvk4?=
 =?us-ascii?Q?yheNcc+msLP82hRs9xgil/VO82Oka5sreMBc/BcuPEjdgkirB/CzNPatTpcz?=
 =?us-ascii?Q?HU75Vvria55mgcH3dGNHd+rQqijSxf/b6asgAYP1RvzUSkj3h581QaFV+M+6?=
 =?us-ascii?Q?ittEzuOYuR5hFS422IONjpfVNmm+rBuUG9Tmoe4WEpT1dFz95JHiUmte3L1i?=
 =?us-ascii?Q?+yxWqiDB0sJpQPi+t0Ex9XCuzlP5E+nLTwR48/og9pfkn1YY0m/Nb6Xzs7eo?=
 =?us-ascii?Q?A06bK3wxMeGH1UGEim1otnuVKhrtCrVr6jc6N4RLZaXiyzFHejj3Pw8H2ipI?=
 =?us-ascii?Q?4N6uAbhG8uzD/H/rsvRWS2YFmtXhrwZ6qsrVDUCaJwdvXKUA/aN7sf4tthzO?=
 =?us-ascii?Q?jyjrDNbj8X0Z5iQUlgqaPuQkwqvFu9l6jpSDyS3r7xFD9hQ/QJXIv6mjBbne?=
 =?us-ascii?Q?5Sk0WN4YuvR9+Ral1HasCD+inug/RbLVNdL0YR6LSt/mZthHLy/AFpZr6X4Z?=
 =?us-ascii?Q?h+HaPbGuwqyqF7ksYs0Dse8dj3aFmu8yhexF14AlVemqOhtBd5lITiOchnoL?=
 =?us-ascii?Q?FqctNwXXAYcJtQ5hpps7/L+CvFf7BWR/124IoEMcJCFrd+51onQOgl750q06?=
 =?us-ascii?Q?voJAPO0der/b1BPkGIkSti113zVbJ4wjdg7RWn1Ttst+Crp46+Xgd+vKtgis?=
 =?us-ascii?Q?Uk0kcDoTRrbp2mwl400JwdYgrYZlZHMSMGMcxWxQ01eg/qUHGcfr7RA/uELv?=
 =?us-ascii?Q?FdoHUSngtqnZddD0pTR7iwZJZYMEMu29Lky00WEGz3V3NOCrSXUaNdWwVxvi?=
 =?us-ascii?Q?Bj85yS/9nwcmizYJtID6CFklDggSTd/lwpHeernMDzL8cPGz1UZCAdLith0D?=
 =?us-ascii?Q?tVHlmmhDBGrDaeCwCZxbHjLAfmdEUJPDcR3HNH9m5CdG7mEeOnpsuIysa0/g?=
 =?us-ascii?Q?/5M3obT4fSqMMQ42pLxpa9jmiuSyqY1MCynBOz/diLkNUmc/SUnS51XWMm2r?=
 =?us-ascii?Q?MKhdVLXv8PyTqO1F1Ev/X2awCpjQXDH7aEwcD71gp+1mx0K2ZiNOlkkSsgY1?=
 =?us-ascii?Q?j6w1BXwfBUVrNBulq+mkUBhGYjnceR0bfHN7RTTGQ2dYQhxCaSEy2KA4z/yF?=
 =?us-ascii?Q?302V4RmGOJ5hrXwirRIlPDQOc0R+l7Iy+lKIRMGuBhLW8gazomB492HsuBQ+?=
 =?us-ascii?Q?p1rpa1POYSfDg1J+t7Ft0NP+/CyCsUdUXof7gXMNL2Ktwrom87GCD6YtTVfl?=
 =?us-ascii?Q?D6EgxzdvtWoNBTF9h0Y5ye668k7nqbwxbhDE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:52:35.7226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03362aec-0e30-4955-6df4-08dde16a0119
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5967

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

Penny Zheng (13):
  tools: drop "has_num" condition check for cppc mode
  cpufreq: rename "xen_cppc_para" to "xen_get_cppc_para"
  tools: fix help info for "xenpm set-cpufreq-cppc"
  xen/cpufreq: add missing default: case for x86 vendor
  xen/cpufreq: refactor cmdline "cpufreq=xxx"
  xen/cpufreq: introduce new sub-hypercall to propagate CPPC data
  xen/cpufreq: introduce "cpufreq=amd-cppc" xen cmdline and amd-cppc
    driver
  xen/cpufreq: implement amd-cppc driver for CPPC in passive mode
  xen/cpufreq: implement amd-cppc-epp driver for CPPC in active mode
  xen/cpufreq: get performance policy from governor set via xenpm
  tools/cpufreq: extract CPPC para from cpufreq para
  xen/cpufreq: bypass governor-related para for amd-cppc-epp
  xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
    driver

 docs/misc/xen-command-line.pandoc         |  14 +-
 tools/include/xenctrl.h                   |   5 +-
 tools/libs/ctrl/xc_pm.c                   |  69 +-
 tools/misc/xenpm.c                        | 104 ++-
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 774 ++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |  76 ++-
 xen/arch/x86/acpi/cpufreq/hwp.c           |   2 +-
 xen/arch/x86/cpu/amd.c                    |   8 +-
 xen/arch/x86/include/asm/amd.h            |   2 +
 xen/arch/x86/include/asm/msr-index.h      |   6 +
 xen/arch/x86/platform_hypercall.c         |  19 +
 xen/arch/x86/x86_64/cpufreq.c             |  19 +
 xen/arch/x86/x86_64/platform_hypercall.c  |   3 +
 xen/drivers/acpi/pm-op.c                  |  48 +-
 xen/drivers/acpi/pmstat.c                 |   4 +
 xen/drivers/cpufreq/cpufreq.c             | 204 +++++-
 xen/drivers/cpufreq/utility.c             |  15 +
 xen/include/acpi/cpufreq/cpufreq.h        |  28 +-
 xen/include/acpi/cpufreq/processor_perf.h |  14 +-
 xen/include/public/platform.h             |  26 +
 xen/include/public/sysctl.h               |  15 +-
 xen/include/xen/pmstat.h                  |   5 +
 xen/include/xlat.lst                      |   1 +
 24 files changed, 1368 insertions(+), 94 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

-- 
2.34.1


