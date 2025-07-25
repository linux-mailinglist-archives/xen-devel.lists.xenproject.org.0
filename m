Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7619DB11851
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057163.1425075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBiq-0007md-Sy; Fri, 25 Jul 2025 06:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057163.1425075; Fri, 25 Jul 2025 06:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBiq-0007jW-PQ; Fri, 25 Jul 2025 06:16:00 +0000
Received: by outflank-mailman (input) for mailman id 1057163;
 Fri, 25 Jul 2025 06:15:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBip-0007jJ-53
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:15:59 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2415::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2b40f27-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:15:56 +0200 (CEST)
Received: from SJ0PR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:334::13)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 06:15:51 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::45) by SJ0PR05CA0098.outlook.office365.com
 (2603:10b6:a03:334::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.6 via Frontend Transport; Fri,
 25 Jul 2025 06:15:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:15:51 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:15:46 -0500
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
X-Inumbo-ID: d2b40f27-691e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1BxfHg8xduJYrlIHmBA8OSSyyW+o3/ZTkkGVhfRPwKemN2cStfeySN2XXx5kmhDBpy2VxhuerONmjoEPrT25d/zpjrppoNzooLqM93JMinqvyh+QUlHwPIvEtlMAokHCFcFZ6Q4Rl427VO5yj7iRMBVr4mRaayhl+OT4dnxT2NCIIErvDvdiejn6NWS8B+FFXZSlPFTv3b93xf/644vXzwP9bmAnLL3lVzl9dblGsFv8jeY+aTQKWsAoxReMtPx4WFZn7JKRb86PuKwd0oPpBbNg0nyybqXTJa7h5XxjGwOAnEhm3NMSpz84bM57u7x7oAL+a/+PQGSdWZqyBeAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBHRWwq2i6/qOdQxjeKiqg0jS1uV02cgUTmyufs7zkg=;
 b=kLFtveLS8wIeIYxlepevCi0HSEMMLPMoq9qVwxFYxHnQLSe84kFZItyrFuIl4sKNWw9UXNoFt5ze3ts1IRSufieMA3Q76IuHspFEzEZrFP1YV/sAVlYlYyrH700Ln5y3zc3Nz/OTUdwTw2kATQbiYjcTGPeiWxxs8Z+RjpWIccHabpY97ksEEq44txU7dWlXL1WHfAkD7iPRm9p05ouMitG/TgkxPTSeFZAuAT4nHgWExeo4Ez4wjJyXQr+30uDd5j7XJoIXx2EOhKw4FfHO2qq4hY3EEIpjzPfnnmtype5trOrxcBjgNzdvTJaGBo+Uct1nAH1o4nIldV499pI29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBHRWwq2i6/qOdQxjeKiqg0jS1uV02cgUTmyufs7zkg=;
 b=SS7r8m7Z3R9+CF5X0OPD8eVoCg1PywQu+BJP0pcP7KsYQSyEm4YwN5JPyVEwnD9cUygDXGhf0WTwG81Y8KHtaF0GY7yAmHbijsksojI/newI5ATm3wtQ+/7rGaUUB/WPX0RNeTVVFCdvx6M6KFuAe/IdtbZPFDvG6gQ0WvMfpVc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Lukasz
 Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?UTF-8?q?Mateusz=20M=C3=B3wka?=
	<mateusz.mowka@intel.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 00/11] Introduce CONFIG_PLATFORM_OP to disable platform_op hypercalls
