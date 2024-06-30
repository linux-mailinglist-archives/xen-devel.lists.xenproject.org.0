Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C912691D19F
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jun 2024 14:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751123.1159049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtlQ-0001aQ-6W; Sun, 30 Jun 2024 12:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751123.1159049; Sun, 30 Jun 2024 12:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtlQ-0001Xa-31; Sun, 30 Jun 2024 12:34:40 +0000
Received: by outflank-mailman (input) for mailman id 751123;
 Sun, 30 Jun 2024 12:34:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aV4l=OA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sNtlO-0007C1-Bb
 for xen-devel@lists.xenproject.org; Sun, 30 Jun 2024 12:34:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20602.outbound.protection.outlook.com
 [2a01:111:f403:2412::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bc5c146-36dd-11ef-90a3-e314d9c70b13;
 Sun, 30 Jun 2024 14:34:37 +0200 (CEST)
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sun, 30 Jun
 2024 12:34:31 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::cb) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32 via Frontend
 Transport; Sun, 30 Jun 2024 12:34:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Sun, 30 Jun 2024 12:34:31 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 07:34:27 -0500
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
X-Inumbo-ID: 1bc5c146-36dd-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPMjX3ADuJuxQEIZJLzdF0qdthSGLbWHPDachqXk6lY3yE1YMZ/FS/MszuES3tWGvGtzUFISI51rzpNdgGkj780idxFqDEWD2cWRU3GASlfJcm03e+xbIJWIVTfYAPP2cSuAhgLCH8hcu3X4j+9oZU8yc6sMnQUmgGyBldTPt1XBkFBHSzz58qIXsSYaYR1pRhkiKM5jDz3OOMonjcpZGJOxqw+1kD6R8JEgrf30S7/HIVR6hx5qsojSmPha2eSsyigjYHWHHdK61iPSuo6Q0RaZBauT6FUk1hRs9yXRb2UVDHZ95vyGWVxbN6nLjjN50rj6SNtTq/8+AY/JqwMaTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej4Z4EEVIlK2QxjhAZMN4LHn69U2vtDep4mQfyTjzQU=;
 b=fI+3PhMMmH+n0iL2sksLwdsF8E2vsERJVVxLEL/sLlEdIJyxG24bicsxkcUyuHaqtEprLTpstI04iiw9c7IYCBy/wVDEMISx/Um1wzRWEEqwlBVz+ISIS08AKAd0hdXdT4l5WLj8lxsVdDcMtHg0R9g29Xnn9akvNka5mI18i75TPOzBa6W/kMa2GSl8/sblzi0YvGRiQAbu9GXc4Snr1wjU6dOn7gFDGtm5MdzdD/MMGP+g/wgZ+4ol4TXY4N8WQB19iuL+atDCGBkhXlxHK59/YEX4NybR8G/0qbWHBarTwig8HSe69sDmTULAHm4FZQMwQ+q6fnnmo7ztZNuWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej4Z4EEVIlK2QxjhAZMN4LHn69U2vtDep4mQfyTjzQU=;
 b=ZdEgydn5QAwFv4uW3mcZ+1a0TIlgkRUTZbeY4pweiuAJy9X1B6eiuiQH4XAKmAZxhmg/JBtzYhXFwEC+qWRc/Hlr+i2ZDC9UXmtkJ7vVbLQzI2Spc29pXE/io0FHVI8ChZYfhUwLCCq6SnoxO7uqWX12ujGVTYiBcNUFjJN/vV4=
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
Subject: [RFC XEN PATCH v11 8/8] tools: Add new function to do PIRQ (un)map on PVH dom0
Date: Sun, 30 Jun 2024 20:33:44 +0800
Message-ID: <20240630123344.20623-9-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|CH2PR12MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7a5644-5bfb-4541-e2b2-08dc9900fda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hdT1+cc/ITsHy0PuY/YRRdSaRYxKbbZ8baBhRYfBvh12J8lWYR31EbUedZOy?=
 =?us-ascii?Q?3t92zjD/yalASoyjDjwffs1NegQu3eL/XO1EglDAsQZdBhkV/OvtMMKZSNc2?=
 =?us-ascii?Q?NjltiTPLijmgDZaFDmat4ZIcqKZLdFPtL0aZDvvitVEIRAtLyVMtQPDIi9cN?=
 =?us-ascii?Q?QCcX+HIgkDDmjIrt2ohv1tusMlc2is1FM/ePVbV/PB9ei2wUxWqLHwnWlRTB?=
 =?us-ascii?Q?TqgtlhmkyKagZV0yQ+dMzqQP6bQcJdKxaK8XD8RQcvpuLygj15K58mcbmqde?=
 =?us-ascii?Q?sH4W+X5Tf/xjDsf2JKYUV5EpCNpqOv2ehTXSO3IVoDCGN61R+UjN0kFqv1G+?=
 =?us-ascii?Q?ZQeVHxu4UMvC7bYGxzjxHoxH/hzcA2AaXTXcqx0uQv1teMqaQkiBhc6nvS0b?=
 =?us-ascii?Q?VVM15/tUCMe1M8St66wZGKMfSGOiXn5/CVtj7QRg5xlv+XaIJYrYzb0b0hyX?=
 =?us-ascii?Q?AL6iv2Tfpi5X1oLo2geaZb8zecm/MOfUZI89NFh2UndpgTanprEI99tEoVFn?=
 =?us-ascii?Q?BbOf3WuiRZRdMfHVtdwAKDFbJM/90k/vV8VVrtWEf7ZQJP5TlwPByLQxosm1?=
 =?us-ascii?Q?3aMtaJC/u4G0sM6E8yrhcPZn32wHSniQzSlCuyfq+emzmiEiH24VIX/4AODe?=
 =?us-ascii?Q?Otj4vNrX80zOv7H6ezQsnUzsLoEA034Rt9V+QytbFUx4qIBPa2cWpIqXPHxu?=
 =?us-ascii?Q?Sb+E0mDRq2Nu4TrC0DgbMFfsgc1+yhKbbHXe3fWSjHgZIfkIXo6V+RxnnfZw?=
 =?us-ascii?Q?Xorn8VFwm4sAnDDFU2EYeJtAX1+zux+/2SOpwcEYRuSFCgqWVn0SE72E3ghB?=
 =?us-ascii?Q?E8xhudBGQPQObarkbRBd1oxx0x1NWGcmVffDEDur3dQa7mTtxSGRE02eelbz?=
 =?us-ascii?Q?h47gYXurwYP1HyY1Lbi+R5gdbhJEd9Ky5Q04FKexLq8I8MgNkYKk7tYvoBsv?=
 =?us-ascii?Q?SGlFl9QE95p5YsjUTXP9wZxwrJkUyba74+o90gvpFk8WnhmxFUwDehVSv+tJ?=
 =?us-ascii?Q?R6bLguux9DMLhylTT/LjlNsGssHEpgZkL/Z9DbBZQ0u+A5Qu6ecglYNgx4xB?=
 =?us-ascii?Q?FCgFM7iTdATHHNMGD42OqHJQUwqYeHoUfPfkIgxlisD7WoJrOK8GcV82GveH?=
 =?us-ascii?Q?TdNlB5jMDG4F9dlJkU1ON4E1V3OFGLJtwdDkSPNp1ZMJTYAT0Iw40oR1z4N9?=
 =?us-ascii?Q?G9DjZnUQ8+9valBuuaHwf+nMXfO/IMZ53XoFpvrbe3ziTWO61GVbOgUodidL?=
 =?us-ascii?Q?hwuZMmIh0eNTdrn1D/3ZoS7E5qYTtY9lo65du8+6bp+LzjOXroaAveehRZ3u?=
 =?us-ascii?Q?ra8VYPcQ546Fz66qqBNv7/yPGix9fS0n0PlY1IVRf2tgzpK7ygWz5ULxROOd?=
 =?us-ascii?Q?2Cg9vCz8rP3gWxgexKJz7vz7AtnF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 12:34:31.3059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7a5644-5bfb-4541-e2b2-08dc9900fda0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039

