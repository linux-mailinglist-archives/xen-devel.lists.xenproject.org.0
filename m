Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A34B1185B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057176.1425144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBj7-0001Tq-3v; Fri, 25 Jul 2025 06:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057176.1425144; Fri, 25 Jul 2025 06:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBj6-0001QD-UE; Fri, 25 Jul 2025 06:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1057176;
 Fri, 25 Jul 2025 06:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBj5-0007jJ-Hc
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:15 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2415::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcf7bc5b-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:16:13 +0200 (CEST)
Received: from SJ0PR13CA0109.namprd13.prod.outlook.com (2603:10b6:a03:2c5::24)
 by LV8PR12MB9206.namprd12.prod.outlook.com (2603:10b6:408:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:16:07 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::ce) by SJ0PR13CA0109.outlook.office365.com
 (2603:10b6:a03:2c5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.7 via Frontend Transport; Fri,
 25 Jul 2025 06:16:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:16:06 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:16:02 -0500
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
X-Inumbo-ID: dcf7bc5b-691e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NI6BUn2anC7iRl2CI7ISaSYHhDkrSKgmLmYyAAe2TPXW27FvVut3NkYotl+NjZnTbSia1fYFZ8qHwp+RztVufiZ0VTLkBkn2LB/bKsRhWFKbq+QPEKDv23osPq1glK0eYf6+tDWBLWbaaQ6e407zPWjdMZlKe+zkyJi/KVf0NZd24N9V/NJ5kqPmJsiixaebIXlyGEsqP77FbAC1Nmry7IYc61LUQG15CRjSl+JJtXCd4BLssvlyqYZDfg0x73QigEDWfMKP/vr9TLWbpF4hgyfj1/atCXuNPyN7U51GGQiyEp/saWKx0lQxb0REvEFu5ICv6KnmyZ4VT8PouAoiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQfkmLAlNfoJrk50r8mpXwdwQ271RHY6FOQJ2Macq+Q=;
 b=KeFmt7VoLDEn0bYbz4oD4xi58gM+3aVX2PEGJdkKErXdsjnyT8fZNwyHSjwqfket2Yo3jT8IfNAFByVP/OougqG+nPSByTaP7YqfLN+9D5hm6EiK6xjNdvdcwcnkHDxY+dQ+ymx/Ty8RCHM42+udpJ0q8UWyLB+5K+MPD1cY1P1x8T2fY21u8HxNnivcvIYi2I4OSaAZ1P+J9ejmuQdxhhUUSZuX27wLkjh+1FU6946TuXhq/qUSV1YYV/iF5YGnboNx6X4m4757ddLv4xTF4mbY22X/4Y/1pbiaXLLRmhCdmbEd+unELZWeuB/JMFtpEc2VIpdcgrBTcjZob9E1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQfkmLAlNfoJrk50r8mpXwdwQ271RHY6FOQJ2Macq+Q=;
 b=zYp8cwKs16NZC/G2z2xnTPSClyJiXy++NBoNLPUXn1/pEZbYjLz+iZQJnMsIv9UR5dfmdtlx5m6T41c5C3F5NHp+Sy/BNHg7Hoc/UalB/uE4OZEJi3TDQtCDpP6m0+faHSHn41jtSP6ox63/UJP7nQe7w8QGGcCWjeK33NDeqKQ=
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
	<jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: [PATCH 06/11] xen/platform_op: Wrap around XENPF_enter_acpi_sleep
Date: Fri, 25 Jul 2025 14:15:25 +0800
Message-ID: <20250725061530.309953-7-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|LV8PR12MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d83fa56-0dc8-4cec-9c3f-08ddcb42bd78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1VEem51MXdDamRzeC82Q1o2M0piaVVTeVM3TWJxcEgwNllydDNYTVRrem03?=
 =?utf-8?B?Z3NkeEhnbmQxd1laTytTb09XdDlBN1Vnd2ZsUCtHdk9lb0lZYkg0UVFSTjd0?=
 =?utf-8?B?ZGVJQzRmMkx0TGxpOEhtSHVhOHpKOW1udFo2eFV1NWxMR1hVOXNnYWNCVWxq?=
 =?utf-8?B?MndReXZadXp1dGErVEFEbHRodXdxL2prNTdONEUvMTVvZnF2UXovRGhwa3Jx?=
 =?utf-8?B?UkFObTgySWxld0N3R0xLWE0rekdFNS9HZlp5QVhFamg3YTBKMDkzWXVOYW5W?=
 =?utf-8?B?dHFjb2ZQN29jb1c3YXh3aFZJbVF5bGZQeW5yaVQ3VXBVSGVuUE9pQ01vL3FJ?=
 =?utf-8?B?RzRyWENvRkJLNks4a3dpbTVsRE1UZ0N0b1hkVEJRa2VFeGhZdExXTy9tRzdW?=
 =?utf-8?B?blBlRzBXMWZRWTB2Mm1FMCszcmJjV3huRk9BWXAzN3pOZm54azI4NTdyb1dT?=
 =?utf-8?B?dTB2blJvV0tmeWM3V2Ivc01UaTBFUjlQN1hoUUFXMWg1OHIrUGRjSFlDN0sv?=
 =?utf-8?B?TExUTUIrRUZxcVZtZ3p6c2VOMnVYMHNQNEJ6ZVU3TFZmTWh5aGdWT1k0Ykoy?=
 =?utf-8?B?a0VjR0w0Z2JteWJMWmNFUDlUQkpHSXNPT2hZb1JmeWcvemRVSzg3aDEvSk9D?=
 =?utf-8?B?Y01DMzlRVE4xK3BkNkZra1QxTUtBTzczS0kwV1VjT1hvS2E1T3Foa25PTEhz?=
 =?utf-8?B?YU1DSVVkV0V4Sml1T0xtMEd5M2t3SlU2Z0dTZWZCZFUzTnJ2Z0dqTFlxbDFo?=
 =?utf-8?B?b00vaGlCTFdEMit2c1MyQW9iMlRtd1hud0czNE5Bem5VakFiV2NRcXNFQ3N1?=
 =?utf-8?B?TFlOUVZUbzlhdnlNU1V4SXJtUWdsZjBoY1FmLzgzb0loandwSjRad1pWdVFI?=
 =?utf-8?B?ZTVVVHg5cm9UMFRuU2ZQOWdUMXd5Tjl1TFdmS0kyVzdiNHJuQU82SzNsNXBu?=
 =?utf-8?B?WGRsWHZlVW5XQ2ovWjZCNTEyYndqcVNVdzVZa3FIbnEybjEzcFcxMk8zeXdH?=
 =?utf-8?B?azhyMjh0T2dURGpiY0VKU1M2Wk03ZXlWSmpBOCtLRTZyMEh0K0FGWm5ObWZ3?=
 =?utf-8?B?S3BpdXhnRnFFc244cTVQVjk5NHlSb0xyN2dWQlVhMlY4VU9wQi9EK3dlREdE?=
 =?utf-8?B?L2xYSXZ4L1NOMFRUV20wRXdwTzlTMStIa1FiU0N5ZXVjcDRoVCttNWtvaTFX?=
 =?utf-8?B?aWg0OCs0WVd2ZUJ5ZHo3TzVVS0NORExabEtiN0NhdGpUbFkyeDFpaEdoZzBo?=
 =?utf-8?B?RURGTFppQ28zUDdzOWpySjh4MXVQVFh6RUY4UkVtR0tkOGtCakRsWllCemhY?=
 =?utf-8?B?Z2M4OHdieVBzc1VlamM2UlVmcit2ejM0YmtiQXVtUW80M3lTdU9TWE03UUY5?=
 =?utf-8?B?QWZHV3kzamQvZGFrUlNyV3VUYWlpNUxISDhPT1IrNXhMOUt1bWMvZXhuRWRR?=
 =?utf-8?B?R0pLdXJEWlczZE5LL1hYMkM0azUzYjBVeEcrZW03RnNrODh4ZVdUZjZuazVB?=
 =?utf-8?B?UlJaQjdIa1cyemJmeG0wdkdoUUFMNU1QT2txbEZJd2VUUFZFZjFHS0tWanl6?=
 =?utf-8?B?TDJHdWt5RkdtYWplWkJtM2tKOEZRcEJhMS9ZQjMrdEpWY3NzRlIvQTNWNlBB?=
 =?utf-8?B?eStLRnkzalRvQVFHd3IzNzc1UGIyMi82RC9CVmVUQ0gyaUJMUGEwUkd6YThu?=
 =?utf-8?B?cGptb3I5Y1ZCbVRpQUVKZjI0SWtQWWQ0YW1EaUNYalBzbmJWTFZZeWNuM0Rq?=
 =?utf-8?B?NktwWnZxZlVaejd0YmprVjAxQitTUHAvTUw0NlloS21Pblh0bE9zYWlVMEpC?=
 =?utf-8?B?MGNWMDlONEZpMVV0ZFQ0aUlUZUxwOFhJKzRYelBVYUZHYmpjUm5vOTF0WXY5?=
 =?utf-8?B?bjhScGVmeEhJczQ5dHhNQnMzU0tHOGJ0ZjdGQlgrYk8xRlZtbTZHRVhuNndp?=
 =?utf-8?B?aTJuZHVXckpMNEJNN2ZJUXI4NWVkRFpxZDcyLzlHcUVEV0N6T0tDRTVzbjBB?=
 =?utf-8?B?eTBQR0NOaHNJcVFSRFZkQXlrWThUeEthS0FKL29ud2h0azhRK2U3Zmk3OXN2?=
 =?utf-8?Q?n4wkBU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:16:06.2219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d83fa56-0dc8-4cec-9c3f-08ddcb42bd78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9206

Wrap call stack functions of XENPF_enter_acpi_sleep:
acpi_enter_sleep
	enter_state_helper
		enter_state
			freeze_domains
			scheduler_disable
				schedule_dummy
			disable_nonboot_cpus
			acpi_sleep_prepare
			device_power_down
				console_suspend
					console_steal
					suspend_steal_fn
					serial_suspend
				i8259A_suspend
					save_ELCR
				ioapic_suspend
				iommu_suspend
				lapic_suspend
			device_power_up
				lapic_resume
					resume_x2apic
				iommu_resume
				ioapic_resume
				i8259A_resume
				console_resume
					serial_resume
					console_giveback
			tboot_s3_resume
			tboot_s3_error
			acpi_sleep_post
			enable_nonboot_cpus
			thaw_domains

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
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
---
 xen/arch/x86/acpi/power.c       | 4 ++++
 xen/arch/x86/apic.c             | 4 ++++
 xen/arch/x86/i8259.c            | 2 ++
 xen/arch/x86/io_apic.c          | 2 ++
 xen/arch/x86/tboot.c            | 2 ++
 xen/common/cpu.c                | 2 ++
 xen/common/domain.c             | 4 ++--
 xen/common/sched/core.c         | 2 ++
 xen/drivers/char/console.c      | 6 ++++--
 xen/drivers/passthrough/iommu.c | 2 ++
 10 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 2ac162c997fe..a0c76a146793 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -66,7 +66,9 @@ static int __init cf_check parse_acpi_sleep(const char *s)
 }
 custom_param("acpi_sleep", parse_acpi_sleep);
 
