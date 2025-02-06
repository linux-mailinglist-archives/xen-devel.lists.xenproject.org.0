Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A53A2A331
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882555.1292667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKD-0000oo-ES; Thu, 06 Feb 2025 08:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882555.1292667; Thu, 06 Feb 2025 08:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKD-0000jA-An; Thu, 06 Feb 2025 08:33:29 +0000
Received: by outflank-mailman (input) for mailman id 882555;
 Thu, 06 Feb 2025 08:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKB-0000gq-Ty
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2414::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0672de73-e465-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 09:33:24 +0100 (CET)
Received: from BN0PR04CA0144.namprd04.prod.outlook.com (2603:10b6:408:ed::29)
 by CY5PR12MB9054.namprd12.prod.outlook.com (2603:10b6:930:36::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 08:33:19 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::ac) by BN0PR04CA0144.outlook.office365.com
 (2603:10b6:408:ed::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.29 via Frontend Transport; Thu,
 6 Feb 2025 08:33:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:18 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:15 -0600
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
X-Inumbo-ID: 0672de73-e465-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVDJrP5GeDcA+MIzgISJQZhWkj9RYN3b11bEouKZaA35BYFT9DCB9HkUfBqVTqofycWjD63io3Vil2KZipxcKwzCumPYWOT55fQ7AEBmqG760taBlLWUyKd099hxMnQR0IIZBQhqI0J8m1/UK/cEo5yANoQYmgOs1hW68UCSMezM2BnLShD6O2hf7N4JxUNWNXkjx/wkrqFsfIvSfQsfLncsBW3gEIyi884HkDHBxQhl4vBdcro0F7/s7PY905EXEgIVTxf59fq7+wcXjYJp3glwbf4kKOJ/tCUS+IESIO/Wlhn7WozLyvhFMmk153vsPEV75kOLShzdgV15ForMgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXPN/tS2EgkLMc73jFgEtncJMnvlDmpkNwAlqOFEqSE=;
 b=WTSdwZhRJWLT8vpnYBsW34YACwxOjF2GSMZLiyVhX523mXUR4QO7wHl4UehQ1Rn6sjuxIBkaAx4PQ/BfIFh0gHXJmwk9c2f5w81Gbmi3q9UXiB4VvUUlEW85loVoi1tkCh1xmFJ1hy6K29GwkZaLbeVbREinvOeNDcTrI8j19fGbrbItqsS+ri1hWww3edtYtsyK9jT2THgpJj6M+vN2hYbwkpwPRDb3DlHXQMNS6MbOUWtQuexwP1q2CYfaK29cjsbgyvK/mhqkr+iuFWFlBIm/G//kyCj7h0Rzk6nNsHMK3B+/F+WinkoaSPzXvmM/LJqP08wIj9paAg9W/Uiogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXPN/tS2EgkLMc73jFgEtncJMnvlDmpkNwAlqOFEqSE=;
 b=Xr7KbbLNc61r+pAsdX6x98QZP/znSfIArrYiOWQufrSxLB8RGbTrrSYxNUtM9v7qQUWQTySiEQlt1PJvWS8v2NW+lQeCU4kcjvAr9ThFeCQ3qkkRS9WAYZ0YttOf2NVm5XorJ3Z8JIomb3sKPZ49JYryhA6ZQrLDL9YVhTu90Mw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <Ray.Huang@amd.com>, <Jason.Andryuk@amd.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v2 00/11] amd-cppc CPU Performance Scaling Driver
