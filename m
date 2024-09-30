Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621898998C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 05:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806958.1218097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sv7KG-0004Pn-Kc; Mon, 30 Sep 2024 03:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806958.1218097; Mon, 30 Sep 2024 03:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sv7KG-0004Mb-Hl; Mon, 30 Sep 2024 03:43:56 +0000
Received: by outflank-mailman (input) for mailman id 806958;
 Mon, 30 Sep 2024 03:43:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYXA=Q4=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sv7KF-0004MQ-OI
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 03:43:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2415::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 363cf05e-7ede-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 05:43:54 +0200 (CEST)
Received: from BL0PR05CA0010.namprd05.prod.outlook.com (2603:10b6:208:91::20)
 by LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 03:43:48 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::e4) by BL0PR05CA0010.outlook.office365.com
 (2603:10b6:208:91::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.14 via Frontend
 Transport; Mon, 30 Sep 2024 03:43:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Mon, 30 Sep 2024 03:43:48 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 29 Sep
 2024 22:43:42 -0500
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
X-Inumbo-ID: 363cf05e-7ede-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpa0BdW2u0eDVa/PWy+kxcJJxmQpMdhdGHgboPgXjLVkVEp22CRyvp25vuwufff1C9WsNh5gn+ixShvWWKrsNk5Vg5I702cxEKMzGM9JRyZZUoY2c+9oh3VuQy9+EYhZelxPvyylcmJDSJ220CVPfZAWiLG0skzMs9zG4V/W3xDukO+jFR0nw0zigY03csIZh4065jpmXudH5/CArF37lp7n/JMByEOVIBP53sstLfDoHpa0UkP6WeJfTbW1ythJ28ytp1z6VGc6A60kHjfld+Me/WJslOMZEgCfsX0jdo+Yloge9Mzd+I6RedZwD8NrLbdX0sBWONRiskAwQcGIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+E/4LTDdAPpk3VRH9HmbFsNt4PqAVxVThrYLen9wv0=;
 b=JIVrsqUMsz5ja5/yIlRjxM6ZSQlBCmWXjzqBCt6rWhrrXxFQ/i0eGknahY0FDSsHrrD93kj7VFD+5dF39DAV1x5qzngSlVDv+zpaj/66zp/yUjHCc15JYxoYEE0/R6mrz6hmGrSdSsTuvf1TND6z6KWNNqmlKZWm2aHYlBy7fswIQQZDfgrw349fw5KDvH4+QKVAKpTvHgKvjgI6Z04SxwF9r+zqfwoxF/NL1lCKwrZgwl02yek31BsqktiAVne4lWradpifTdOafgzDkUzKpppo1r2dhhXv0S+t1vKPGUNWddJZYmJZJQRuqvxxVpyZrJNmXbWs1/lzNXBYp2wqsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+E/4LTDdAPpk3VRH9HmbFsNt4PqAVxVThrYLen9wv0=;
 b=dBlQ5p0vIrO1605qLo10Zavo01XwasyGvn2zHmzW97eWFAt7WiPJo8k2cLuBhxEWFFLJ2r7prpVKbP6OcevtuhAf9jHYRI55CZ+X/S5gpvUXSaovA1nSX7FpP7deKGSDX0qbeLbi0YXJvY51eIk+pkSe8/kYurRaJpV1X/HSHtY=
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
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v16 1/3] x86/irq: allow setting IRQ permissions from GSI instead of pIRQ
Date: Mon, 30 Sep 2024 11:42:48 +0800
Message-ID: <20240930034250.2682265-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930034250.2682265-1-Jiqian.Chen@amd.com>
References: <20240930034250.2682265-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: c57dfba8-9e00-4837-707d-08dce10217c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eZBKTd1vpfklnL2GnVSUqsEFC11Fx+lvg19jwmwxfG8+es9ci1rh4owrVkYg?=
 =?us-ascii?Q?Ur1wRZ1Gcv0XWYAdquZ5S+lMNgAfuGN32fMt2oTe/JPOdFzMAUK8mmNkPWX/?=
 =?us-ascii?Q?hv/AuIjg026XviFiffBtn6X3ss3qDR2PtRa0ZbImU5BJ+RpLlYuDrTmliC/C?=
 =?us-ascii?Q?rrzFDjXJ6eLR6fVf/68ICet6jx9F2P060icThYpVUoY/4fq9wmGzlt95m6Y3?=
 =?us-ascii?Q?jFJ6a+VPLXOA3Sl3ZbAR/th/0tRR4FzUTDhdMFIHgaWSV54qpcGVKhELm06m?=
 =?us-ascii?Q?oQ8eG/i7yZbzTNUGzWgGWcA1p/z3iKhFTE/18tC8NPTaUodR0E6dze3Ma5Gs?=
 =?us-ascii?Q?ViDLYWJm3OMV5g4ND0ldk2GoScy7hX6DGk9Sd2SRdUYhDBl95Wf4mchmDLJ3?=
 =?us-ascii?Q?P0Du2TMvZy5GztZRqYYSxij/SNdjgPeBluf5qAvIuHLG80CvL5qby94qzu7o?=
 =?us-ascii?Q?Nt+lOISxXStHVCN0iC5yn+AEiPTqEuHJiYpEBwJG3KKQZPFeqB9F3gHHz1B3?=
 =?us-ascii?Q?v51JiRye+xurzeZwuqzDU/UrS+eYzw0dJJZ+43eDELESQ9KZs0vYtUvx8igM?=
 =?us-ascii?Q?wHqD0uhGdUXpHmrH9aG6rbK1ii5kcBsP/eHYOZJ763bBSv1BWAM+AfNHKLVQ?=
 =?us-ascii?Q?4p2DNbf1mdWsqwp7PFRa2mw9LKpV2y8YOMc3vSb6ZaXtBMtai3fxMITtnzmt?=
 =?us-ascii?Q?+mMwEekwnTDc4/zAWTMzZqyNE7R0k1AT7tTOVx8S7IedlnHtwZ8uvFbJJ5Zs?=
 =?us-ascii?Q?B0vUMHx+F2MJGtFPVRBvO/s3zDABKAcilFI4+HQQYkcMvoldQKtnUQlM+F0J?=
 =?us-ascii?Q?Xdlch5cUH7ZRczJhL513p4rdAIBqhAkjGOI1NnTlJua3HpdKK3swO58iqaR+?=
 =?us-ascii?Q?otbQyYP7sv8utOGT8SChRbLyzws2NRxwkI5KLJS70E/NlByVMCjYPewrdLHY?=
 =?us-ascii?Q?42Gs1BBLLDRDx8b+ku3VJETownphbZdHhfCRi6AbVy8dhwKgPn52of1B8IyW?=
 =?us-ascii?Q?g8SamXGdtwCEgz4lC+iogtcWT/n5l0BVns9scJNRyG8r6q2FWEc2svTz+z0f?=
 =?us-ascii?Q?CGcNFne2EzCuH4l49YRw1MtFN09L9pYjiRWJ4Vvix+hZyJE+T2uAIngFGJC1?=
 =?us-ascii?Q?QZAdn3TjSgihPn5pQAfM9d4L0HL9bqGp7n2BDvTM+8uLvHHJpqZd8cUMvghP?=
 =?us-ascii?Q?xlLESYEHhm45162vQCZFkRWbhcv9UmNNlVSkyCR9Oc8BzAoMRe+nIpoDKDE0?=
 =?us-ascii?Q?lwZAjpwrpunKYy8LjcuBoZOFIkjLPb3bwt0DFKneuZMb5eBu4LzmEa0y+LFJ?=
 =?us-ascii?Q?TpUpYp76bmcSk+23/ckd16P6iRkOxCEyvheT00O1lS6JvXYXNV6fj/1/8hcU?=
 =?us-ascii?Q?hXZfjXlL9zcODH9hg8j86rL4+KE4FlaVQJZgCGI1mWzf5CzuJnOMpR+Mo2Cu?=
 =?us-ascii?Q?SlP8F7Q3lMwEtbQ+dPRJ8f9JGDfdL0gD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 03:43:48.4404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c57dfba8-9e00-4837-707d-08dce10217c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083