+#ifdef CONFIG_PLATFORM_OP
 static DEFINE_SPINLOCK(pm_lock);
+#endif
 
 struct acpi_sleep_info acpi_sinfo;
 
@@ -84,6 +86,7 @@ enum dev_power_saved
     SAVED_ALL,
 };
 
+#ifdef CONFIG_PLATFORM_OP
 static int device_power_down(void)
 {
     if ( console_suspend() )
@@ -376,6 +379,7 @@ int acpi_enter_sleep(const struct xenpf_enter_acpi_sleep *sleep)
 
     return continue_hypercall_on_cpu(0, enter_state_helper, &acpi_sinfo);
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 static int acpi_get_wake_status(void)
 {
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 0fd8bdba7067..1ee9ee120cb2 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -479,12 +479,14 @@ static void __enable_x2apic(void)
     }
 }
 
+#ifdef CONFIG_PLATFORM_OP
 static void resume_x2apic(void)
 {
     if ( iommu_x2apic_enabled )
         iommu_enable_x2apic();
     __enable_x2apic();
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 void setup_local_APIC(bool bsp)
 {
@@ -635,6 +637,7 @@ void setup_local_APIC(bool bsp)
     apic_pm_activate();
 }
 
+#ifdef CONFIG_PLATFORM_OP
 int lapic_suspend(void)
 {
     unsigned long flags;
@@ -727,6 +730,7 @@ int lapic_resume(void)
     local_irq_restore(flags);
     return 0;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 
 /*
diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index 5c7e21a7515c..8a7c89f3827e 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -255,6 +255,7 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq)
     return is_real_irq;
 }
 
+#ifdef CONFIG_PLATFORM_OP
 static char irq_trigger[2];
 /**
  * ELCR registers (0x4d0, 0x4d1) control edge/level of IRQ
@@ -284,6 +285,7 @@ int i8259A_suspend(void)
     save_ELCR(irq_trigger);
     return 0;
 }
+#endif
 
 void init_8259A(int auto_eoi)
 {
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 1816e1c0b9f4..117ceeec633a 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2174,6 +2174,7 @@ void __init setup_IO_APIC(void)
     register_keyhandler('z', _print_IO_APIC_keyhandler, "dump IOAPIC info", 1);
 }
 
+#ifdef CONFIG_PLATFORM_OP
 void ioapic_suspend(void)
 {
     struct IO_APIC_route_entry *entry = ioapic_pm_state;
@@ -2211,6 +2212,7 @@ void ioapic_resume(void)
     }
     spin_unlock_irqrestore(&ioapic_lock, flags);
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 /* --------------------------------------------------------------------------
                           ACPI-based IOAPIC Configuration
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index d5db60d335e3..ee142759acda 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -471,6 +471,7 @@ int __init cf_check tboot_parse_dmar_table(acpi_table_handler dmar_handler)
 
 static vmac_t orig_mac, resume_mac;
 
+#ifdef CONFIG_PLATFORM_OP
 int tboot_s3_resume(void)
 {
     if ( !tboot_in_measured_env() )
@@ -512,6 +513,7 @@ void tboot_s3_error(int error)
     printk("MAC for %s after S3 is: 0x%08"PRIx64"\n", what, resume_mac);
     panic("Memory integrity was lost on resume (%d)\n", error);
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 int tboot_wake_ap(int apicid, unsigned long sipi_vec)
 {
diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index f09af0444b6a..32e803d65da3 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -190,6 +190,7 @@ void notify_cpu_starting(unsigned int cpu)
     cpu_notifier_call_chain(cpu, CPU_STARTING, NULL, true);
 }
 
+#ifdef CONFIG_PLATFORM_OP
 static cpumask_t frozen_cpus;
 
 int disable_nonboot_cpus(void)
@@ -247,3 +248,4 @@ void enable_nonboot_cpus(void)
 
     cpumask_clear(&frozen_cpus);
 }
+#endif /* CONFIG_PLATFORM_OP */
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef293..5eeb3efdfad0 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2411,7 +2411,7 @@ domid_t get_initial_domain_id(void)
     return 0;
 }
 
-#ifdef CONFIG_SYSTEM_SUSPEND
+#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_PLATFORM_OP)
 
 void freeze_domains(void)
 {
@@ -2438,7 +2438,7 @@ void thaw_domains(void)
     rcu_read_unlock(&domlist_read_lock);
 }
 
-#endif /* CONFIG_SYSTEM_SUSPEND */
+#endif /* CONFIG_SYSTEM_SUSPEND and CONFIG_PLATFORM_OP*/
 
 /*
  * Local variables:
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index ea95dea65a58..2ab86e6227df 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2967,6 +2967,7 @@ const cpumask_t *sched_get_opt_cpumask(enum sched_gran opt, unsigned int cpu)
     return mask;
 }
 
+#ifdef CONFIG_PLATFORM_OP
 static void cf_check schedule_dummy(void)
 {
     sched_tasklet_check_cpu(smp_processor_id());
@@ -2978,6 +2979,7 @@ void scheduler_disable(void)
     open_softirq(SCHEDULE_SOFTIRQ, schedule_dummy);
     open_softirq(SCHED_SLAVE_SOFTIRQ, schedule_dummy);
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 void scheduler_enable(void)
 {
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c5afac9f7259..83da6f095aff 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -428,6 +428,7 @@ static unsigned int serial_rx_cons, serial_rx_prod;
 
 static void (*serial_steal_fn)(const char *str, size_t nr) = early_puts;
 
+#ifdef CONFIG_PLATFORM_OP
 int console_steal(int handle, void (*fn)(const char *str, size_t nr))
 {
     if ( (handle == -1) || (handle != sercon_handle) )
@@ -445,6 +446,7 @@ void console_giveback(int id)
     if ( id == 1 )
         serial_steal_fn = NULL;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 void console_serial_puts(const char *s, size_t nr)
 {
@@ -1367,7 +1369,7 @@ void panic(const char *fmt, ...)
         machine_restart(5000);
 }
 
-#ifdef CONFIG_SYSTEM_SUSPEND
+#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_PLATFORM_OP)
 
 /*
  * **************************************************************
@@ -1392,7 +1394,7 @@ int console_resume(void)
     return 0;
 }
 
-#endif /* CONFIG_SYSTEM_SUSPEND */
+#endif /* CONFIG_SYSTEM_SUSPEND and CONFIG_PLATFORM_OP*/
 
 /*
  * Local variables:
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index c9425d6971cb..0a0080452721 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -611,6 +611,7 @@ int __init iommu_setup(void)
     return rc;
 }
 
+#ifdef CONFIG_PLATFORM_OP
 int iommu_suspend(void)
 {
     if ( iommu_enabled )
@@ -624,6 +625,7 @@ void iommu_resume(void)
     if ( iommu_enabled )
         iommu_vcall(iommu_get_ops(), resume);
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 int iommu_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
-- 
2.34.1