Date: Fri, 25 Jul 2025 14:15:19 +0800
Message-ID: <20250725061530.309953-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c39d271-86e7-4dfc-91b5-08ddcb42b483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWljdVlwM3E5R251TmFaZ3ZhK2FUajlTZG9ZN2p1cHhlSjBQYUhUcXpjNElD?=
 =?utf-8?B?NlJrMWdadUxpVHpIaDFqa0J5SmF2aC90d2RJRWZQNW5IWHh2S3pTcjhLZmlw?=
 =?utf-8?B?b1JYZzMyaHN1L2U5emdoNm9FVHhhVkx3Q2JudVBYbVhmL0l3WUR3aW9BVDJY?=
 =?utf-8?B?ajU3SnNQSCt2dnJJZWViQi82NUVHWWJPelgwSC9aRGpaaFBSQW5PYXl1NlQ4?=
 =?utf-8?B?SkRqaFRIUUswRm4rMXUveWlpVkVlM2M2MW5OR2Rmd3ZLMW1OSlR1WWg4SlhO?=
 =?utf-8?B?WXFBcUo5cVN0QlkrelV5amFjT0tFNWRRMEd4aGhKcmhUS25aSityUld3Uk5v?=
 =?utf-8?B?L0VZNjRHZHA3L2ZEU0x3OWJjZEw3MExtU3FmMFNkMlVUWFFaaEtucE9zOVBx?=
 =?utf-8?B?dG1tOURySzNLMitJb29NTjRKVHhXUEVaSmRnUk1MZ2RZTVJtamhoenhhbjFE?=
 =?utf-8?B?TTNzTzJYYTJjNnpHTnQ0R01hY2VzalVlWDYzaC9RUHJ4VWN6cDRxNXVHUkdk?=
 =?utf-8?B?Vk5VUFJyOWFZTnFmSnlPejNlMitOSzUrTk9uQXF4U1kzYUlJUG1YdjlEUktI?=
 =?utf-8?B?OGRYdjBmaEJpcytZb0RBRmNKeWVlakZrcEovTVdMVDVEb0tPOVZ2dWlwaTlS?=
 =?utf-8?B?SUMxY0JkVHZDMzdpNmhNbVF6dUVra2ZEdHpQTnhHb0ttVms5RU4yZlk3c2tq?=
 =?utf-8?B?RURpSXc3VmRycVVwL2lzRzhubjhYVEk3RlpjWW5iT0JEcHRYQ3ZibjBFUitC?=
 =?utf-8?B?TUZVbkYwTHFTQmRhTFBkbmR0SGlPdUtDMlhXSXU4WTE2VCtKREw2YnVxTFow?=
 =?utf-8?B?bnVSbENWRzFVNytOUWxMWFR4Vzg3VHpKZzZpc01mbVIxSU5OWnBtcThOUXlG?=
 =?utf-8?B?WUVtVVNwcm1qYUNCdiszcnFqVkZKenArbTNqSTVjTmdqM2RDb2dJMjI0WUlC?=
 =?utf-8?B?YnhEZzA3WGZNOWZWTnhzT1pDUUpzUDJNYTJqMGdyZGNKL2RQK1dFdHl1YTA1?=
 =?utf-8?B?cGJEbGVpdTZLYVNES2xSWjROcXA5OE92cXpyVnYzS1Jac1pHOWN3aGNrdllI?=
 =?utf-8?B?SVpqWkk2aEI4NlUzdGJlYkNHRjRXcW1UeXZnRmJXK1dtWVdTTWZiNDNMb1FZ?=
 =?utf-8?B?WGhqcXNlRk5Obng1YXhOVXBDc28zVVZkRjFWSVkxQzhIdFBVMmdrdkJ1bU5X?=
 =?utf-8?B?UUdsOVF3UlZWQ09GeHRPR0k3NWZWZ3BmRUhIT2pDVFYvQ09TbDBpaU55MXFq?=
 =?utf-8?B?VElEQ3ZsT0JlQThmU1dCNmZiMzV6S3h0R2MzUXVoVExTd0h3b2pmMDZORWs0?=
 =?utf-8?B?WEQ0eEV2bWtsbWZiNGI5cUFTeTluaUx4ZmpGSFZyWWs3VytHRkRhWnN3SnNH?=
 =?utf-8?B?SkxuYzN2NzUrU2RxazR3Tk4xUkcxNng4Zi81ODljR3o1QVdGNzFqUjdGNE02?=
 =?utf-8?B?a3hZNkZIV2w2cjJHbHpNR1BmaXBCUG5oSnI1emJmcldFbnVxQ1A3MHhmdXZ4?=
 =?utf-8?B?YWJ1Mzc3YTlHbEJLbFA2eTcrZkFneWpUQitBZGYyUUlZbG55TnIxVkRlSnNo?=
 =?utf-8?B?NFZ4QkFwSlowQXhySTlna3dXRUkrN2JHQUJLQlhRUjdvZHZSNUFscjNrenhB?=
 =?utf-8?B?TjdubGxYQTRJanR1bCtUaE9WQmNVdUJIOERLa3ljN0pRdDV4NzVzQnM1cGx5?=
 =?utf-8?B?SklObEd0MnRoNUM5U2NJTzhhME1EcEdKV0tweVZqeDFsWHl2RUVxR3A0V2dU?=
 =?utf-8?B?dllmN0dxNHJhRWV6L3FVanhYOFZLRWdjN3Z2SzMvVTBBM1g3U3A2dTYvdzRy?=
 =?utf-8?B?WGFtUnJMWmJWK1RhWnhDQVNhVUpaaVZXbXd5dyt5dmlLK3FvZklnQTNRRUtK?=
 =?utf-8?B?NnR4TGpINjFGUkVsZEI5eGtxUHNUUWVoU1hwTk9PSlVwVHN0M2ZTYmdBWmFp?=
 =?utf-8?B?a2pnUnFCMTVzVEkyZC9sWE9CNHFLMi9SNnl2TmxwZC9mTFljWm43QlNzcHQx?=
 =?utf-8?B?cDRtNDRUckl2THRKNytseHRPRFVlUEYwQUMyQXk4SjhLblFGNWlxRC9nTGk3?=
 =?utf-8?B?RVBNSnJqU0VKRVhJQ3QrOFUvVmxJMEl1WXVUQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:15:51.1942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c39d271-86e7-4dfc-91b5-08ddcb42b483
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

