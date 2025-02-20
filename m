Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B8A3D57E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 10:55:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893727.1302595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl3GL-0005lN-KV; Thu, 20 Feb 2025 09:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893727.1302595; Thu, 20 Feb 2025 09:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl3GL-0005ih-Gu; Thu, 20 Feb 2025 09:54:33 +0000
Received: by outflank-mailman (input) for mailman id 893727;
 Thu, 20 Feb 2025 09:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gblN=VL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tl3GK-0005fe-5N
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 09:54:32 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2412::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac709805-ef70-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 10:54:29 +0100 (CET)
Received: from DM6PR06CA0100.namprd06.prod.outlook.com (2603:10b6:5:336::33)
 by MW6PR12MB8661.namprd12.prod.outlook.com (2603:10b6:303:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 09:54:25 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:336:cafe::83) by DM6PR06CA0100.outlook.office365.com
 (2603:10b6:5:336::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.16 via Frontend Transport; Thu,
 20 Feb 2025 09:54:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 09:54:24 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 03:54:22 -0600
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
X-Inumbo-ID: ac709805-ef70-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLMGubdQd2fVc5cxjzCqQLzNZOsTJVBXJV4Xuz/YpSsfTaUGnOIOWCLWFy4Kf6WZQn3hlQcMOMpQgWyklJr3ihvkDx+y9ANuXpUU598hHdpZVVV+AOpn/5Mb9DnzF6/RVR755L7ZK0nQPg+z5L5Vec8NH/eoVwbCmpSfUKkJRiMa3qDVo0FLn9LlQHeIJZvNi+XP5WQVtOZh+Vy8vKuzkWikgdUB2ooYujvzX/fE0CaZRl0yBxpY/Khs+bKlTa/jE9DkWrmvYK2nbonBk5szrEBl2o3L0v/b1GYBg9K1XHXj1ZLsJ1P7S7YZozjS73wSp/TwrEcJKvbPHztAqSM3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcfuVCgNryrXIg+YCgKLUIVzNSvHkNXFUZoJ8wJkULI=;
 b=oaMvGAtltqLF9iRYOg3T+CdINz7O2afCZKAH/5nJ/wZSEHRi2NG9/YpxG6XwkEKGvCqX3C3xV375oHJqYVvzMpKXNpXcK1+iQoMiWK+favFjc5D7YUe+4hsRWENSDMXb07tZUMzYlaKsSkCLcNP/35cIOPAmUYn3WrEWrNPNEFCXaZ8z/1KEEq833Ya4HZ4X3mb0rQhVYHevnHMeOMpPxp2Lx9UnNrdWcsnYwZZlhKgEtWAIVTtXBoABTF45ULLmfjyeDtUf2v2G+qtrCJ+lo/yV6q56+pioRcGRGthS96qzwLkVXUqew8yB7hZAHEedk+5WPBv5wO81CyetUn6RWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcfuVCgNryrXIg+YCgKLUIVzNSvHkNXFUZoJ8wJkULI=;
 b=nXS/MOr5fhthnzqUXgAM2yMpCGgI1bPq3mPVf8e4yASoyY1Ok9XDVGn8OpBOJVNuheUBLwY7us8tV8rM9ojXjXvyCHS+tDW21wm4q0fLI9PHdTWnBZRqnJlbiqBBTmVkM0WGPL/R1RItpumnSiyCqrTw7SxkgqhVQQdKY4MgvDI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Sergiy
 Kibrik" <Sergiy_Kibrik@epam.com>, Huang Rui <ray.huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>
Subject: [PATCH v2 2/2] x86/hvm: make ACPI PM timer support optional
Date: Thu, 20 Feb 2025 17:53:49 +0800
Message-ID: <20250220095349.1823593-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220095349.1823593-1-Jiqian.Chen@amd.com>
References: <20250220095349.1823593-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|MW6PR12MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b631ae-2e6b-42cb-8948-08dd51948eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W7XmyeN9jG+mIURE7VCoDopiqLZn9gOG7WBX1yI/rZTuq7+PPCmy2Dm8OI37?=
 =?us-ascii?Q?/XtLiKF2EDIshjYuG4J9xZCVW/skxmFwp0Eey1LVj5J7N3q/DBIPIwcw9QsR?=
 =?us-ascii?Q?TIfQxrn4MT89JubE5FaNeLppYpT9Z5A3kB8U1pJJakh9rHF7KKLtY3ewTEmC?=
 =?us-ascii?Q?jO9sv0c6Rs7adbK24616ELPNeI+2T04zx5Al23PwBUBCoV/goDUyMywJHrJE?=
 =?us-ascii?Q?rypO4da/hrJwLMeKzTrpeNng1eVaLXnhnOmF1eaolM9ja0yg8Y7j6MaplJUI?=
 =?us-ascii?Q?IZBaulAWqMZ3JBFyIaXZKWXN4yuz5jFNo8C09A7k5YzEMBIpv7ZoUAC02Q7d?=
 =?us-ascii?Q?Pzw6KNENtJddUaA0AWyFDSXj1dUfPHSK63rnk6tyfn/aDUSLYwWZVOPJOGKW?=
 =?us-ascii?Q?9k+txBtH/Uto/Z877d8k5IZ+z2Aamxj8U0LQEnEVeOx0nzjTUwJCnTBEGJOC?=
 =?us-ascii?Q?kSV+4XwMOt4hvGvZPJut3zq+F1vAAsQbnCJZ4aaKM77OyH4FGBtWJs+WJk6m?=
 =?us-ascii?Q?Beuy4GBIGedy1oQHoQXrPMOZnXBgS0mciYobC0w69dgKpIQQj1Qq6W88D3KH?=
 =?us-ascii?Q?M6esYPQzymHGg13C7atAIRbkNIATTe/XW3p3SaahyPn0JIVp7aYBKz1/y3mW?=
 =?us-ascii?Q?UQhq6u9hM1UdaGVkArfAstfU9RGjG2tnRu8ZFRchJBB0uXjInOeQ5MQOzy1S?=
 =?us-ascii?Q?3QJz0Jc0rQXwS0uGJaYuFD8pcGLnPIyfC5Ai7+WTPF+4WZ5pDS5ocFnFoMJF?=
 =?us-ascii?Q?L+Poh4POMDjGUGajFDi3Lmecilmx4wYjf1zk85rplj4CCw+rNOhR3ASLDvqs?=
 =?us-ascii?Q?o8scKAs+9kSUMUNXHloDqiR+Mu6H8WBQZNs+EmpXYC25DiQQs3rpd8wKMADm?=
 =?us-ascii?Q?eWSOUMLCdKTn37K/1C54NCmIQhncZy2LJ4+AOm+jAqawMJW1gYfuUfe6t/lT?=
 =?us-ascii?Q?o6miy4FzTaYfPjOMFBQM3PE8v0Ha4Qht9kGu2X+RPImUaGb7Xa7JaOvR8qWS?=
 =?us-ascii?Q?XhJBSk8Udx8AVGT09EIhI9Jbu15gRPoStNXngCvfSZVxwbYbRJlHkeZA0tux?=
 =?us-ascii?Q?Qfo/HDYGbs8yLKUoID3pxM28kzxhMS+ASixAFi2Xk/qRnPOTrQrbbzc+S4kT?=
 =?us-ascii?Q?xFZ2L1gotQ/IbThYNhxlmALk3TWi1qWpIocDzfkd3+caz0RN9PF88pTmKhv4?=
 =?us-ascii?Q?wzDWp+cTBIy4pKtvLAA4/TtZVF92fVha6qpVNxaHS5jVaJn6HYFEK/rDmW3C?=
 =?us-ascii?Q?h81B0Tc8Qr6FZcX4fUwUXv5aMgZCME16BsY2e0YUqWe8lw+kcCosrJqjYF4/?=
 =?us-ascii?Q?syjGpNfuFAlurEuEnTEm1C/Ui1AQX1ZPZsS3gyQh4pV7DhDh7MkdQzOTdvzc?=
 =?us-ascii?Q?maAaUfc0wP1gtyWH8dOAZvLj17Si+OdUXo9gKaUkn5/qfAYVuBtUFfrH0AQw?=
 =?us-ascii?Q?3KNWUGL6lhw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 09:54:24.6509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b631ae-2e6b-42cb-8948-08dd51948eae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8661

From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Introduce config option X86_PMTIMER so that pmtimer driver can be
disabled on systems that don't need it.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi all,
this is a rework for https://lore.kernel.org/xen-devel/20240916063757.990070-1-Sergiy_Kibrik@epam.com/T/#u.

v1->v2 changes:
* Moved definition of "config X86_PMTIMER" into Kconfig.emu.
* Adjusted macro "has_vpm".

Best regards,
Jiqian Chen.
---
 xen/arch/x86/hvm/Kconfig.emu       |  9 +++++++++
 xen/arch/x86/hvm/Makefile          |  2 +-
 xen/arch/x86/include/asm/acpi.h    |  5 +++++
 xen/arch/x86/include/asm/domain.h  |  6 ++++--
 xen/arch/x86/include/asm/hvm/vpt.h | 10 ++++++++++
 5 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig.emu b/xen/arch/x86/hvm/Kconfig.emu
index aa60b6227036..e2d0f5db1d15 100644
--- a/xen/arch/x86/hvm/Kconfig.emu
+++ b/xen/arch/x86/hvm/Kconfig.emu
@@ -11,4 +11,13 @@ config X86_STDVGA
 
 	  If unsure, say Y.
 
+config X86_PMTIMER
+	bool "ACPI PM timer emulation support" if EXPERT
+	default y
+	depends on HVM
+	help
+	  Build pmtimer driver that emulates ACPI PM timer for HVM guests.
+
+	  If unsure, say Y.
+
 endmenu
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4d1f8e00eb68..b7741b0f607e 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -18,7 +18,7 @@ obj-y += irq.o
 obj-y += monitor.o
 obj-y += mtrr.o
 obj-y += nestedhvm.o
-obj-y += pmtimer.o
+obj-$(CONFIG_X86_PMTIMER) += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
 obj-y += save.o
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 217819dd619c..8d92014ae93a 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -150,8 +150,13 @@ void acpi_mmcfg_init(void);
 /* Incremented whenever we transition through S3. Value is 1 during boot. */
 extern uint32_t system_reset_counter;
 
+#ifdef CONFIG_X86_PMTIMER
 void hvm_acpi_power_button(struct domain *d);
 void hvm_acpi_sleep_button(struct domain *d);
+#else
+static inline void hvm_acpi_power_button(struct domain *d) {}
+static inline void hvm_acpi_sleep_button(struct domain *d) {}
+#endif
 
 /* suspend/resume */
 void save_rest_processor_state(void);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 68be23bf3bf4..1f3c02e3088f 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -495,11 +495,13 @@ struct arch_domain
                                  X86_EMU_VPCI)
 
 #define DISABLED_EMU_MASK \
