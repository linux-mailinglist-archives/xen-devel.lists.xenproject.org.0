Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371096949A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788645.1198099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNb6-0003fQ-KH; Tue, 03 Sep 2024 07:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788645.1198099; Tue, 03 Sep 2024 07:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNb6-0003dl-Gt; Tue, 03 Sep 2024 07:05:04 +0000
Received: by outflank-mailman (input) for mailman id 788645;
 Tue, 03 Sep 2024 07:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqql=QB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1slNb5-00037M-8j
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:05:03 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2416::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d359f4e7-69c2-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 09:04:57 +0200 (CEST)
Received: from CH0PR03CA0035.namprd03.prod.outlook.com (2603:10b6:610:b3::10)
 by SA1PR12MB7270.namprd12.prod.outlook.com (2603:10b6:806:2b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 07:04:55 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::9d) by CH0PR03CA0035.outlook.office365.com
 (2603:10b6:610:b3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 07:04:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 07:04:54 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 02:04:49 -0500
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
X-Inumbo-ID: d359f4e7-69c2-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvQDN59ROP0YBTfkn1L/nYq+mbeYYwNWBN/EYbFLVSHgsFjCeo2LlxaURTDTODY7hWoC0TokNnl2S7iyi0jAal87MFaB8DeQuSvrWSq3l4JNjOFvscihTnVnbhoqKoN7TiQPBEEfSjA5qHHEtZuVLC5G5nMcrHV4ous6n9eA+JhJHQPbWFCatwz+YNw+/CnCgd2hT+jvL6IjcsbOrU4IrJb1Jq5FX51z93q4UeSaYIMhyxMpjVK6qM4/kJ5qhmfgtQPogZ6P2hJSUg2/LcdZf5zwFOjCJGXzAraSsT01EjZJcRZlh1NooHm+/x9r6N/BKddqYYGauEAO56p4pErjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0WlziwJuBivC6SclKPLM56PI1MPduMag0Ae1SUANqY=;
 b=h03eBhIUsgOSpYg5pRl5WndsZTvKrDfdIENNMJfknhIiMcu9g2jtXO7j313tmeiGFIBnOCbgsXY2KrKnlRtOljtUFfQ5DF3ZXE/4O8PzriFnMH1EMRHlyWdHcnRh55WRKTDCVs8pCQV9vF9/r2KaaLsKErj/CqorUx5ksh6y+APpPLIl5HdXI9k+wsnstOys/fjbGYldNViKaX7H8VWXMk0HFC2sCWXEOb0l+86rq5XkH1vYASgrvNcffM7wjicWcDsw10J/ntU1ZwhgrMPvNB8kaeuQfdVkp71eXvL8X9IELw+NVTjvoC5JUyQWhmggy3026cFazex79lkinchf6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0WlziwJuBivC6SclKPLM56PI1MPduMag0Ae1SUANqY=;
 b=zmUXquPtBwTRC+eaKm5NqLNTrDIV2FtpU47jqXlwHBjnC6dhjpPlNZEG7/jbFDGNiCwyQ1Wl9Jz6vlvR5cX+oVmsP+TIu40tgdppVdBSC5ASXcsIg9ZX5l3mWChq+SKylXMDPBs5vstW05ycfe0CFedeWJHaUUHykJtIszVMAXE=
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
Subject: [XEN PATCH v14 3/5] x86/domctl: Add hypercall to set the access of x86 gsi
Date: Tue, 3 Sep 2024 15:04:22 +0800
Message-ID: <20240903070424.982218-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903070424.982218-1-Jiqian.Chen@amd.com>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SA1PR12MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d05568-6dd2-4283-30b5-08dccbe6b698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aXaHbBaedHzSA/q3+fLBtpObJs0utzV+v1E+F3qUT69RrReIafW7VdNUBlJ+?=
 =?us-ascii?Q?+XMwHCjs3Tu+jfNbPP9Cz5CpkCRqA08ncgx8usxvrTXcSvjjDW/0YH2FI4DN?=
 =?us-ascii?Q?KJdOAgbC1DTYcD/E4yH7o+q6EB49w04I+w0GgzzAf7U19DzCpfqhmFGVLQJb?=
 =?us-ascii?Q?gG0k9EFCeKiTtX9rPCdOidra+EbgrI+IHIBwv32Lh7HySUBNvJ035zyr7A1S?=
 =?us-ascii?Q?Bo8VIVqs/AeSLE8yFuLEtxNgU4FIRpv/I+WBkQ+geG16RlOIyir78wPnF2Tt?=
 =?us-ascii?Q?MoqyjowNwIL576lLnoZboAcydnEypEeYqEuGVqpkHzCq6dWrq1F49kJ6k3cQ?=
 =?us-ascii?Q?xxVE0slt25VfBhS6KgvMQV8yd0Dc8gYBFKi7LWEm/2MteT00ZQ+un8nRJScZ?=
 =?us-ascii?Q?qJmB8djPxwPdxdQ1nQGCnNpHt5V0BN6nCRlXWfbUOMQDsKL+eiBDVfsIGeVy?=
 =?us-ascii?Q?1LmAuyqPwuKl+2p1/FpLGQFQ+QumYlx6uUUxM0NRntvBA67kuJrY925nsH+c?=
 =?us-ascii?Q?/w0lnAXg23XURUVnj5rSc3djJD/lwiq7rujKN3N9m136VxfnhKswG9ksVTGJ?=
 =?us-ascii?Q?j8zIu0IMJnFHfh8hGSdAdwSwdAT/22tdu2wftmddX5+63wOakKe9NUIR9HX0?=
 =?us-ascii?Q?DIN/QTQQYZbqQdBo8dT7d3NGWIG5VB5TGXjh+fOiURNBVwmY0cXj5jeQe3Ia?=
 =?us-ascii?Q?EqtUrHeA5AcPOFHA6uh3iaiayf+ojrAo3GlGi/Cr6AtmM/K4NPr3D3Oh5u+/?=
 =?us-ascii?Q?AYHuSCEHJGRiixPSar7pWMcM82lLZ0oZ1l0WJ6QJkhRrFblM+z+hvaY70XTj?=
 =?us-ascii?Q?yzy8ZsNzR3Fm4ab8cWNyyD5ipkxAZYsZKULz12xgoDRPKhgru1y1FB1qkFzm?=
 =?us-ascii?Q?zk8d6r9JwH8AdRI2OZ3qh2joCJYbZNPBkF23dEdCndFjyhOJItIlYwA9HRVL?=
 =?us-ascii?Q?R9zMGEIYVedqlIWguAGJgPCbjO6cajO1lfCnqX7q1oZ3GjsaqwDEC41rvNr0?=
 =?us-ascii?Q?xkvyxMFh1Vxyd7Hi4ytuz2VC3/Cw6CAY3w6+GTCwNuVFDNNg7V8GYdNBcSI3?=
 =?us-ascii?Q?edCP3IPJDNKZXENk5awogkm0gT62157I2ZYO4Qd5xk30SP0hfjvH4GP1D4p/?=
 =?us-ascii?Q?cnBF6eC/IQleCPkg+aCetZuBWFo4t2TvhG2UzbN+PNXHinUppBg/gX54/lS0?=
 =?us-ascii?Q?4vK7OmxN8T/r04IKxr+EU0y+TK2jA9itUXZiTDTlCjls6YCWG94ZXKssBkL4?=
 =?us-ascii?Q?su6c8cJwrJTkuF4ZxvNychAFP56RNkhUrVZ1C1wFZn38YNCGImxBXBNNUz3y?=
 =?us-ascii?Q?puLz+htoIGSs2Vg0MAbw8irB3CUYQZQEnVJhkdUsOPrcT/2rwHJJpUgj7j7g?=
 =?us-ascii?Q?fYGVqvQZrLlejiVBocmbMMNih4k6adqdd+p6Oor+Ix0d0GBYyYU2vYIuBIsb?=
 =?us-ascii?Q?gyDIHqFWv2F9dAwOTIIS/yjji8SvNeKJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:04:54.3455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d05568-6dd2-4283-30b5-08dccbe6b698
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7270

Some type of domains don't have PIRQs, like PVH, it doesn't do
PHYSDEVOP_map_pirq for each gsi. When passthrough a device
to guest base on PVH dom0, callstack
pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
irq on Xen side.
What's more, current hypercall XEN_DOMCTL_irq_permission requires
passing in pirq to set the access of irq, it is not suitable for
dom0 that doesn't have PIRQs.

So, add a new hypercall XEN_DOMCTL_gsi_permission to grant/revoke
the permission of irq (translated from x86 gsi) to dumU when dom0
has no PIRQs.

Regarding the translation from gsi to irq, it is that if there are
ACPI overrides entries then get translation from them, if not gsi
are identity mapped into irq.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
CC: Daniel P . Smith <dpsmith@apertussolutions.com>
Remaining unsolved comment @Daniel P . Smith:
+        ret = -EPERM;
+        if ( !irq_access_permitted(currd, irq) ||
+             xsm_irq_permission(XSM_HOOK, d, irq, flags) )
+            break;
Is it okay to issue the XSM check using the translated value(irq),
not the one(gsi) that was originally passed into the hypercall?
---
v13->v14 changes:
No.

v12->v13 changes:
For struct xen_domctl_gsi_permission, rename "access_flag" to "flags", change its type from uint8_t to uint32_t, delete "pad", add XEN_DOMCTL_GSI_REVOKE and XEN_DOMCTL_GSI_GRANT macros.
Move "gsi > highest_gsi()" into function gsi_2_irq.
Modify parameter gsi in function gsi_2_irq and mp_find_ioapic to unsigned int type.
Delete unnecessary spaces and brackets around "~XEN_DOMCTL_GSI_ACTION_MASK".
Delete unnecessary goto statements and change to direct break.
Add description in commit message to explain how gsi to irq isconverted.

v11->v12 changes:
Change nr_irqs_gsi to highest_gsi() to check gsi boundary, then need to remove "__init" of highest_gsi function.
Change the check of irq boundary from <0 to <=0, and remove unnecessary space.
Add #define XEN_DOMCTL_GSI_PERMISSION_MASK 1 to get lowest bit.

v10->v11 changes:
Extracted from patch#5 of v10 into a separate patch.
Add non-zero judgment for other bits of allow_access.
Delete unnecessary judgment "if ( is_pv_domain(currd) || has_pirq(currd) )".
Change the error exit path identifier "out" to "gsi_permission_out".
Use ARRAY_SIZE() instead of open coed.

v9->v10 changes:
Modified the commit message to further describe the purpose of adding XEN_DOMCTL_gsi_permission.
Added a check for all zeros in the padding field in XEN_DOMCTL_gsi_permission, and used currd instead of current->domain.
In the function gsi_2_irq, apic_pin_2_gsi_irq was used instead of the original new code, and error handling for irq0 was added.
Deleted the extra spaces in the upper and lower lines of the struct xen_domctl_gsi_permission definition.

v8->v9 changes:
Change the commit message to describe more why we need this new hypercall.
Add comment above "if ( is_pv_domain(current->domain) || has_pirq(current->domain) )" to explain why we need this check.
Add gsi_2_irq to transform gsi to irq, instead of considering gsi == irq.
Add explicit padding to struct xen_domctl_gsi_permission.

v5->v8 changes:
Nothing.

v4->v5 changes:
New implementation to add new hypercall XEN_DOMCTL_gsi_permission to grant gsi.
---
 xen/arch/x86/domctl.c              | 29 +++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/io_apic.h |  2 ++
 xen/arch/x86/io_apic.c             | 21 +++++++++++++++++++++
 xen/arch/x86/mpparse.c             |  7 +++----
 xen/include/public/domctl.h        | 10 ++++++++++
 xen/xsm/flask/hooks.c              |  1 +
 6 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 68b5b46d1a83..60b5578c47f8 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -36,6 +36,7 @@
 #include <asm/xstate.h>
 #include <asm/psr.h>
 #include <asm/cpu-policy.h>
+#include <asm/io_apic.h>
 
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
@@ -237,6 +238,34 @@ long arch_do_domctl(
         break;
     }
 
+    case XEN_DOMCTL_gsi_permission:
+    {
+        int irq;
+        unsigned int gsi = domctl->u.gsi_permission.gsi;
+        uint32_t flags = domctl->u.gsi_permission.flags;
+
+        /* Check all bits are zero except lowest bit */
+        ret = -EINVAL;
+        if ( flags & ~XEN_DOMCTL_GSI_ACTION_MASK )
+            break;
+
+        ret = irq = gsi_2_irq(gsi);
+        if ( ret <= 0 )
+            break;
+
+        ret = -EPERM;
+        if ( !irq_access_permitted(currd, irq) ||
+             xsm_irq_permission(XSM_HOOK, d, irq, flags) )
+            break;
+
+        if ( flags )
+            ret = irq_permit_access(d, irq);
+        else
+            ret = irq_deny_access(d, irq);
+
+        break;
+    }
+
     case XEN_DOMCTL_getpageframeinfo3:
     {
         unsigned int num = domctl->u.getpageframeinfo3.num;
diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index 78268ea8f666..62456806c7af 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -213,5 +213,7 @@ unsigned highest_gsi(void);
 
 int ioapic_guest_read( unsigned long physbase, unsigned int reg, u32 *pval);
 int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val);
+int mp_find_ioapic(unsigned int gsi);
+int gsi_2_irq(unsigned int gsi);
 
 #endif
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 772700584639..5859484875cc 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -955,6 +955,27 @@ static int pin_2_irq(int idx, int apic, int pin)
     return irq;
 }
 