Date: Thu, 6 Feb 2025 16:32:44 +0800
Message-ID: <20250206083255.1296363-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|CY5PR12MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: 976c488d-da01-4ad8-3789-08dd4688e86a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/3oITQ7MlZ+xM6ye/JboYdsg0OzHP6FlFVMf2kflv1QvH7r6Y1YgEFqYQ0tg?=
 =?us-ascii?Q?iC68TNkA4eW27Xm4V8ssc/6pnnrS8RoXY65e2qsrkkJD1RpUreX5n82UUebF?=
 =?us-ascii?Q?ZkF5spSLQRjHNKf+xSg1e9M9cvkXWFd8IDdL++DPKM81HYrzHqyXH1Gq1AeV?=
 =?us-ascii?Q?SEhxCZ730tWH4aDaAxw40iQy731vbnE1hZFm85LGsWKHQj0w15hmQaA21pX1?=
 =?us-ascii?Q?x43YzHW4DT6RaRn42gK2mfQiY+24fudnZBvLatLGx6vGnK2MeQP9qaZQjiHD?=
 =?us-ascii?Q?CzEeSLHHnx/5INUfKmKpffRxOlFTWYwE0WwA6raTVAdE3+l/tgDb7JpZ3Eta?=
 =?us-ascii?Q?cHjAlUYV1mfAY8jclxC+dePkonyC/gBwFcYfrrlPRpuC/p+I2Rxe0/LI+1U1?=
 =?us-ascii?Q?0tbBXYawJdnzfWFXqznMk5UW9f/yMqPywqfLrGrAc+BTRVqg97aO12pf7roA?=
 =?us-ascii?Q?2bcvETq8f5w/vZajlrRJjUCe225EH5fe8xQp3hfdEdS0XrMIf9Ro4LpVdDoY?=
 =?us-ascii?Q?EZV+FoQyb7nQloGPq3xfBHrn1btKEyi+f3nwjKSrku4x/qKCTgUE50Z0xaLg?=
 =?us-ascii?Q?cWmZpdCAm5SZgrtBIL58eSqfxyQQZrORsXpc3oaMrOqedeUR8cz5vMMcXayJ?=
 =?us-ascii?Q?JW3plDEwEHa0SxK2KMN+9z7CtbxrTqjkMKyZYw3NlP74Va8jqU/h1sI6IyPo?=
 =?us-ascii?Q?+RmOOTBAstA50sSlElEzARK/ydX8ro0HUS6uZ96MVoCvqeoKf1RzboNTbtwD?=
 =?us-ascii?Q?qA0WnNPYm81JquiugPK1Y5Rvcfl92XtsZU45xGQ2wqYhnMiQT4dIfkhZHOoj?=
 =?us-ascii?Q?QzQTiN75Fa83xmwCgij6gxCdfIF86A92AeqONnvWB2MmXBBircuYoakufJdC?=
 =?us-ascii?Q?ZqZ24t3bFJYfvYNlNezkMv/k/Z8/zHjkjZKsd7D6pfKEpIooR/ezkkyvHw4t?=
 =?us-ascii?Q?ahQXVRwnbIlBjxvt/ogv9HmKtC8iy2A5WuJSI4bAoSHc/JjG3UOvpk4HYYDH?=
 =?us-ascii?Q?s10HGutD2ce99ZlQMkq9eBv4YXFX1p0LgOI6+wVw5Bj3Nw2Ilaef6nz+y9Pg?=
 =?us-ascii?Q?SVDGHYzwsgooY+peGWbuSml9JRK9FtR00sCjQQLZ0L/MhdxlRDV+PeAyztQq?=
 =?us-ascii?Q?9WQI0U9Mjm04BFvSSqgi+sh/x4agwsf3jPVMT7XXhT4NoHfOGWKnpldKhgVG?=
 =?us-ascii?Q?23wJ3gFxCfe6KQgSTMqxPDyw0iPxQD6yy6Cym7ysekioo+YjoQqR0BMTGunl?=
 =?us-ascii?Q?gdSiGLuwcKwsLkMFrtCeMLNEoTD9kKF1cALzj+i9KqbHzjYs1em+lcrfcfcs?=
 =?us-ascii?Q?kvT7s68NsJJ+a83QRDOE+PaALoLV0C/Fl1BjfKGZcbPjY+G4tPlE/PbFSFMs?=
 =?us-ascii?Q?q0/f60XWYHByWuL0/+MdklfqM32Rn0OYgAptRmPDcyu799wf1/YbKu0GR9QV?=
 =?us-ascii?Q?ZvLlcmnw1Mw1NNkVqJcjvPJ2umUnBcDt4eyrBhFWq28z5eWkTN1ADIvvTrcQ?=
 =?us-ascii?Q?XgPpWpAkgYVTXsA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:18.4468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 976c488d-da01-4ad8-3789-08dd4688e86a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9054

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
while users add extra `active` flag to select active mode. It will fallback to
`cpufreq=xen` if amd-cppc feature is unavailable on hardware.

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
```

Penny Zheng (11):
  xen/x86: add CPPC feature flag for AMD processors
  xen/x86: introduce new sub-hypercall to propagate CPPC data
  xen/x86: introduce "cpufreq=amd-cppc" xen cmdline
  xen/amd: export processor max frequency value
  xen/x86: introduce a new amd cppc driver for cpufreq scaling
  xen/cpufreq: only set gov NULL when cpufreq_driver.setpolicy is NULL
  x86/cpufreq: add "cpufreq=amd-cppc,active" para
  xen/cpufreq: abstract Energy Performance Preference value
  xen/x86: implement EPP support for the amd-cppc driver in active mode
  tools/xenpm: Print CPPC parameters for amd-cppc driver
  xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
    driver

 docs/misc/xen-command-line.pandoc           |  14 +-
 tools/misc/xenpm.c                          |  18 +-
 xen/arch/x86/acpi/cpufreq/Makefile          |   1 +
 xen/arch/x86/acpi/cpufreq/amd-cppc.c        | 678 ++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c         |  32 +-
 xen/arch/x86/acpi/cpufreq/hwp.c             |  10 +-
 xen/arch/x86/cpu/amd.c                      |   7 +
 xen/arch/x86/include/asm/amd.h              |   1 +
 xen/arch/x86/include/asm/cpufeature.h       |   1 +
 xen/arch/x86/platform_hypercall.c           |  10 +
 xen/arch/x86/x86_64/cpufreq.c               |   2 +
 xen/drivers/acpi/pmstat.c                   |  20 +-
 xen/drivers/cpufreq/cpufreq.c               |  69 +-
 xen/drivers/cpufreq/utility.c               |  11 +
 xen/include/acpi/cpufreq/cpufreq.h          |  31 +
 xen/include/acpi/cpufreq/processor_perf.h   |   1 +
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/platform.h               |  17 +
 xen/include/public/sysctl.h                 |   2 +
 xen/include/xen/pmstat.h                    |   1 +
 xen/include/xlat.lst                        |   1 +
 21 files changed, 907 insertions(+), 21 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

-- 
2.34.1