Hi all,
This is a continuation of the disabling some hypercalls handling code series.
https://lore.kernel.org/xen-devel/20250704092952.822578-1-Penny.Zheng@amd.com/

It can be beneficial for some dom0less systems to further reduce Xen footprint
via disabling some hypercalls handling code, which may not to be used &
required in such systems. Each hypercall has a separate option to keep
configuration flexible.

Options to disable hypercalls:
- sysctl
- domctl
- hvm
- physdev
- platform_op

This is for platform_op.
---
cc: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>
cc: Lukasz Hawrylko <lukasz@hawrylko.pl>
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: "Mateusz Mówka" <mateusz.mowka@intel.com>
cc: Dario Faggioli <dfaggioli@suse.com>
cc: Juergen Gross <jgross@suse.com>
cc: George Dunlap <gwd@xenproject.org>
cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
cc: Bertrand Marquis <bertrand.marquis@arm.com>
cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
Jiqian Chen (11):
  xen: Introduce CONFIG_PLATFORM_OP
  xen/xsm: Wrap around xsm_platform_op with CONFIG_PLATFORM_OP
  xen/platform_op: Wrap around XENPF_microcode_update(2)
  xen/platform_op: Wrap around XENPF_firmware_info
  xen/platform_op: Wrap around XENPF_efi_runtime_call
  xen/platform_op: Wrap around XENPF_enter_acpi_sleep
  xen/platform_op: Wrap around XENPF_set_processor_pminfo
  xen/xsm: Wrap around xsm_resource_(un)plug_core
  xen/platform_op: Wrap around XENPF_mem_hotadd
  xen/platform_op: Wrap around XENPF_core_parking
  xen/platform_op: Wrap around platform_op hypercall

 xen/arch/arm/Makefile                 |  2 +-
 xen/arch/x86/Makefile                 |  2 ++
 xen/arch/x86/acpi/cpu_idle.c          |  6 ++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c   |  2 ++
 xen/arch/x86/acpi/lib.c               |  2 ++
 xen/arch/x86/acpi/power.c             |  4 ++++
 xen/arch/x86/apic.c                   |  4 ++++
 xen/arch/x86/configs/pvshim_defconfig |  1 +
 xen/arch/x86/cpu/microcode/core.c     |  6 ++++++
 xen/arch/x86/i8259.c                  |  2 ++
 xen/arch/x86/io_apic.c                |  2 ++
 xen/arch/x86/tboot.c                  |  2 ++
 xen/arch/x86/x86_64/Makefile          |  5 +++--
 xen/arch/x86/x86_64/mm.c              |  6 ++++++
 xen/common/Kconfig                    |  7 +++++++
 xen/common/core_parking.c             |  4 ++++
 xen/common/cpu.c                      |  2 ++
 xen/common/domain.c                   |  4 ++--
 xen/common/efi/common-stub.c          |  4 ++++
 xen/common/efi/compat.c               |  2 ++
 xen/common/efi/runtime.c              |  5 +++++
 xen/common/numa.c                     |  2 ++
 xen/common/sched/core.c               |  2 ++
 xen/drivers/char/console.c            |  6 ++++--
 xen/drivers/cpufreq/cpufreq.c         |  4 ++++
 xen/drivers/passthrough/iommu.c       |  2 ++
 xen/include/hypercall-defs.c          |  6 ++++--
 xen/include/xsm/xsm.h                 | 12 ++++++++++++
 xen/xsm/dummy.c                       |  5 +++++
 xen/xsm/flask/hooks.c                 |  5 +++++
 30 files changed, 109 insertions(+), 9 deletions(-)

-- 
2.34.1


