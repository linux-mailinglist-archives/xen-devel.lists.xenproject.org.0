Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DDF91D1A1
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jun 2024 14:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751115.1159019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtlF-0000Bc-9S; Sun, 30 Jun 2024 12:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751115.1159019; Sun, 30 Jun 2024 12:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtlF-00008t-48; Sun, 30 Jun 2024 12:34:29 +0000
Received: by outflank-mailman (input) for mailman id 751115;
 Sun, 30 Jun 2024 12:34:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aV4l=OA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sNtlD-0007C1-Dy
 for xen-devel@lists.xenproject.org; Sun, 30 Jun 2024 12:34:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2418::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16217c99-36dd-11ef-90a3-e314d9c70b13;
 Sun, 30 Jun 2024 14:34:26 +0200 (CEST)
Received: from CH0PR07CA0020.namprd07.prod.outlook.com (2603:10b6:610:32::25)
 by IA1PR12MB6065.namprd12.prod.outlook.com (2603:10b6:208:3ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sun, 30 Jun
 2024 12:34:20 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::63) by CH0PR07CA0020.outlook.office365.com
 (2603:10b6:610:32::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Sun, 30 Jun 2024 12:34:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Sun, 30 Jun 2024 12:34:20 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 07:34:16 -0500
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
X-Inumbo-ID: 16217c99-36dd-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqSLTDOqs96c5KP057H160FtIi4ZVmm/CX5ZD+ZM/CFWd+mAFr4uVMQX/G7n8Sf6hwOp5Dui7itOXSsBu25cP/LcmVc3qmYXnzPJ+sxnz8zLuCjzl0+dtu/yYndGj5ZyCdqtHXA12mfVZnEEGSrtOVe/GYIa8xYZgU4UTf0RdlR07RKJ0ZB/3M1Vi5puqxJoyvO00IOMYHxwc8gfDSJYlOdZju8Ov6OWDPDbr8xRP06ZfPQkZkgmyrxHbU3umIqJnfwNvxDbcSiEuCLxg1qGfnoLI69AtAk6WeimZfm4qCe81Bc4YKPeviFECcL9J1yc/3EmRpoyA+7JSII25JsbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEDL2Ue2C9U9cBafxmiXxoyp43uQlrhbX1J3rhhqNwM=;
 b=W8TxnQnfr/2VyRB8pWD2/SbOw5PhhXxe+IAKXvgF7ooilFKiZXfclHjCD2Yze0UL0FlAyrs3QBW3iX5VK1sOv8e6hHxt86jlQd8EA0PNWXRW/SI9fK3jpHzYjwTYkkqHQFcO00a+DDWHLs4IZ/JvsJZscq6MZHdyXzV9XU8WxTtrzl500sAGON5TQVlSnf49N2reucTFL5G0+ovtddeiBdumBjCUpodcX17Kw/eUUqj6agH6neoVDbVjRTRfqKOkdOgK8ozldW0AFnNwVP1i5q1aNJxKckHpLuCwGW+acgQDb314P4PBgzPPbNdoPYzBqCtnDgpCFrkLXaN7yP7JZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEDL2Ue2C9U9cBafxmiXxoyp43uQlrhbX1J3rhhqNwM=;
 b=1JHGmz4+gYKAh+ZrIG0DxqmnbqX3uiJxr3oNaTBrJ2HCRvb82sdrm5mJfM1wVCaLvwwVj05Kj05oOs7Wc96Eypgz5fkXUiHGrUHzK40ax0oD2cUv0/LDELGQOj8a+G4QOM+DXYaAzZI9rUu2BffcX4IU4oiaVrrZiwb5b18p2bU=
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
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [XEN PATCH v11 5/8] x86/domctl: Add XEN_DOMCTL_gsi_permission to grant gsi
Date: Sun, 30 Jun 2024 20:33:41 +0800
Message-ID: <20240630123344.20623-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630123344.20623-1-Jiqian.Chen@amd.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|IA1PR12MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bc0807-671d-4e18-8e19-08dc9900f6f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CEDPZFLoglkQhdJfX29Fy5XwZMxYNwNuis2n3gNzJxfg1stWRWJBzz69lzej?=
 =?us-ascii?Q?LrejBdWDHmAZYz2/+zwi7nV5g5mWQFsBXcmjsHzf3VJKo3+Ie3r5qxH9Uf9r?=
 =?us-ascii?Q?N6TGCBg+WGwkU0F38uKa5T+lB8DUUeVj0bxZWPImtsJ7Bz8KwjEZilmL7k/j?=
 =?us-ascii?Q?e5o3uoTlY/1RLjMRib6jAZe6qg0yq8HDwYixhfm8D0wIL7DhqLjxiGkocCx1?=
 =?us-ascii?Q?Ay+Iz3hHeAWaz9OVEddXnG/WatU8a8QM8CLJFxfv0/m5NXgyfJhoj/+zw7BU?=
 =?us-ascii?Q?OeUlzSJHjPuICaMBO0Ts2WaWli3m8iXibDdd3fNNMCGIFXMtRVkcUZdlf4M8?=
 =?us-ascii?Q?Prgwx0xtyTsC0x6Bzij373FluRwVzOLsXGtomwzNmLT6aTsRCEjxYv5OX808?=
 =?us-ascii?Q?SH5L2kAwiyAGWwo0I5MqmYoFxxhBJqDgOptmbvYgroRMa4j2667buLpLOEfE?=
 =?us-ascii?Q?/JGjdQGaVMxhQse92qPOP2/R9YBawjpDYBYpmsl+F/m6QBoGe0DebA2dXqOO?=
 =?us-ascii?Q?cJHOESd4NOEDj5NE97Rv8/P66h1eGBiVu1puB+lko/u9IIIRbo/qx0mqaPX5?=
 =?us-ascii?Q?nYM8pBYA4W6Q1a70bZeIGZgQrc4EPldRyJP04KcJgI8RgHqdUhtYCz4nAvws?=
 =?us-ascii?Q?zRH/EEhr06YRsOyX+ZWp/4jtXoOA3kC4D3ycYRAgXYpldTv/sqx5X56sSfrF?=
 =?us-ascii?Q?BTpldTeTdKGoB630lrZ3to2NrbDK6YIF+2RNRV5pz6bCW13vcC6IIDPieKO8?=
 =?us-ascii?Q?Yflwqhq+adMAAzR+KAY+njykHwLGTSDsJ6k9YgqCiPQ3DFNYSF++18I84zIy?=
 =?us-ascii?Q?n1ZWEPHYFjkpoHkYOtT2jjZikD9JX+e6+Q5MP71LvYLdFZvJP5kZQnOaqhnD?=
 =?us-ascii?Q?1FcXB9qsDWz20MaU685K38gnGUH64Yv7hfYG/2X48sLVsHcSzFQoOJAWLXrI?=
 =?us-ascii?Q?rHzTBqU47jAUODNK4xFBFY9XuTkKWe69rn78C+UL1rjmLkYQlo/GqwNCautl?=
 =?us-ascii?Q?NozOFk+coFPxrsN/bVocxL/Zm5gkbKlboYpQ4zxWm4Nx1IAEK07WVoeuCVD7?=
 =?us-ascii?Q?TzwYvAgQNlbEmJrDREbcpxEA9Mx9GvCa8WWw0APo5gP+iYoiIbnFWwxnGzDU?=
 =?us-ascii?Q?cq8ItX1G0zJnq4lsHkqlffVfqQkZm5AsHKw8PQrV66aDNJE941Xpynw5AKCn?=
 =?us-ascii?Q?sq3Ww3ysdMH59BX9Nk0R6VlO3thNovAbUmkc3f03h/veEK7+M/ibw7yhCCgR?=
 =?us-ascii?Q?8kGr9V2q8wMQqKN5TGeimSSHwpUs2T4hyHaEtgxfKJTH+Yeff2/y+aAznhPH?=
 =?us-ascii?Q?TWqeujm21Q6KOmbtBSLiQgwCbqNC4dEFFJmQw5ykbVUFqdf5yxhbram3ec3D?=
 =?us-ascii?Q?nDwsn3I8VD8Bq00GIRXuicTTyoXuDVpOhBS6Qr6wcKJG1UXAqDdNW6j/FEjT?=
 =?us-ascii?Q?Wnw9MThKUlDMytTR1Z03Eh2peGsqyhWU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 12:34:20.1455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bc0807-671d-4e18-8e19-08dc9900f6f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6065

Some type of domain don't have PIRQs, like PVH, it doesn't do
PHYSDEVOP_map_pirq for each gsi. When passthrough a device
to guest base on PVH dom0, callstack
pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
irq on Xen side.
What's more, current hypercall XEN_DOMCTL_irq_permission requires
passing in pirq, it is not suitable for dom0 that doesn't have
PIRQs.

So, add a new hypercall XEN_DOMCTL_gsi_permission to grant the
permission of irq(translate from gsi) to dumU when dom0 has no
PIRQs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/domctl.c              | 33 ++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/io_apic.h |  2 ++
 xen/arch/x86/io_apic.c             | 17 +++++++++++++++
 xen/arch/x86/mpparse.c             |  3 +--
 xen/include/public/domctl.h        |  8 ++++++++
 xen/xsm/flask/hooks.c              |  1 +
 6 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 9190e11faaa3..5f20febabbf2 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -36,6 +36,7 @@
 #include <asm/xstate.h>
 #include <asm/psr.h>
 #include <asm/cpu-policy.h>
+#include <asm/io_apic.h>
 
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
@@ -237,6 +238,38 @@ long arch_do_domctl(
         break;
     }
 
+    case XEN_DOMCTL_gsi_permission:
+    {
+        int irq;
+        uint8_t mask = 1;
+        unsigned int gsi = domctl->u.gsi_permission.gsi;
+        bool allow = domctl->u.gsi_permission.allow_access;
+
+        /* Check all bits and pads are zero except lowest bit */
+        ret = -EINVAL;
+        if ( domctl->u.gsi_permission.allow_access & ( !mask ) )
+            goto gsi_permission_out;
+        for ( i = 0; i < ARRAY_SIZE(domctl->u.gsi_permission.pad); ++i )
+            if ( domctl->u.gsi_permission.pad[i] )
+                goto gsi_permission_out;
+
+        if ( gsi >= nr_irqs_gsi || ( irq = gsi_2_irq(gsi) ) < 0 )
+            goto gsi_permission_out;
+
+        ret = -EPERM;
+        if ( !irq_access_permitted(currd, irq) ||
+             xsm_irq_permission(XSM_HOOK, d, irq, allow) )
+            goto gsi_permission_out;
+
+        if ( allow )
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
index d73108558e09..d54283955a60 100644
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
index d8ccab2449c6..c95da0de5770 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -841,8 +841,7 @@ static struct mp_ioapic_routing {
 } mp_ioapic_routing[MAX_IO_APICS];
 
 
-static int mp_find_ioapic (
-	int			gsi)
+int mp_find_ioapic(int gsi)
 {
 	unsigned int		i;
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 2a49fe46ce25..f7ae8b19d27d 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -464,6 +464,12 @@ struct xen_domctl_irq_permission {
     uint8_t pad[3];
 };
 
+/* XEN_DOMCTL_gsi_permission */
+struct xen_domctl_gsi_permission {
+    uint32_t gsi;
+    uint8_t allow_access;    /* flag to specify enable/disable of x86 gsi access */
+    uint8_t pad[3];
+};
 
 /* XEN_DOMCTL_iomem_permission */
 struct xen_domctl_iomem_permission {
@@ -1306,6 +1312,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
 #define XEN_DOMCTL_dt_overlay                    87
+#define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1328,6 +1335,7 @@ struct xen_domctl {
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


