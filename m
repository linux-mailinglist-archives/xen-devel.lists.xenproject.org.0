Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62163A5D4ED
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909667.1316563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDN1-0006rI-Ia; Wed, 12 Mar 2025 04:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909667.1316563; Wed, 12 Mar 2025 04:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDN1-0006o8-F5; Wed, 12 Mar 2025 04:07:03 +0000
Received: by outflank-mailman (input) for mailman id 909667;
 Wed, 12 Mar 2025 04:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDN0-0006o2-4U
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2413::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7155ecf5-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:06:59 +0100 (CET)
Received: from BN7PR06CA0053.namprd06.prod.outlook.com (2603:10b6:408:34::30)
 by CH3PR12MB8353.namprd12.prod.outlook.com (2603:10b6:610:12c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 04:06:55 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:34:cafe::b2) by BN7PR06CA0053.outlook.office365.com
 (2603:10b6:408:34::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 04:06:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:06:55 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:06:49 -0500
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
X-Inumbo-ID: 7155ecf5-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCUNTCJ+UAgUi6F6wGVho2B8VJ7REFcD6zAslk3Bcqm2D+evcGXhtKpmrUYnFwfOPJRs3m8zxorNWbRGriOkxctfBeX3jUI/Y+U4nT/ZUALVa+YAA/asm7LhYJ9ccOGL/NFwDGNJBBSV0DImLH0a0bMvSrsUIWMttfJEaoeUzVsWbK9RNvt5RAcQXmJrC8ZiPoXCXgA4Xb1DcRX7LWGkhrplnkDjtm4I2xbr+OMR5sdLaw2TP/+jS9aFj8bSG3FH0sFiS9SE8qIQdjKrH9ElD91BENVvIxEg+ekgwVYhVwz0PlgonWNzIj0g1oQXnFNVQhYr0DrBvnbMROI9YE+MZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTxQn61zy3/kl8uCurFRssFjFGLLxuJqEfkrhfnhTqM=;
 b=m3Ng4zZUEdALU/9b+Ol/QHkH3lGHOkG5CX6K3CmtoTHUrlPSm561SmCBuQC7JNSfRRy9WyNBMAbpB3BbRHRu8KUqZ3Oag8rx2M+uRGib00Ko9XIvB0wo1A8loYcfQYFxet4Bs4As3wptq1ohYVOIKs0Fz74CxzmL8DxIgHPc5a0c2vjzHZZ3dTFhdDsCyAxQk1/ZzF5hE806iINjp5pAZZDod7dNM7/4RP3fqEp09C/+TahFgffCGVqoniosTyR81owJ5av7uoqtNK8k4WeWtDoKOVsRyDUX3juRcdb2qrhr9qRJU1bDV85NN3n8K+PQwL5du7iKHdB4IYaUPAhuHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTxQn61zy3/kl8uCurFRssFjFGLLxuJqEfkrhfnhTqM=;
 b=o5sv1f+f0X1C/xm6sVdC4sW1kjXqrJi5AL+RM6963r52zjsCBnkvdwwn3xP9IniEuMSoQx9ETS3fRjBzsBNm3vGlHvaeSa9x2mTbuGQBpuLWbJafMYgniXQWqoMoe37JIIfpOPDbVKpdFjrH/UO82a2vwcMJ9BfV5piY82MLqwo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Nathan Studer <nathan.studer@dornerworks.com>, "Stewart
 Hildebrand" <stewart@stew.dk>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v1 00/19] xen: introduce CONFIG_SYSCTL
Date: Wed, 12 Mar 2025 12:06:13 +0800
Message-ID: <20250312040632.2853485-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|CH3PR12MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d52ed9-44bd-46d1-d864-08dd611b53b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZJTHSTazxczB35dCe1LStU+XNWdbUaSVCVuoD+XuZk/9mkBjiYdFolP6ckc3?=
 =?us-ascii?Q?o7mKyQjDXNw3zWzBARuToWmcN54ufmKHz+7O8qPXNdKMu0npqPgGJOHqn+10?=
 =?us-ascii?Q?Ivc/XaJnYdBt90xTYgJI8hPg+apVp0+Jku7EvOKEinS49MAmfa7bi3WJxHo1?=
 =?us-ascii?Q?88XmAl3auqQ7OmVUDxha4sCNNjU6btS1fUhUK8Yi16TO7pH/sY6n+l8+RXZ7?=
 =?us-ascii?Q?7DNH/Gz4huLQYqISUa5GJDusd1rwcRhvWzWQG4cQC39ub3v6qorup8UXGRY4?=
 =?us-ascii?Q?ARREUYBcjgZcxCqozuilUVK/YtTPcpIGTYPwi9Spy8ERAPas9dsYxyrqpk95?=
 =?us-ascii?Q?JFKzp7vmX5CPaaGB9WlHjwxr7G1dMNrw1MszZh1A6vyT6Y2fkfhGBexgugth?=
 =?us-ascii?Q?il1WSLsCiP0CMv0Tkj4/6jLm+2cFoZkYxx+SRjEhWE3hlfMToak8UL0schbD?=
 =?us-ascii?Q?FXNEJ0kBXUMtaC41DSEgxIKlHl2cxe3kw65MpfLm88+LVUwU6p0hXKxWvzsF?=
 =?us-ascii?Q?WNebgAu+oxkLLLgNFe0zB4e7HQYWO0adfU7dOxAg0j4mjE9o4sTmVjlmUPJL?=
 =?us-ascii?Q?TscaNI/bNlI9ufI6hBhvqc6frqigG7N4GBcWHx7AiB8hin1OfcrbGB3BlO7e?=
 =?us-ascii?Q?+xM4uMF9ZEk902eA47aAOiRLJpdaZtu0fLeVw6KkrIifGmFqE/bXZ7I7Vavl?=
 =?us-ascii?Q?ik26Pd+qJFXiemTsWreI42V9keeda8XuNbooxn6Vzj49nReESZpc703Ioyo3?=
 =?us-ascii?Q?GmyAb0iNB5EVfe5TQ0xmnUfE8MLbuk5KkKFyl2o4CcE2XGQM9cR80V74I12e?=
 =?us-ascii?Q?KTbjuUG5KsQ1MiI++K+nS91JAuVENVa8Bn4Dl48F3ljqDvpHL0uqsq7V3y5c?=
 =?us-ascii?Q?/zH7TlbEy6v8TDMk56YMQ9ZkMXW+Au60uWT/QZCWJ/CpxRC/jzlQdTVXrbKF?=
 =?us-ascii?Q?eHH3ukuhsyqlcDmMB6ObQa2MmivohtsvON8Fe49hTJ6/U17Se7UmVV2CWiY/?=
 =?us-ascii?Q?ZujASEwyj+fzPOSoB9yWmuvgEcCqL6vLfZVoSvMsEFp+SKAHNYCpm1FN219J?=
 =?us-ascii?Q?UaDZ6AdshaOPSpJ9kA44wBMt/iekJ+AJttvk7J8Dh8cxWIIvsMp7ctQIE5Bp?=
 =?us-ascii?Q?PwMy22jQk4vsxa+pKw4ESifCYbq16qv6wKDUXCnqMuorifNN8yxrZxdUTFcY?=
 =?us-ascii?Q?/f6xkKtSSYunHYHhTQpslzD4+XZTxhpp2Hjw43goi+MBZ3nWocKMg8NlO1FW?=
 =?us-ascii?Q?zH98H/bmGe4GyVgXVff054c3gG92nIiFX+PXB6Rp8V6KJqHgsXL8Czd9kBG+?=
 =?us-ascii?Q?XaCaazd3lO3o4PrLwVUNhAdWXXbhCG8TUOyxNS5n40F0xwkht/OSWnKp0v5d?=
 =?us-ascii?Q?a+GKhXJLO7PAX0bqBxbsnIY1nlS68Np/pLem6AWc+zZKaq8Yphz0eQKbUCGO?=
 =?us-ascii?Q?kB09n0miL80wXBUjJeLmD0kxL3+txosoFeUESs7svcBCPqVZz7eqFeHFFDnH?=
 =?us-ascii?Q?v+ZV9Kb7r03WgfE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:06:55.2447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d52ed9-44bd-46d1-d864-08dd611b53b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8353

It can be beneficial for some dom0less systems to further reduce Xen footprint
and disable some hypercalls handling code, which may not to be used & required
in such systems. Each hypercall has a separate option to keep configuration
flexible.

Options to disable hypercalls:
- sysctl
- domctl
- hvm
- physdev
- platform

This patch serie is only focusing on introducing CONFIG_SYSCTL. Different
options will be covered in different patch serie.

Features, like LIVEPATCH, Overlay DTB, which fully rely on sysctl op, are also
being wrapped with proper CONFIG_SYSCTL, to reduce Xen footprint as much as
possible.

It is based on Stefano Stabellini's commit "xen: introduce kconfig options to
disable hypercalls"(
https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)

