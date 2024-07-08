Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A690692A158
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 13:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755305.1163653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmku-00056c-Ul; Mon, 08 Jul 2024 11:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755305.1163653; Mon, 08 Jul 2024 11:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmku-00054q-Qc; Mon, 08 Jul 2024 11:42:04 +0000
Received: by outflank-mailman (input) for mailman id 755305;
 Mon, 08 Jul 2024 11:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQmks-00042h-Mj
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 11:42:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16c23c5b-3d1f-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 13:42:01 +0200 (CEST)
Received: from BN9PR03CA0789.namprd03.prod.outlook.com (2603:10b6:408:13f::14)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 11:41:58 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:13f:cafe::2a) by BN9PR03CA0789.outlook.office365.com
 (2603:10b6:408:13f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 11:41:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 11:41:58 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 06:41:54 -0500
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
X-Inumbo-ID: 16c23c5b-3d1f-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGE7zOpqxHmjwGlys5GDhICzhIr2DA2J4DJc2hci/AOm4gJxDVsYFMGJx6yrxvsXO6El+duMyMHVkrQPvP14PwRIxZ45bPgyyxYwH+arToz/ENzatgjfLncZALohKqxsuvtrHwEoLeTvU7Ju4OOjJKaxMh3mHjtDRcvZQ3/v85ujJyqZAXeh/munrcdNITgbg7i9BphKv3Mbzuormy/1d/+A9Jz+m0YvpEhTb8vp2oHq3UcJB8JX8BxPXxFlmsHKyv6QKb7XDxF7K2IyRJ0EZL/eIuqBo29Y7M9CodAWSrZZhTcHwE+zheIykIxOaWlu4QRRMNDB5LqXIcmFuQspkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSlnFw5PGp5VrI5znVnt18TuUunwL5FC7Z7l+VWzRbc=;
 b=J5yDZdxpczM3TVGpbMiloCh/M2YjFS2a7iTSpCTHMyhpjuf5mTjrltl9PgLTJVN75h0xugX+bT8IER48CruXDbvWj4Ttl6ApLU0pQBeyu4YfDKwCFGeZeWKFWDWxGaVz/BoG6gghk6V2NLQlD4FWDyqsMkYrXTGIVryVRqMZihqQlUne/FSahGkNzgdfvMeVjKlQxn+C4/5tj1ltmuEzUr9sdKg7VUhQBEY2nMrKp6ExOUuw8kwPWFt6oVMyD/K0CnUN0UM88s6u42z2+mAtO5ZBOkaGK/gfbwGYNiBrGXcQNRFp8Fuy+lTpFB1T836kLgsIp3u91LRqtAtiMLVAZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSlnFw5PGp5VrI5znVnt18TuUunwL5FC7Z7l+VWzRbc=;
 b=JXbAODFk9PBfo3mGmJIA6B2WMww6qLzFVbyX870mfAUiFDRnawcZqNvhF6301KsUWdtVHJ/UUVwGi3wTpn2Q/pmwMNSiLR0HjmlL/hsUdpLMK7l2Ovm3uq5KVqxf5On5+5/m+wE5up+0nXHo0TC+NxZbAMGahAI//uDqXWd9+HI=
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
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access of x86 gsi
Date: Mon, 8 Jul 2024 19:41:21 +0800
Message-ID: <20240708114124.407797-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708114124.407797-1-Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 793dcf44-a83e-4a90-5516-08dc9f42f96f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pJ/cj7MV7QGrSXCQdXTvUI2+1k4rZ9HyUma+k7lNs1yeRQP/7Bjy6bsLxZgy?=
 =?us-ascii?Q?qlAtj7QFkmOdT/KOXhvzEFygzG5vIWxb+Qhq0rC5BxouRoLl5l0RAnh38DfZ?=
 =?us-ascii?Q?QJhej/LUQxwm3q54KDD1tlzfp3wRE0EKwijbj7InP6HPlsEy1eC2mW1epZ5v?=
 =?us-ascii?Q?D8NIduX9R5D4//qWrtTvCLkcZKPVur5VUB7Gio9+GfJ+0dGw4dUAAYPk1CF/?=
 =?us-ascii?Q?u0++bg57OfCTR1O8a5+iXZttthn7y9Uk4oix1LWKDvzOisl9wvNDzskcz+xX?=
 =?us-ascii?Q?SST/8vH8S6t+c8u4Ttprhjf72tXj+rftVo1LG6OYCprHp/GMKBLWk/pG6SC2?=
 =?us-ascii?Q?5rG68pGGAiKMNBUSfkwYaAYb5RPjTsiAEoKQ7JACsG45hoE0GqeIZDjfjFOc?=
 =?us-ascii?Q?U3Ns46PnhF17fy0sp8i1nOnL2OMw6Ece69X56OK3f9vvFt/XTb67inkyQ0L0?=
 =?us-ascii?Q?AgqpKNxviKMQe7+lvOGwy8faiShz1yMMIsX6lPIZuPIPDfeyYhm3FJUHsjME?=
 =?us-ascii?Q?kBTn2fPctLqBq+tLqU3bkh4+3Xo5Y9XkR80Lm0mYJHvY257/3096esM89ZR4?=
 =?us-ascii?Q?vRF1Tl6pRmVVuuUT2yiAlk2hE5Gcs9gvfSFukrATqHYrkybmoXNhj5VsCWpU?=
 =?us-ascii?Q?1K4iktBl7Ba/aCGDk7mlcpRoaxgrB48Hh06lyK3/CikMpE31LJ+eowP7GfJW?=
 =?us-ascii?Q?Sx3Kjkx1qHqupjiIP1RrHPIsJLr5G8ezGxY0p5oL8Q7wcCP88zudHKhU7nZ7?=
 =?us-ascii?Q?DrjUCxCtiHiPjQ+AI8tfzLIY56P0jYehBiUOphkUFX4eq989H0oDnJ1A4SB6?=
 =?us-ascii?Q?0E/KKHtlxxoB4ewGi/FTkIShvENRCwrAuHlZ7XuAFn03SL0NUrCvUkvx1zHz?=
 =?us-ascii?Q?0u29R6phDIjxwqmmUKWN22VYHS9AFcB2UsN670wKij/i40dcoGznyFRQoUGV?=
 =?us-ascii?Q?nwIwsWKvgyemZ9JJv5ZVmDW96mGbS86y7SDEPT+9hLPdLH1CaqdT+pkARfN6?=
 =?us-ascii?Q?TEgQKfSYEUQfH9wyULCz0Iz1b7O/IAOxd6AQ7HPcFxYE8ByT74HwGChveMlE?=
 =?us-ascii?Q?j1dH/OB0sCG1O2nLhuKtuNGdu3EnEQUJfxeLKB7pWNS4CT54xK+I8l70S31m?=
 =?us-ascii?Q?SIWFi5i7OPADOCMX9OtujASX93MFM/lWNG4RTjHVglZdlV9We7lhmREhCIxK?=
 =?us-ascii?Q?htEIFaj8cI6WjNFu/ILHgvvksMYQp/oOIdZppHlfd8tcj9XafSZsZgTph9lA?=
 =?us-ascii?Q?4xItpQCgz800Gq4v5H/7luO4OJdjferE4JdXUgLIB449XBOfP51hSscvsH1u?=
 =?us-ascii?Q?C5OZBFN1WgPA3i4xGaMO+SLl58/+PKK0xgTvvZ9nTKWYZTQsQRUZVBfo0kWI?=
 =?us-ascii?Q?Yr8XeghjUGkQ62p7bmH6g4Gsvvhe2Rsx/WJhp0rsbxqM3j2IpGPqYR6J6JZd?=
 =?us-ascii?Q?zXbGfqwOisG+++8kpl9Vfx62roOiGpd+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 11:41:58.0623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 793dcf44-a83e-4a90-5516-08dc9f42f96f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461

Some type of domains don't have PIRQs, like PVH, it doesn't do
PHYSDEVOP_map_pirq for each gsi. When passthrough a device
to guest base on PVH dom0, callstack
pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
irq on Xen side.
What's more, current hypercall XEN_DOMCTL_irq_permission requires
passing in pirq to set the access of irq, it is not suitable for
dom0 that doesn't have PIRQs.

So, add a new hypercall XEN_DOMCTL_gsi_permission to grant/deny
the permission of irq(translate from x86 gsi) to dumU when dom0
has no PIRQs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
CC: Daniel P . Smith <dpsmith@apertussolutions.com>
Remaining comment @Daniel P . Smith:
+        ret = -EPERM;
+        if ( !irq_access_permitted(currd, irq) ||
+             xsm_irq_permission(XSM_HOOK, d, irq, access_flag) )
+            goto gsi_permission_out;
Is it okay to issue the XSM check using the translated value, 
not the one that was originally passed into the hypercall?
---
 xen/arch/x86/domctl.c              | 32 ++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/io_apic.h |  2 ++
 xen/arch/x86/io_apic.c             | 17 ++++++++++++++++
 xen/arch/x86/mpparse.c             |  5 ++---
 xen/include/public/domctl.h        |  9 +++++++++
 xen/xsm/flask/hooks.c              |  1 +
 6 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 9190e11faaa3..4e9e4c4cfed3 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -36,6 +36,7 @@
 #include <asm/xstate.h>
 #include <asm/psr.h>
 #include <asm/cpu-policy.h>
+#include <asm/io_apic.h>
 
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
@@ -237,6 +238,37 @@ long arch_do_domctl(
         break;
     }
 
+    case XEN_DOMCTL_gsi_permission:
+    {
+        int irq;
+        unsigned int gsi = domctl->u.gsi_permission.gsi;
+        uint8_t access_flag = domctl->u.gsi_permission.access_flag;
+
+        /* Check all bits and pads are zero except lowest bit */
+        ret = -EINVAL;
+        if ( access_flag & ( ~XEN_DOMCTL_GSI_PERMISSION_MASK ) )
+            goto gsi_permission_out;
+        for ( i = 0; i < ARRAY_SIZE(domctl->u.gsi_permission.pad); ++i )
+            if ( domctl->u.gsi_permission.pad[i] )
+                goto gsi_permission_out;
+
+        if ( gsi > highest_gsi() || (irq = gsi_2_irq(gsi)) <= 0 )
+            goto gsi_permission_out;
+
+        ret = -EPERM;
+        if ( !irq_access_permitted(currd, irq) ||
+             xsm_irq_permission(XSM_HOOK, d, irq, access_flag) )
+            goto gsi_permission_out;
+
+        if ( access_flag )
+            ret = irq_permit_access(d, irq);
+        else
+            ret = irq_deny_access(d, irq);
+
+    gsi_permission_out:
+        break;
+    }
+
     case XEN_DOMCTL_getpageframeinfo3:
     {
         unsigned int num = domctl->u.getpageframeinfo3.num;
diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index 78268ea8f666..7e86d8337758 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -213,5 +213,7 @@ unsigned highest_gsi(void);
 
 int ioapic_guest_read( unsigned long physbase, unsigned int reg, u32 *pval);
 int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val);
+int mp_find_ioapic(int gsi);
+int gsi_2_irq(int gsi);
 
 #endif
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index d2a313c4ac72..5968c8055671 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -955,6 +955,23 @@ static int pin_2_irq(int idx, int apic, int pin)
     return irq;
 }
 