When dom0 is PVH, and passthrough a device to dumU, xl will
use the gsi number of device to do a pirq mapping, see
pci_add_dm_done->xc_physdev_map_pirq, but the gsi number is
got from file /sys/bus/pci/devices/<sbdf>/irq, that confuses
irq and gsi, they are in different space and are not equal,
so it will fail when mapping.
To solve this issue, use xc_physdev_gsi_from_dev to get the
real gsi and then to map pirq.

Besides, PVH dom doesn't have PIRQ flag, it doesn't do
PHYSDEVOP_map_pirq for each gsi. So grant function callstack
pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
domain_pirq_to_irq. And old hypercall XEN_DOMCTL_irq_permission
requires passing in pirq, it is not suitable for dom0 that
doesn't have PIRQs to grant irq permission.
To solve this issue, use the new hypercall
XEN_DOMCTL_gsi_permission to grant the permission of irq(
translate from gsi) to dumU when dom0 has no PIRQs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
---
RFC: it needs to wait for the corresponding third patch on linux kernel side to be merged.
https://lore.kernel.org/xen-devel/20240607075109.126277-4-Jiqian.Chen@amd.com/
This patch must be merged after the patch on linux kernel side
---
 tools/include/xenctrl.h       |   5 ++
 tools/libs/ctrl/xc_domain.c   |  15 +++++
 tools/libs/light/libxl_arch.h |   4 ++
 tools/libs/light/libxl_arm.c  |  10 +++
 tools/libs/light/libxl_pci.c  |  17 ++++++
 tools/libs/light/libxl_x86.c  | 111 ++++++++++++++++++++++++++++++++++
 6 files changed, 162 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 3720e22b399a..33810385535e 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1382,6 +1382,11 @@ int xc_domain_irq_permission(xc_interface *xch,
                              uint32_t pirq,
                              bool allow_access);
 