Penny Zheng (17):
  xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_readconsole
  xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_sched_id
  xen/sysctl: wrap around XEN_SYSCTL_perfc_op
  xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
  xen/sysctl: introduce CONFIG_PM_STATISTIC
  xen/sysctl: make CONFIG_PM_STATISTIC depend on CONFIG_SYSCTL
  xen/page: fix return type of online_page()
  xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
  xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
  xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
  xen: make avail_domheap_pages() static
  xen/sysctl: wrap around XEN_SYSCTL_physinfo
  xen/sysctl: wrap around XEN_SYSCTL_coverage_op
  xen/sysctl: wrap around XEN_SYSCTL_livepatch_op
  xen/sysctl: wrap around arch-specific arch_do_sysctl

Stefano Stabellini (2):
  xen: introduce CONFIG_SYSCTL
  xen/sysctl: wrap around sysctl hypercall

 xen/Kconfig.debug                            |   2 +-
 xen/arch/arm/Kconfig                         |   2 +-
 xen/arch/arm/Makefile                        |   2 +-
 xen/arch/riscv/stubs.c                       |   2 +
 xen/arch/x86/Makefile                        |   2 +-
 xen/arch/x86/acpi/cpu_idle.c                 |   2 +
 xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
 xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
 xen/arch/x86/include/asm/psr.h               |   2 +
 xen/arch/x86/psr.c                           |  18 ++
 xen/common/Kconfig                           |  17 +-
 xen/common/Makefile                          |   2 +-
 xen/common/page_alloc.c                      |  11 +-
 xen/common/perfc.c                           |   2 +
 xen/common/sched/arinc653.c                  |   6 +
 xen/common/sched/core.c                      |   4 +
 xen/common/sched/cpupool.c                   |   9 +
 xen/common/sched/credit.c                    |   4 +
 xen/common/sched/credit2.c                   |   4 +
 xen/common/sched/private.h                   |   4 +
 xen/common/spinlock.c                        |   2 +
 xen/common/sysctl.c                          |   4 +-
 xen/drivers/acpi/Makefile                    |   2 +-
 xen/drivers/acpi/pmstat.c                    | 192 ++++++++++++++++---
 xen/drivers/char/console.c                   |   2 +
 xen/drivers/cpufreq/cpufreq.c                |  31 +++
 xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
 xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
 xen/drivers/cpufreq/utility.c                | 164 +---------------
 xen/include/acpi/cpufreq/cpufreq.h           |   6 +
 xen/include/acpi/cpufreq/processor_perf.h    |  12 +-
 xen/include/hypercall-defs.c                 |   4 +
 xen/include/xen/acpi.h                       |   2 +
 xen/include/xen/console.h                    |   8 +
 xen/include/xen/hypercall.h                  |   8 +
 xen/include/xen/mm.h                         |  19 +-
 xen/include/xen/perfc.h                      |   8 +
 xen/include/xen/pmstat.h                     |   2 +
 xen/include/xen/sched.h                      |  22 +++
 xen/include/xen/spinlock.h                   |   7 +
 xen/include/xsm/dummy.h                      |  21 ++
 xen/include/xsm/xsm.h                        |  27 +++
 xen/xsm/dummy.c                              |   6 +
 xen/xsm/flask/hooks.c                        |  14 ++
 44 files changed, 464 insertions(+), 208 deletions(-)

-- 
2.34.1