+int gsi_2_irq(int gsi)
+{
+    int ioapic, pin, irq;
+
+    ioapic = mp_find_ioapic(gsi);
+    if ( ioapic < 0 )
+        return -EINVAL;
+
+    pin = gsi - io_apic_gsi_base(ioapic);
+
+    irq = apic_pin_2_gsi_irq(ioapic, pin);
+    if ( irq <= 0 )
+        return -EINVAL;
+
+    return irq;
+}
+
 static inline int IO_APIC_irq_trigger(int irq)
 {
     int apic, idx, pin;
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index d8ccab2449c6..7786a3337760 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -841,8 +841,7 @@ static struct mp_ioapic_routing {
 } mp_ioapic_routing[MAX_IO_APICS];
 
 
-static int mp_find_ioapic (
-	int			gsi)
+int mp_find_ioapic(int gsi)
 {
 	unsigned int		i;
 
@@ -914,7 +913,7 @@ void __init mp_register_ioapic (
 	return;
 }
 
-unsigned __init highest_gsi(void)
+unsigned highest_gsi(void)
 {
 	unsigned x, res = 0;
 	for (x = 0; x < nr_ioapics; x++)
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 2a49fe46ce25..877e35ab1376 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -464,6 +464,13 @@ struct xen_domctl_irq_permission {
     uint8_t pad[3];
 };
 
+/* XEN_DOMCTL_gsi_permission */
+struct xen_domctl_gsi_permission {
+    uint32_t gsi;
+#define XEN_DOMCTL_GSI_PERMISSION_MASK 1
+    uint8_t access_flag;    /* flag to specify enable/disable of x86 gsi access */
+    uint8_t pad[3];
+};
 
 /* XEN_DOMCTL_iomem_permission */
 struct xen_domctl_iomem_permission {
@@ -1306,6 +1313,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
 #define XEN_DOMCTL_dt_overlay                    87
+#define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1328,6 +1336,7 @@ struct xen_domctl {
         struct xen_domctl_setdomainhandle   setdomainhandle;
         struct xen_domctl_setdebugging      setdebugging;
         struct xen_domctl_irq_permission    irq_permission;
+        struct xen_domctl_gsi_permission    gsi_permission;
         struct xen_domctl_iomem_permission  iomem_permission;
         struct xen_domctl_ioport_permission ioport_permission;
         struct xen_domctl_hypercall_init    hypercall_init;
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 5e88c71b8e22..a5b134c91101 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -685,6 +685,7 @@ static int cf_check flask_domctl(struct domain *d, int cmd)
     case XEN_DOMCTL_shadow_op:
     case XEN_DOMCTL_ioport_permission:
     case XEN_DOMCTL_ioport_mapping:
+    case XEN_DOMCTL_gsi_permission:
 #endif
 #ifdef CONFIG_HAS_PASSTHROUGH
     /*
-- 
2.34.1