Some domains are not aware of the pIRQ abstraction layer that maps
interrupt sources into Xen space interrupt numbers.  pIRQs values are
only exposed to domains that have the option to route physical
interrupts over event channels.

This creates issues for PCI-passthrough from a PVH domain, as some of
the passthrough related hypercalls use pIRQ as references to physical
interrupts on the system.  One of such interfaces is
XEN_DOMCTL_irq_permission, used to grant or revoke access to
interrupts, takes a pIRQ as the reference to the interrupt to be
adjusted.

Since PVH doesn't manage interrupts in terms of pIRQs, introduce a new
hypercall that allows setting interrupt permissions based on GSI value
rather than pIRQ.

Note the GSI hypercall parameters is translated to an IRQ value (in
case there are ACPI overrides) before doing the checks.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
v15->v16 changes:
Change the code "ret = irq = gsi_2_irq(gsi);" to be MISRA compliant.
Add Reviewed-by of Daniel P. Smith

v13->v15 changes:
Change to use the commit message wrote by Roger.
Change the code comment from "Check all bits are zero except lowest bit" to "Check only valid bits are set".
Change the end return sentence of gsi_2_irq to "return irq ?: -EINVAL;" to preserve the error code from apic_pin_2_gsi_irq().

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
 xen/arch/x86/domctl.c              | 32 ++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/io_apic.h |  2 ++
 xen/arch/x86/io_apic.c             | 19 ++++++++++++++++++
 xen/arch/x86/mpparse.c             |  7 +++----
 xen/include/public/domctl.h        | 10 ++++++++++
 xen/xsm/flask/hooks.c              |  1 +
 6 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 68b5b46d1a83..d9e8252d74d4 100644
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
+        uint32_t flags = domctl->u.gsi_permission.flags;
+
+        /* Check only valid bits are set */
+        ret = -EINVAL;
+        if ( flags & ~XEN_DOMCTL_GSI_ACTION_MASK )
+            break;
+
+        irq = gsi_2_irq(gsi);
+        if ( irq <= 0 )
+        {
+            ret = irq ?: -EACCES;
+            break;
+        }
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
index 772700584639..e40d2f7dbd75 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -955,6 +955,25 @@ static int pin_2_irq(int idx, int apic, int pin)
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
+
+    return irq ?: -EINVAL;
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


