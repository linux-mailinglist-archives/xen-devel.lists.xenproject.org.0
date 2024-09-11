Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32F9974AEF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 09:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796222.1205725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHNq-0003Od-5S; Wed, 11 Sep 2024 07:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796222.1205725; Wed, 11 Sep 2024 07:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHNq-0003M1-2t; Wed, 11 Sep 2024 07:03:22 +0000
Received: by outflank-mailman (input) for mailman id 796222;
 Wed, 11 Sep 2024 07:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZHC4=QJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1soHNn-00037S-T7
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 07:03:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:2417::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eba41582-700b-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 09:03:18 +0200 (CEST)
Received: from BY5PR17CA0064.namprd17.prod.outlook.com (2603:10b6:a03:167::41)
 by CYXPR12MB9444.namprd12.prod.outlook.com (2603:10b6:930:d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 11 Sep
 2024 07:03:13 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::4a) by BY5PR17CA0064.outlook.office365.com
 (2603:10b6:a03:167::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Wed, 11 Sep 2024 07:03:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 07:03:12 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 02:01:41 -0500
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
X-Inumbo-ID: eba41582-700b-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nfr6gWnO+I7Vvl9U05CmZ+8RcvdQFhUfzqjH2w/hhMhAhMJHJ7iiSS4k1sFe2YH2f+Ixe40eAqn6oHzRYWgVJgDV/5//JjuGRvdMsQuIlhu6YJ8EpwimHECAl8dINVGSpyAJPts3gz2i6eWAD4F0PehbiN2jw2blJ7bS+WNDxWI7BaoD0NGznIS4GmP8AY/KK6qLsz6zTIPOUXKjN9dVEdUa88Hdvei8CEuaoiUdURE9UZK9na4tuq0iMUHUr1BA6XpeazNSw6zAjJtPFkOz50VT2OTjZAZsqKbcgSzb+FZOz59zNFPl6jUgjsqDOyn7xbNtlFh8mCapTDjnF+fXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xdeuG1lhbpiiw+WZxKyXsL8A7LbMJvmZ12ytAm58MU=;
 b=HWtamoTlCIBNQBn8zabu3AWKqC5rMaDjesyiDSxZ4NwNj4HpUYfx2509KyxVXEHiDpex2Y62tUtXnMgCXqJOim4SYZVJQeH8hkKn+VDmztrgWFzfXEAYXcZC7sU9O//tIKdIatrUdxndo1SbKNe5vo+CI2tnEJlfqkFtELVI9cG42uQABCSyI2V/680hH6WA3adJ6oDao8gM0ExL4jfgBd8m+TY0BF91KRU/FrGzIZel9Axyg95LxngEUAPqotWbaOMA+U9EpZVejNhYtVePVoePELMmZf2voRZ0c6/e+z9K6ujGh6b+bObVJ/fdxnwPNa9Vxdk68Qe/L2YV1bzEjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xdeuG1lhbpiiw+WZxKyXsL8A7LbMJvmZ12ytAm58MU=;
 b=Vynq+x+i4eaVOL5yn2o4olxCngnsGJh87gzQVP4hd3nsXGnnM8EKxEC4TNJWRwUUu32B681XB1S5LgETluNBZUcy2JZ1wMfl3s4tF1X/IjwZrT+f/JhstegxjfLDkego75s/baDCf0t/GWU7yuc1aSvH0nYiSYm0xSiWTBJtMRI=
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
Subject: [XEN PATCH v15 2/4] x86/irq: allow setting IRQ permissions from GSI instead of pIRQ
Date: Wed, 11 Sep 2024 14:58:30 +0800
Message-ID: <20240911065832.1591273-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|CYXPR12MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9881b3-3171-44cd-1d6a-08dcd22fcd31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2+oAbzAToJpXQf9kVIuV8X3vGzauoeB3KgpJvejAYxrwi6KweUyCwwpbJ1n9?=
 =?us-ascii?Q?y+HRfhnRwHixDmours44Y1RX09sNfW5gpVdOaxBmvYfuvIAdFrI3xWf1yRdP?=
 =?us-ascii?Q?nBLpMGlawwjLR7o6f4W9wPDk9ybTXlAjekJnzsKZC51TERqfLBpTlSx74yND?=
 =?us-ascii?Q?QpIW2whVjWxpawwBqotnwlxDh59+4MwiBJB0wzSYGTgCqgkfKPPsU821nBG/?=
 =?us-ascii?Q?j2H97xlCq26RHHpvm26xhQjruIP0e3S0jj/VOMbCT3ZoXLbkaCREOBQLd0iR?=
 =?us-ascii?Q?7janC1uN0yh+0LLCQF37pTi9A+0LBUxzCxo0s8cuXB1kE4fE6q/qF89NH8LP?=
 =?us-ascii?Q?DLyXmT8xto/wMQDZy6aPgqepxli7UFV8AG1Wxp/4Ih4UUqTsjbLTr/5aoGT2?=
 =?us-ascii?Q?9MpuZbolHIf8Zt/c8sbLFmbFf/KfUviGRMc48vGyTAY4BLdiGh2T/vvLt2l1?=
 =?us-ascii?Q?ZmvpKLPtUEG9IeiLQp8KTbdvAYBFI7hwPx+jqAhcWKzoFUoLfYDOsFtrdAoi?=
 =?us-ascii?Q?O5hXn9yp2PcI8eIDJUtKZt3CQVd2d9t78cYa+RMIY1ksCDiqD10k6FU+d20L?=
 =?us-ascii?Q?scmpHYj49qMFpSPpYYS7/67B6NuqXdejmNRcuDegnJ7yAHgCDFiyHKnZg+os?=
 =?us-ascii?Q?kISav2236r+JuyNI/A3oPEy+el8tYuYCDebolMJ/DB5vpvqOf2bnBxQcY7uy?=
 =?us-ascii?Q?EKtILq1lljh3n6ZFsZU8mgIl0dU+XyPfnJmeIDRH9NQL9G3oxqatr7U7W0xs?=
 =?us-ascii?Q?SzF1j5J7k//TNIoN/+M0WVLmxEtsfj26xj/P8DVgZ/S1+jyV4iMvJ8GCbK9F?=
 =?us-ascii?Q?OUdEeSyIvaXqpSP1kA9DOHUKLNW8aeZ3nUa8mpgmqxlJb8b0FcHuolQ3NwZD?=
 =?us-ascii?Q?dPMHUpKOM75P0iU1nxPDkm4auntFUT0eLjc+EZOMyq1e7Z2pxG8JYoS+0E2h?=
 =?us-ascii?Q?KGOFuuEiWutxwruBSOUu/eV7X6ahWaZOFUbnv5B3DRL7slkB68Jrq6wpR4+U?=
 =?us-ascii?Q?w12CNSWpAa2EuwnQik01bVgQN9S7g6kgzgC6zM9EFJnkwhKQ3dlnxYG2qSAo?=
 =?us-ascii?Q?TOAnNhNDUdJm9yI55HfO5D5Rw6sDrpdXuYNW7HxUff2g4boRiO8EWFMhlzk/?=
 =?us-ascii?Q?S+YPx9XDlqK1a0fTfLD0KB42jg4DrNBmN7TPYEcQBsR9W+JOV7MXUk8foP9h?=
 =?us-ascii?Q?EJ5k0KohFnp0kBZ1l3k8Lt03qEOQxRQ7z6JpC5k0Bcq428TI6nGZe1myYARD?=
 =?us-ascii?Q?yxCV4PuPWEo+u8JotlXGuF0B2OfKjK5Z32hN6Yq2WtfQrzloSG7kNypt7ntS?=
 =?us-ascii?Q?h+IKdwr7WvEyRWrn2lPNJS+5ktbr9lap/ovEcY5oD7h6dEUs8hhfb//Uk7uj?=
 =?us-ascii?Q?PyZHYZrlSYmLpjsPMktRvUvcbzX5hgEYVeqpee4US2lEw0hvSLAAT6/BCp3K?=
 =?us-ascii?Q?bZKlpZ9/bqme7Em3RvcIfkvMpcKJGTfB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 07:03:12.5736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9881b3-3171-44cd-1d6a-08dcd22fcd31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9444

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
 xen/arch/x86/domctl.c              | 29 +++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/io_apic.h |  2 ++
 xen/arch/x86/io_apic.c             | 19 +++++++++++++++++++
 xen/arch/x86/mpparse.c             |  7 +++----
 xen/include/public/domctl.h        | 10 ++++++++++
 xen/xsm/flask/hooks.c              |  1 +
 6 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 68b5b46d1a83..939b1de0ee59 100644
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
+        /* Check only valid bits are set */
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


