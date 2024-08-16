Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC4D954776
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778493.1188565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seupK-0002w6-3J; Fri, 16 Aug 2024 11:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778493.1188565; Fri, 16 Aug 2024 11:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seupJ-0002sk-Vj; Fri, 16 Aug 2024 11:09:01 +0000
Received: by outflank-mailman (input) for mailman id 778493;
 Fri, 16 Aug 2024 11:09:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uc/1=PP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1seupI-0001Oc-Cl
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:09:00 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2414::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eee73b25-5bbf-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 13:08:58 +0200 (CEST)
Received: from BN9P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::28)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 16 Aug
 2024 11:08:52 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::42) by BN9P221CA0005.outlook.office365.com
 (2603:10b6:408:10a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Fri, 16 Aug 2024 11:08:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Fri, 16 Aug 2024 11:08:51 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 06:08:48 -0500
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
X-Inumbo-ID: eee73b25-5bbf-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qgd8BIPxS3E37iV3X9XYhiLJShr4gyCvYg5c0s9tJacPQqA7KXJ161Payx6202qJK619f/Y+42FGLAj0tJf9iccRpeK5JoxtPEbMdOWK3qC1rYO5bdmRm146WwCKaJLpLYG9Tbd9ALL1iqEsyMtsyycYjRGWzRSlZOTqNCWVGdt6KOZ1jCMmlyHivtV9YvIJabdV6tdx+RIAWOdX/glHH2nkrXyrjjG9GA9XcsD4irtFbi60M/PisccfRtOLQ8KldcIKCBywABhCQT554YVNXhtXtx4Qmq3NBRig+hegb8daqM5fy5Q6Y8cwUOdRuJ8WGLVKVqHdr1VTDmjGmkogOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kbo5f+6yaKRR0HDxkNq97Qgqo1a26fSHS6Hkqz1R/2w=;
 b=yZqmgSWzcPk0/se63zYlgeLunsT6Puji+RW52cw7uTDwBKAWYdOcj7rdyMAkPZ/OwtfS+6/uU5lVYcLANy2QVbWvT8BwtG+Xa33ylUGfKx0nljfbmT2G0WETmNWuWqoLXNf5axWU4dvtvTwvZhAVfs3QpeJ9nzSWpGeyWBwfjKJEY7HpEm/G0l+LLFyZgv51WJjVt1UbTPAsULoXgl74rBYVRKHRVkzXdMkt9vezYY2jFVBay/TfjykwLrGJHyyu51ItT0TZdQR8rr9KTAuksbtl5MAktGx4VE/AFyeidQW29zTf6YVWa1iJvKw6Lx8viQ+qPw21+vQ1eL+E2+OATA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kbo5f+6yaKRR0HDxkNq97Qgqo1a26fSHS6Hkqz1R/2w=;
 b=nJVB8lIdkqzdsKoPY0A3+ft27xMOaJLJCdUirUkVn85VKGMrmfipGgGhW/t2NzJQ8bp3qHJe81mztVwM5pWQVoIXlZChy3y1U9uuoNIK37X3w/ThuAwp4p679DzXkkN83Hi/m/tc2/EeyZ6Q7k13hwyVu03vjiFLbqhGwiNvyAk=
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
Subject: [XEN PATCH v13 4/6] x86/domctl: Add hypercall to set the access of x86 gsi
Date: Fri, 16 Aug 2024 19:08:18 +0800
Message-ID: <20240816110820.75672-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816110820.75672-1-Jiqian.Chen@amd.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|SA0PR12MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: 64dbaae4-2342-4785-d4c1-08dcbde3cfba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3+RRkz2tvkLib2uIdS5eL+Iv+tDdgJs++78C8ohwD5mwqOwI0OguDefoHbB4?=
 =?us-ascii?Q?cQv9eodf6AOv6Yp1YqXS2RzWn4l+Ujb5X031bO9tG0FqWSDEBAODQR7KCmps?=
 =?us-ascii?Q?mjf9zn/v55ed1dRqo8qW45GMGpo5tI/6M1cq8HYYWaGu9vXaM2Jx7dLrLRDr?=
 =?us-ascii?Q?elmMgONXgUoK3JaIoi1OmI9pg48YfnDaTCYz2hfCJ+D795hOcUjP11bjeqcT?=
 =?us-ascii?Q?iTuUXi6qR/NDK/B9BmI68+N66XxGubjORyES+gpZNW632yhRFflGzStVLIuw?=
 =?us-ascii?Q?Zg0dhnVbiq+bFUOIXxGC1/JlEGHMAP6za6eVH8sIEARTib8la1QwcEEVByaF?=
 =?us-ascii?Q?0ctxrvXBhYfiDdoGORUBvtwvXWFQ5i8IimAjVcA8BoiPvWuqfLNRo7EXufR7?=
 =?us-ascii?Q?SrQnMLUjjjN3r7CAXsTj+ng0+NjwyMPEN+Eedr1YDrQqqmEBDxO98x5QyvTv?=
 =?us-ascii?Q?7Q9hEr0kIxNcfQO7tLEeIVXysswLvU6YLAvLA9flCW4kEcfx2N9uRxe5lSsM?=
 =?us-ascii?Q?otWS7vbuLrPGA1+QzNwGPKTPKvDKoG5PbRT0O1PAX7QXvlqTEfC1YhKjoS69?=
 =?us-ascii?Q?GV13J+RfJi1zXNf+SX4GqneXfrzeYjcMPPPsncjNm3ARi2pjL0klNLn3ruYP?=
 =?us-ascii?Q?cRh48wLo3h8eT6vpaybn8/lP+w4s++bIecl0W6kbJA3oP0bRbtA8w4DRUfwE?=
 =?us-ascii?Q?vh5Ozhot/a3K+gtCvDqeLLF8vdFkbP+UQt28COUhJXmL3JYxAU31cbqmUgII?=
 =?us-ascii?Q?BfRguWhQ7uTDj4AWT6sDBKb8c8WCvRDQ7RzTdnYwpOSwJkzq3DYccjrDFB1x?=
 =?us-ascii?Q?JFcXIkVYxpmpw7r65EJwymlE1X1vfdLv/IO3+IekjfC/07AsLxz1xr/2yA/G?=
 =?us-ascii?Q?3V98UYlcjSYBtltcD4rDqumU1K2kew9ORp8E5x95su/R5sHJ2A03fBlxe0mj?=
 =?us-ascii?Q?dF6bhS++yMmVYjz3glqVZnRrQp1EWxkdvDNcS/lQ/6IhMCp2PkqyeZQ7d2g3?=
 =?us-ascii?Q?tJVbr8fOCXsedeIcLeu8SxKem7djoWOQjksS+mDxkr/l/60M8eC3NvxkYgdd?=
 =?us-ascii?Q?KrraLuOunV1p3zFx386Mmi45dTFilga8NWpWQLDGnr7vMYVPjBoxjt1/Lw+Y?=
 =?us-ascii?Q?vE2Nglpfprn2Tq8UzEUhJN6/B9nA1M4dR/T5IrnafzlcSRUPzMewYsaaEqHc?=
 =?us-ascii?Q?xXjH0m0bxMpuoB8JhvdkoQ1ziZDHSDJu6J/qVoccDxTViBnu6J2qapnyDAXs?=
 =?us-ascii?Q?Ag2s71CxzdNb7VxsOLw/l69bOJRveMiyv6nzi+Odqs4UNXVNoEiDcHupu3x/?=
 =?us-ascii?Q?MHM+kBAumbglw1BMsownIo7v94cgMLSenfODTDcR5LN4mrEeGdWytNfsaV+f?=
 =?us-ascii?Q?7VR3uffWM/vmmKeqeBDIr+JKBeNkQ2c8aBzmO2KcOuJ2sJqzRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 11:08:51.9496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64dbaae4-2342-4785-d4c1-08dcbde3cfba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493

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
Remaining comment @Daniel P . Smith:
+        ret = -EPERM;
+        if ( !irq_access_permitted(currd, irq) ||
+             xsm_irq_permission(XSM_HOOK, d, irq, flags) )
+            break;
Is it okay to issue the XSM check using the translated value(irq),
not the one(gsi) that was originally passed into the hypercall?
---
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


