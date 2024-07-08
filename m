Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E492A156
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 13:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755302.1163622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmkl-0004J2-6C; Mon, 08 Jul 2024 11:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755302.1163622; Mon, 08 Jul 2024 11:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmkl-0004H3-36; Mon, 08 Jul 2024 11:41:55 +0000
Received: by outflank-mailman (input) for mailman id 755302;
 Mon, 08 Jul 2024 11:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQmkj-00042n-NK
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 11:41:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1096dd9e-3d1f-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 13:41:51 +0200 (CEST)
Received: from BN1PR14CA0030.namprd14.prod.outlook.com (2603:10b6:408:e3::35)
 by CY5PR12MB6372.namprd12.prod.outlook.com (2603:10b6:930:e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 11:41:48 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:e3:cafe::ca) by BN1PR14CA0030.outlook.office365.com
 (2603:10b6:408:e3::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 11:41:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 11:41:47 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 06:41:43 -0500
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
X-Inumbo-ID: 1096dd9e-3d1f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrJaAoR+wYEksI7ApLm4aHwpRoJxOJNhTZxW6zezpzv2gEj2yS1Vb1PbueX0lR7iHjpHBm/aEyF5hcPm+5ylXkmEaS/aELAUG95LBleE3gXLpCUHRJ91/I1ImqBhzPcfBfxop6lh/MmuD5fjKD7tg9LlsCySwSTjrRZOABR1VAidyVKna4CYtM7aVCo3FL1nsvuRTdTPOsLEUUY9u5O5wmTRv5uCSS4KxjPjC6qc4DVtyIN9IMwbXtVPjS9bSSqCmXc9dTADjsm3IFBnOxm3+UwIU7tOkiNDIZcrexgTYrPNjdPmC3CO+yP0dJx3coX8Ow411c21LI8B81IK8tadlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSBan8AMKi3heWU3rnAw95no+PojTUn8JnZuEPQvIPs=;
 b=Cz2cUwRtE6at8RPXZp9Qfut3J/cpxiBJpYigaz5FfNSmlBODmr+1aKBcE8cDxleDNDXABQrxqoLilAeNhlCUdhKkWq9henLO9LVF7tCN+CHA7gBOj9iIYmkQy73piiuPaIeDZc+BVioW8X0fSUFBMEzzJwUqQ1pPcIEvdHRJIoL9nL0ZLkDE1cEy3TE+3KrBjBOzRLgm7I0Kj7Qsrqu5DF+nC92b9wWSSs8S2Q8bkx9kmoj7YlvZAx5MRr6flLW8fsyX9H3d08+UC/VTBFRF6yqbKivvWzF1/0QegEAH3Xa/FGUuJpF9eMGkVSYO25KP6xS5Mu97F9PGi4Pno/PsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSBan8AMKi3heWU3rnAw95no+PojTUn8JnZuEPQvIPs=;
 b=MP/Zv7manSkjDoob1VR4CcIQzX7r0IIldnBb+vYimmFiTi5WcvVEg89GKVxmOjOL6NTxRGrxzhY3bUl+XO0G7s9/EmxH5uGbKsrRHdxPy1uylUnhWn+9+3jt2opcX+07GlVkYhJ/CFGC5F0t0OV8NvHEFFuv9YRQP3fzOaklleM=
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
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of pcidev
Date: Mon, 8 Jul 2024 19:41:18 +0800
Message-ID: <20240708114124.407797-2-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|CY5PR12MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: a42e1c98-7f0d-44b0-395e-08dc9f42f32f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4LRigjHWRbgfomhnzwcKB+OcGBIcPNOEEqyJsMtDrQs+p1N9lIw+2HOsG7Ao?=
 =?us-ascii?Q?Fbu6I5kmeNH5LEzi2dm2GakdPXzJIMx/FtY5buaTMra4lpVj8LvbhmgqsxpG?=
 =?us-ascii?Q?nhBqPHnk9x5uYdTs1dFczMbpgt6AqDOlgo/JvolgVTUIPwwOEcG1XPp8NRbT?=
 =?us-ascii?Q?vCykIyRACTfzPFthFNRIUHlrEm7U4wcXUfkLDEbaR6J3yZlov9E6tewtMASa?=
 =?us-ascii?Q?f1haz8V49WvQfg2sLJsccnlJZpBbpO3CnCtaex8I/rofc4ajs+Vl4rRaYk0O?=
 =?us-ascii?Q?bMHfc5LPzV5V6yos/CxpstrCnXCMgMJ49v/EyIZUWebDLTa7WEikR5cyBIpT?=
 =?us-ascii?Q?apXRVhHB6zjV068eFj4aUN3p3YAcOp7dWsc1FwGg1tI+DM4iW/joxsKqOfAd?=
 =?us-ascii?Q?ptTxApKn8FI+BD36ADqfEbX4+YIPzqJDMZhqZyOzqW1ZX6S7/XKgYkJQKMTY?=
 =?us-ascii?Q?VbARcf+KIR75tw73nOsYZ797KyoHb7i+UYJmoXPZe/IotnP9MMZ4UiUo1upC?=
 =?us-ascii?Q?TUdjDp4NUwlC4KkGYh/okOHceulKfSQR2oMOk7raB2K8JDnScelXxDPS+AyF?=
 =?us-ascii?Q?VK6WNB6kId9kicfbeHXKHNEV8lhj7MMmVJzYiFXgRE8LL7WKoUYzI/PXwybL?=
 =?us-ascii?Q?RvSjACAyEbYUQsHS/0aGLhRho/+Azs5dykF3aWNQe2dibzfclf/2hbAeEemW?=
 =?us-ascii?Q?u/l0Bh1mot/s8KM2sjzNU6DmaaLWjQ+P+X82aBf4K0hnAsgid1N01d4qe9ZF?=
 =?us-ascii?Q?m1jUSsvqbSxwMGJ8WqVC36Jn/Bjeq1RnPQeLEVzOkdxhB5ZGyI+Bj+KGwGCS?=
 =?us-ascii?Q?wMYdlGGoj3aq4yDt5BRmT59BNAKi6byTM2VtrgTZoWvLAzOR3gwtovHmqUhn?=
 =?us-ascii?Q?2/o0hElA9EqKLWGrjTFUr4LDPNMxeyKF1ZpugJUkKvehm/J9yIInKM493X+Z?=
 =?us-ascii?Q?4OdNHiLAM+5/0CYPdvt+UZ5wUfi56PSn3prkXtx9XL5F0eEoE4OWakle5CaX?=
 =?us-ascii?Q?EP1VYQwvDxZNA/9nAIDgEWzh4lZ73f8f52KYQfdvLlPq25bjyHuGmswI9QUk?=
 =?us-ascii?Q?ohEu7Orq0Edmftjsx6nv6mz0oN5uFozcqkffA0hJWgYMoNu/M7gHQQsCZcue?=
 =?us-ascii?Q?RXc/yAyVxVMi+4GROXBdpf9wM5fVCIfyt3p7uioNsL+hQSlzhMyXUgSKfjDr?=
 =?us-ascii?Q?pZ4pFGh+JXyzLWwN9TXeEkooOSnXIEBzcfYHMwhFQYxrQTBrp6eEARJZ2Kkm?=
 =?us-ascii?Q?C1SOY4tkLcZ+WtlE1WLraop5dE02EH+rWDFmyJ38O6HNyKYMOZSB9buNtBer?=
 =?us-ascii?Q?uhvFZ9tFGhnfv0n503x/CTgbzWNmWqGjOtx29nxkfQHJv1FxzifyTvTB0Ll3?=
 =?us-ascii?Q?xr+SbPZ63Wjntb1BXE0dzYAPAhOm+2U0+PDEnQVlLo6/2MMCVFdb4t1I07FH?=
 =?us-ascii?Q?pfPDGcwW+7CjthtP73MX0PLMijPpNLez?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 11:41:47.5759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a42e1c98-7f0d-44b0-395e-08dc9f42f32f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6372

When a device has been reset on dom0 side, the Xen hypervisor
doesn't get notification, so the cached state in vpci is all
out of date compare with the real device state.

To solve that problem, add a new hypercall to support the reset
of pcidev and clear the vpci state of device. So that once the
state of device is reset on dom0 side, dom0 can call this
hypercall to notify hypervisor.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  1 +
 xen/drivers/pci/physdev.c    | 52 ++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      | 10 +++++++
 xen/include/public/physdev.h | 16 +++++++++++
 xen/include/xen/vpci.h       |  8 ++++++
 5 files changed, 87 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 7fb3136f0c7c..0fab670a4871 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -83,6 +83,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_pci_device_state_reset:
     case PHYSDEVOP_dbgp_op:
         if ( !is_hardware_domain(currd) )
             return -ENOSYS;
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d133c..c0f47945d955 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -2,6 +2,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/vpci.h>
 
 #ifndef COMPAT
 typedef long ret_t;
@@ -67,6 +68,57 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_pci_device_state_reset:
+    {
+        struct pci_device_state_reset dev_reset;
+        struct pci_dev *pdev;
+        pci_sbdf_t sbdf;
+
+        ret = -EOPNOTSUPP;
+        if ( !is_pci_passthrough_enabled() )
+            break;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
+            break;
+
+        sbdf = PCI_SBDF(dev_reset.dev.seg,
+                        dev_reset.dev.bus,
+                        dev_reset.dev.devfn);
+
+        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
+        if ( ret )
+            break;
+
+        pcidevs_lock();
+        pdev = pci_get_pdev(NULL, sbdf);
+        if ( !pdev )
+        {
+            pcidevs_unlock();
+            ret = -ENODEV;
+            break;
+        }
+
+        write_lock(&pdev->domain->pci_lock);
+        pcidevs_unlock();
+        switch ( dev_reset.reset_type )
+        {
+        case PCI_DEVICE_STATE_RESET_COLD:
+        case PCI_DEVICE_STATE_RESET_WARM:
+        case PCI_DEVICE_STATE_RESET_HOT:
+        case PCI_DEVICE_STATE_RESET_FLR:
+            ret = vpci_reset_device_state(pdev, dev_reset.reset_type);
+            break;
+
+        default:
+            ret = -EOPNOTSUPP;
+            break;
+        }
+        write_unlock(&pdev->domain->pci_lock);
+
+        break;
+    }
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..7e914d1eff9f 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -172,6 +172,16 @@ int vpci_assign_device(struct pci_dev *pdev)
 
     return rc;
 }
