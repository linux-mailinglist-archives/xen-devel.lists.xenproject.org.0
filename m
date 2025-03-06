Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A51A5451D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903104.1311043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mP-000372-6v; Thu, 06 Mar 2025 08:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903104.1311043; Thu, 06 Mar 2025 08:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mP-00034D-3l; Thu, 06 Mar 2025 08:40:33 +0000
Received: by outflank-mailman (input) for mailman id 903104;
 Thu, 06 Mar 2025 08:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mO-00031D-04
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:32 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:200a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4c32f27-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:24 +0100 (CET)
Received: from CH0PR13CA0040.namprd13.prod.outlook.com (2603:10b6:610:b2::15)
 by BL1PR12MB5707.namprd12.prod.outlook.com (2603:10b6:208:386::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 08:40:17 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::c0) by CH0PR13CA0040.outlook.office365.com
 (2603:10b6:610:b2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.11 via Frontend Transport; Thu,
 6 Mar 2025 08:40:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:16 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:13 -0600
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
X-Inumbo-ID: a4c32f27-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lR1vijV7JzXvl5EUAAjeT2GUawPMi4dkiVUQp+h7kHzTBeAuxgf6yH9Siu0cNFu2cT4j9dk6c3O3jrSjY3YqA8mB3uUuUxAbg4QuCuwWfgpzb9N/POLJ2OgByisTCzLHH7x35WtVMw39lsCjRwMJNh7Zt4GQb8v+rETI6GKTomHzk0CYNLrm2W5Wu1WN2Ku8BlFG7nr6Bu6BlIgrIesugowVhHELShTM5Wbr2rUVpxkxCNyKNzcf3EHUf5YDfft7W/2fRvLpfNNZ7usZRxuk7sp5dZLWIdt5KQVJvyzxKUCamQPnc0y/vedFR9Uj5zybkXBioJ+ixgCav0z6K+1DWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLa4URw5/fSo6XciW9nbnUXzZVf1ijPFAaF6bNSCkw4=;
 b=QG5XzR7h9ZrnWi/3zI4qN6p1CG5CuoWgEK6qgRSCgZbWVvWWS3vcOfhWJIdkPmGXmetrP9afgSMzExsK4uAKpg+KGQBdwi2sEqXVV3STAnfG64pT1DO5rvElJR9anvwd6ZEBfi6nakvZJ8MYwsUK1u/sIPZZgB5BPkhc9kLj2dt0Mfn+XBVypUbG9WmT1FR7zk179jfDBx7DKAN9VHsYEW816pSSom6UtJk9SHgUjI8Esi40vbhPxuEMJQevwT8VtibKHoIchu8+ib/LoDmHEvLt5k5riDYm5jIVB5E52a8GgWHZr8NzUPlOgkq9zCMbvW38wuCRsWgQkXqza0wErA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLa4URw5/fSo6XciW9nbnUXzZVf1ijPFAaF6bNSCkw4=;
 b=Jvbsu3Zk06TI6ksL3gPdaS3xKxga1ziYDLv+3r8nmpbu8JXom9/ek+8M7oEcogQ2HlcYy6CpXMl6VfP/pf6i2bz5w75k3olka1JHO2wDFHoYJiubRthONr84EH3C/4fSRa/ZpFNayjuO+rBBhXAuCb6Gm8XMTknaI83QrWFjmTs=
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
Subject: [PATCH v3 00/15] amd-cppc CPU Performance Scaling Driver
Date: Thu, 6 Mar 2025 16:39:34 +0800
Message-ID: <20250306083949.1503385-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|BL1PR12MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 3785c4aa-33b5-4005-488f-08dd5c8a853c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X0kjspoYMBJcYzo/vVBdbNal+NzSENSz7X62BilbNjXDmJsfjzSqWAymy5zg?=
 =?us-ascii?Q?yEUCMz/MjXUvo2P4oVBDDRGIdvvJtgmcJcN3ngz2cXklhjntI7fofNELH+01?=
 =?us-ascii?Q?tcolsJSCFEtU1yIZNm2SYr27xtuLYDU99m74fdrPBsFrpBbpKGwL1oTsFk60?=
 =?us-ascii?Q?HhYlqZqGxso8qYDY+tIKctMO4dmVrL0eEJkgz6RXo6jdsVPmdRU1NFBCncm9?=
 =?us-ascii?Q?ZH6ZoXWzMxFWdV5EW40bbNS9gcczZ3p4wJDzi6dRpc/BI2TIbiMqsuQ0MqrL?=
 =?us-ascii?Q?2BV1fCu6ZgiHrCDh6DEC/a1vQL+MRT1nqmj0KCErXGjDRzydcYpDOql6g2TV?=
 =?us-ascii?Q?OYuM5EAkbvoDiBCAdBiLHWttQzVRz0yeP/NgGf1IT4FNYkPJKXvVbA2Rpnpn?=
 =?us-ascii?Q?pr2oIcv5jUZmcJ2UMGWT4UtDCvvEAOSwFnvXvSnn+vrWXqsysADK9B2pRw54?=
 =?us-ascii?Q?K338A7iB5L/pQgJ/MV4pkUAyXKpNfjrMKMyRtoyciA9sqpyiTWSLwK9CYyHZ?=
 =?us-ascii?Q?DwiKZ0auaR2ae5Zr0c5h7BTeIH1SMiU1ZxuQbDZ7e4xxUXpc1yGe5WEqQA76?=
 =?us-ascii?Q?txQWgGZcEDAH73/JuNftUBBa2GT1nePGrEbu6l0AavVjErgysCj5FfZd5tu5?=
 =?us-ascii?Q?GIxaiAzTmdWRCPwiFzGGEDpLnuvb2iGlolydlA0YtCcqnXqAeRik4lPY3xKs?=
 =?us-ascii?Q?YLfHq0j5++jJz/9vJTwSbF6lO5dHHn9ZQ0xaeuyRiwKSy3450qWvRG7se+28?=
 =?us-ascii?Q?/lSMMSV0Mel2w+zXx3TiC8FwuECr9vncBUKuMKrFOmbyUfSiFSZHrYogpAho?=
 =?us-ascii?Q?tZDMmhkEi+iQ/h95pnxx4ofnuTNJsV6aNquxFz4F9MNRXE5HZG0pXqYAW24z?=
 =?us-ascii?Q?c8QOnFDytyu2t0GEx5KAqCrQfO33KMFz67PUDXKYZdSEi+xKkULxppymuayL?=
 =?us-ascii?Q?quLJUce2B10rR1zAzoC6a8ePvr8UEVDDVq681E4gRIJTAGn5ekQ64tum3Dt+?=
 =?us-ascii?Q?JcTjBZTxBzkmeKc/9152jOO2opdOtycznKISY6F6NOkS6mRBtS0vGD7EH6BS?=
 =?us-ascii?Q?dSMxdF1V8Bm5pnpMj7eNaFQlVnGfwJIgw/AsAsRZ++LaO099eOPegtpXSG5Q?=
 =?us-ascii?Q?9AsNHB/wwWNs7pP9SjjOLqeTH5Irx9M2U7bMkhvTzuf6OakoLhQxwj1YslBq?=
 =?us-ascii?Q?bdG5OximX2ifrLsMjXQWBXwvuUJLwSrPR/VJ3Ot8RhIBdUg3LBOR7/BG2Vr9?=
 =?us-ascii?Q?JGa6OaxDal6fam6BCHVo8mBQSfPa3z1GMzxgloPGm6a1zBw04ksxlezCtGpz?=
 =?us-ascii?Q?GuY+13GOvEU2EvCbVagOi4Cehz6AxpIg2szeVLV+cf0lOVNpIe+wE9Dz777M?=
 =?us-ascii?Q?8gUMS4zjFb/sPWwXlhWErSvM8u1CDsmH9cgLDDz/Tgu/RxpaMpNPNOOSuRgL?=
 =?us-ascii?Q?r83rtqmxlASGYHIVQ2Jy+5mfjTLBhQW1m8ebKLXMBdP17XAWKzWiWFy72AZl?=
 =?us-ascii?Q?umYPg3IAVRxxlrI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:16.6261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3785c4aa-33b5-4005-488f-08dd5c8a853c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5707

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
  xen/cpufreq: introduces XEN_PM_PSD for solely delivery of _PSD
  xen/x86: introduce new sub-hypercall to propagate CPPC data
  xen/cpufreq: refactor cmdline "cpufreq=xxx"
  xen/cpufreq: move XEN_PROCESSOR_PM_xxx to internal header
  xen/x86: introduce "cpufreq=amd-cppc" xen cmdline
  xen/cpufreq: disable px statistic info in amd-cppc mode
  xen/cpufreq: fix core frequency calculation for AMD Family 1Ah CPUs
  xen/amd: export processor max frequency value
  xen/x86: introduce a new amd cppc driver for cpufreq scaling
  xen/cpufreq: only set gov NULL when cpufreq_driver.setpolicy is NULL
  xen/cpufreq: abstract Energy Performance Preference value
  xen/x86: implement EPP support for the amd-cppc driver in active mode
  tools/xenpm: Print CPPC parameters for amd-cppc driver
  xen/xenpm: Adapt cpu frequency monitor in xenpm
  xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
    driver

 docs/misc/xen-command-line.pandoc         |  27 +-
 tools/libs/ctrl/xc_pm.c                   |  12 +-
 tools/misc/xenpm.c                        |  23 +-
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/acpi.c          |  14 +-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 681 ++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |  34 +-
 xen/arch/x86/acpi/cpufreq/hwp.c           |  10 +-
 xen/arch/x86/acpi/cpufreq/powernow.c      |   2 +-
 xen/arch/x86/cpu/amd.c                    |  37 +-
 xen/arch/x86/include/asm/amd.h            |   1 +
 xen/arch/x86/include/asm/msr-index.h      |   5 +
 xen/arch/x86/platform_hypercall.c         |  25 +
 xen/arch/x86/pv/dom0_build.c              |   1 -
 xen/arch/x86/setup.c                      |   1 +
 xen/arch/x86/x86_64/cpufreq.c             |   4 +
 xen/common/domain.c                       |   1 +
 xen/drivers/acpi/pmstat.c                 |  54 +-
 xen/drivers/cpufreq/cpufreq.c             | 258 +++++---
 xen/drivers/cpufreq/cpufreq_ondemand.c    |   2 +-
 xen/drivers/cpufreq/utility.c             |  18 +
 xen/include/acpi/cpufreq/cpufreq.h        |  31 +
 xen/include/acpi/cpufreq/processor_perf.h |  18 +-
 xen/include/public/platform.h             |  38 +-
 xen/include/public/sysctl.h               |   2 +
 xen/include/public/xen.h                  |   1 -
 xen/include/xen/pmstat.h                  |   4 +
 xen/include/xlat.lst                      |   3 +-
 28 files changed, 1160 insertions(+), 148 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

-- 
2.34.1