+int xc_domain_gsi_permission(xc_interface *xch,
+                             uint32_t domid,
+                             uint32_t gsi,
+                             bool allow_access);
+
 int xc_domain_iomem_permission(xc_interface *xch,
                                uint32_t domid,
                                unsigned long first_mfn,
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index f2d9d14b4d9f..8540e84fda93 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1394,6 +1394,21 @@ int xc_domain_irq_permission(xc_interface *xch,
     return do_domctl(xch, &domctl);
 }
 
+int xc_domain_gsi_permission(xc_interface *xch,
+                             uint32_t domid,
+                             uint32_t gsi,
+                             bool allow_access)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_gsi_permission,
+        .domain = domid,
+        .u.gsi_permission.gsi = gsi,
+        .u.gsi_permission.allow_access = allow_access,
+    };
+
+    return do_domctl(xch, &domctl);
+}
+
 int xc_domain_iomem_permission(xc_interface *xch,
                                uint32_t domid,
                                unsigned long first_mfn,
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index f88f11d6de1d..11b736067951 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -91,6 +91,10 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src);
 
+_hidden
+int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid);
+_hidden
+int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid);
 #if defined(__i386__) || defined(__x86_64__)
 
 #define LAPIC_BASE_ADDRESS  0xfee00000
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index a4029e3ac810..d869bbec769e 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1774,6 +1774,16 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
 {
 }
 
+int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
+{
+    return -1;
+}
+
+int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
+{
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da0794e..3d25997921cc 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -17,6 +17,7 @@
 #include "libxl_osdeps.h" /* must come before any other headers */
 
 #include "libxl_internal.h"
+#include "libxl_arch.h"
 
 #define PCI_BDF                "%04x:%02x:%02x.%01x"
 #define PCI_BDF_SHORT          "%02x:%02x.%01x"
@@ -1478,6 +1479,16 @@ static void pci_add_dm_done(libxl__egc *egc,
     fclose(f);
     if (!pci_supp_legacy_irq())
         goto out_no_irq;
+
+    /*
+     * When dom0 is PVH and mapping a x86 gsi to pirq for domU,
+     * should use gsi to grant irq permission.
+     */
+    if (!libxl__arch_hvm_map_gsi(gc, pci_encode_bdf(pci), domid))
+        goto pci_permissive;
+    else
+        LOGED(WARN, domid, "libxl__arch_hvm_map_gsi failed (err=%d)", errno);
+
     sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                                 pci->bus, pci->dev, pci->func);
     f = fopen(sysfs_path, "r");
@@ -1505,6 +1516,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     }
     fclose(f);
 
+pci_permissive:
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
         if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/permissive",
@@ -2229,6 +2241,11 @@ skip_bar:
     if (!pci_supp_legacy_irq())
         goto skip_legacy_irq;
 
+    if (!libxl__arch_hvm_unmap_gsi(gc, pci_encode_bdf(pci), domid))
+        goto skip_legacy_irq;
+    else
+        LOGED(WARN, domid, "libxl__arch_hvm_unmap_gsi failed (err=%d)", errno);
+
     sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                            pci->bus, pci->dev, pci->func);
 
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 60643d6f5376..e7756d323cb6 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -879,6 +879,117 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
                                  libxl_defbool_val(src->b_info.u.hvm.pirq));
 }
 