+
+int vpci_reset_device_state(struct pci_dev *pdev,
+                            uint32_t reset_type)
+{
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
+    vpci_deassign_device(pdev);
+    return vpci_assign_device(pdev);
+}
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index f0c0d4727c0b..3cfde3fd2389 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -296,6 +296,13 @@ DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
  */
 #define PHYSDEVOP_prepare_msix          30
 #define PHYSDEVOP_release_msix          31
+/*
+ * Notify the hypervisor that a PCI device has been reset, so that any
+ * internally cached state is regenerated.  Should be called after any
+ * device reset performed by the hardware domain.
+ */
+#define PHYSDEVOP_pci_device_state_reset 32
+
 struct physdev_pci_device {
     /* IN */
     uint16_t seg;
@@ -305,6 +312,15 @@ struct physdev_pci_device {
 typedef struct physdev_pci_device physdev_pci_device_t;
 DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
 
+struct pci_device_state_reset {
+    physdev_pci_device_t dev;
+#define PCI_DEVICE_STATE_RESET_COLD 0
+#define PCI_DEVICE_STATE_RESET_WARM 1
+#define PCI_DEVICE_STATE_RESET_HOT  2
+#define PCI_DEVICE_STATE_RESET_FLR  3
+    uint32_t reset_type;
+};
+
 #define PHYSDEVOP_DBGP_RESET_PREPARE    1
 #define PHYSDEVOP_DBGP_RESET_DONE       2
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index da8d0f41e6f4..6be812dbc04a 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -38,6 +38,8 @@ int __must_check vpci_assign_device(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_deassign_device(struct pci_dev *pdev);
+int __must_check vpci_reset_device_state(struct pci_dev *pdev,
+                                         uint32_t reset_type);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
@@ -282,6 +284,12 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
 
 static inline void vpci_deassign_device(struct pci_dev *pdev) { }
 
+static inline int __must_check vpci_reset_device_state(struct pci_dev *pdev,
+                                                       uint32_t reset_type)
+{
+    return 0;
+}
+
 static inline void vpci_dump_msi(void) { }
 
 static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
-- 
2.34.1