+int gsi_2_irq(unsigned int gsi)
+{
+    int ioapic, irq;
+    unsigned int pin;
+
+    if ( gsi > highest_gsi() )
+        return -ERANGE;
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
index 306d8ed97a83..e13b83bbe9dd 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -842,8 +842,7 @@ static struct mp_ioapic_routing {
 } mp_ioapic_routing[MAX_IO_APICS];
 
 
-static int mp_find_ioapic (
-	int			gsi)
+int mp_find_ioapic(unsigned int gsi)
 {
 	unsigned int		i;
 
@@ -854,7 +853,7 @@ static int mp_find_ioapic (
 			return i;
 	}
 
-	printk(KERN_ERR "ERROR: Unable to locate IOAPIC for GSI %d\n", gsi);
+	printk(KERN_ERR "ERROR: Unable to locate IOAPIC for GSI %u\n", gsi);
 
 	return -1;
 }
@@ -915,7 +914,7 @@ void __init mp_register_ioapic (
 	return;
 }
 
-unsigned __init highest_gsi(void)
+unsigned highest_gsi(void)
 {
 	unsigned x, res = 0;
 	for (x = 0; x < nr_ioapics; x++)
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 2a49fe46ce25..e1028fc524cf 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -464,6 +464,14 @@ struct xen_domctl_irq_permission {
     uint8_t pad[3];
 };
 
+/* XEN_DOMCTL_gsi_permission */
+struct xen_domctl_gsi_permission {
+    uint32_t gsi;
+#define XEN_DOMCTL_GSI_REVOKE      0
+#define XEN_DOMCTL_GSI_GRANT       1
+#define XEN_DOMCTL_GSI_ACTION_MASK 1
+    uint32_t flags;
+};
 
 /* XEN_DOMCTL_iomem_permission */
 struct xen_domctl_iomem_permission {
@@ -1306,6 +1314,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
 #define XEN_DOMCTL_dt_overlay                    87
+#define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1328,6 +1337,7 @@ struct xen_domctl {
         struct xen_domctl_setdomainhandle   setdomainhandle;
         struct xen_domctl_setdebugging      setdebugging;
         struct xen_domctl_irq_permission    irq_permission;
+        struct xen_domctl_gsi_permission    gsi_permission;
         struct xen_domctl_iomem_permission  iomem_permission;
         struct xen_domctl_ioport_permission ioport_permission;
         struct xen_domctl_hypercall_init    hypercall_init;
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 278ad38c2af3..dfa23738cd8a 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -695,6 +695,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     case XEN_DOMCTL_shadow_op:
     case XEN_DOMCTL_ioport_permission:
     case XEN_DOMCTL_ioport_mapping:
+    case XEN_DOMCTL_gsi_permission:
 #endif
 #ifdef CONFIG_HAS_PASSTHROUGH
     /*
-- 
2.34.1