-    (!IS_ENABLED(CONFIG_X86_STDVGA) ? X86_EMU_VGA : 0)
+    ((!IS_ENABLED(CONFIG_X86_STDVGA) ? X86_EMU_VGA : 0) | \
+     (!IS_ENABLED(CONFIG_X86_PMTIMER) ? X86_EMU_PM : 0))
 
 #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
 #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
-#define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM))
+#define has_vpm(d)         (IS_ENABLED(CONFIG_X86_PMTIMER) && \
+                            !!((d)->arch.emulation_flags & X86_EMU_PM))
 #define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC))
 #define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC))
 #define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC))
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
index 0b92b286252d..333b346068de 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -187,10 +187,20 @@ void rtc_deinit(struct domain *d);
 void rtc_reset(struct domain *d);
 void rtc_update_clock(struct domain *d);
 
+#ifdef CONFIG_X86_PMTIMER
 void pmtimer_init(struct vcpu *v);
 void pmtimer_deinit(struct domain *d);
 void pmtimer_reset(struct domain *d);
 int pmtimer_change_ioport(struct domain *d, uint64_t version);
+#else
+static inline void pmtimer_init(struct vcpu *v) {}
+static inline void pmtimer_deinit(struct domain *d) {}
+static inline void pmtimer_reset(struct domain *d) {}
+static inline int pmtimer_change_ioport(struct domain *d, uint64_t version)
+{
+    return -ENODEV;
+}
+#endif
 
 void hpet_init(struct domain *d);
 void hpet_deinit(struct domain *d);
-- 
2.34.1