+struct pcidev_map_pirq {
+    uint32_t sbdf;
+    uint32_t pirq;
+    XEN_LIST_ENTRY(struct pcidev_map_pirq) entry;
+};
+
+static pthread_mutex_t pcidev_pirq_mutex = PTHREAD_MUTEX_INITIALIZER;
+static XEN_LIST_HEAD(, struct pcidev_map_pirq) pcidev_pirq_list =
+    XEN_LIST_HEAD_INITIALIZER(pcidev_pirq_list);
+
+int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
+{
+    int pirq = -1, gsi, r;
+    xc_domaininfo_t info;
+    struct pcidev_map_pirq *pcidev_pirq;
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+
+    r = xc_domain_getinfo_single(ctx->xch, LIBXL_TOOLSTACK_DOMID, &info);
+    if (r < 0) {
+        LOGED(ERROR, domid, "getdomaininfo failed (error=%d)", errno);
+        return r;
+    }
+    if ((info.flags & XEN_DOMINF_hvm_guest) &&
+        !(info.arch_config.emulation_flags & XEN_X86_EMU_USE_PIRQ)) {
+        gsi = xc_physdev_gsi_from_pcidev(ctx->xch, sbdf);
+        if (gsi < 0) {
+            return ERROR_FAIL;
+        }
+        r = xc_physdev_map_pirq(ctx->xch, domid, gsi, &pirq);
+        if (r < 0) {
+            LOGED(ERROR, domid, "xc_physdev_map_pirq gsi=%d (error=%d)",
+                  gsi, errno);
+            return r;
+        }
+        r = xc_domain_gsi_permission(ctx->xch, domid, gsi, 1);
+        if (r < 0) {
+            LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d (error=%d)",
+                  gsi, errno);
+            return r;
+        }
+    } else {
+        return ERROR_FAIL;
+    }
+
+    /* Save the pirq for the usage of unmapping */
+    pcidev_pirq = malloc(sizeof(struct pcidev_map_pirq));
+    if (!pcidev_pirq) {
+        LOGED(ERROR, domid, "no memory for saving pirq of pcidev info");
+        return ERROR_NOMEM;
+    }
+    pcidev_pirq->sbdf = sbdf;
+    pcidev_pirq->pirq = pirq;
+
+    assert(!pthread_mutex_lock(&pcidev_pirq_mutex));
+    XEN_LIST_INSERT_HEAD(&pcidev_pirq_list, pcidev_pirq, entry);
+    assert(!pthread_mutex_unlock(&pcidev_pirq_mutex));
+
+    return 0;
+}
+
+int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
+{
+    int pirq = -1, gsi, r;
+    xc_domaininfo_t info;
+    struct pcidev_map_pirq *pcidev_pirq;
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+
+    r = xc_domain_getinfo_single(ctx->xch, LIBXL_TOOLSTACK_DOMID, &info);
+    if (r < 0) {
+        LOGED(ERROR, domid, "getdomaininfo failed (error=%d)", errno);
+        return r;
+    }
+    if ((info.flags & XEN_DOMINF_hvm_guest) &&
+        !(info.arch_config.emulation_flags & XEN_X86_EMU_USE_PIRQ)) {
+        gsi = xc_physdev_gsi_from_pcidev(ctx->xch, sbdf);
+        if (gsi < 0) {
+            return ERROR_FAIL;
+        }
+        assert(!pthread_mutex_lock(&pcidev_pirq_mutex));
+        XEN_LIST_FOREACH(pcidev_pirq, &pcidev_pirq_list, entry) {
+            if (pcidev_pirq->sbdf == sbdf) {
+                pirq = pcidev_pirq->pirq;
+                XEN_LIST_REMOVE(pcidev_pirq, entry);
+                free(pcidev_pirq);
+                break;
+            }
+        }
+        assert(!pthread_mutex_unlock(&pcidev_pirq_mutex));
+        if (pirq < 0) {
+            /* pirq has been unmapped, so return directly */
+            return 0;
+        }
+        r = xc_physdev_unmap_pirq(ctx->xch, domid, pirq);
+        if (r < 0) {
+            LOGED(ERROR, domid, "xc_physdev_unmap_pirq pirq=%d (error=%d)",
+                  pirq, errno);
+            return r;
+        }
+        r = xc_domain_gsi_permission(ctx->xch, domid, gsi, 0);
+        if (r < 0) {
+            LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d (error=%d)",
+                  gsi, errno);
+            return r;
+        }
+    } else {
+        return ERROR_FAIL;
+    }
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


