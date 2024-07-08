Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCBC92A15E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 13:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755309.1163682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQml7-0006K8-Uy; Mon, 08 Jul 2024 11:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755309.1163682; Mon, 08 Jul 2024 11:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQml7-0006Hz-Qv; Mon, 08 Jul 2024 11:42:17 +0000
Received: by outflank-mailman (input) for mailman id 755309;
 Mon, 08 Jul 2024 11:42:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQml5-00042n-Qs
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 11:42:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd19c7e-3d1f-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 13:42:14 +0200 (CEST)
Received: from MN2PR01CA0023.prod.exchangelabs.com (2603:10b6:208:10c::36) by
 IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 11:42:09 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:10c:cafe::54) by MN2PR01CA0023.outlook.office365.com
 (2603:10b6:208:10c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34 via Frontend
 Transport; Mon, 8 Jul 2024 11:42:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 11:42:08 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 06:42:04 -0500
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
X-Inumbo-ID: 1dd19c7e-3d1f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAJgKtTI96aLuCiwJyGre4Go/EuKZjNmVDxQyb4i8MaSIkIbODv8sM5+3zmho/umUd7wj/59QPxYw40qk1fLNLvL3JhC53CEG/W/kToEScBpYRHmvr0WMlci0ZfA17t4lsjmFPp2C0iS39soKl8X8p5NjoZJ4OK6JVSHyazrK5kuQqhOVX44Lik+DXSKC3kDQ7+HJ1oDyRhVJto6vlqTpms4eV+XghvY6MUv8LsBtB0QpmTWDV1BSAUfwz0DmMPHoJnV6nA/ofLtZJLLyo6inANK48iIvjb3WubF5tESBSP1sx5lHNbbswjJAaTH98njACY4CttsSr7jYCwC73o7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJ211g/xQ9EozfgjyUM5ps8F7M097mD2TeBPX5zf5hY=;
 b=EYrQCx/FEjF1iWEoWCSGksyoHCEwtIlxwY8eF6dtZmkiH7VqDkj+O0iESxnKxxHvYqaBVDI+i7KDBhs9YzbAVfc+fABykwrO4gXzUDMRJwuYobkV/4YjAaC6FgmKoo4MGgrC2a8jaoBlrDm0lTt/5+pt7QXBfVSQmWge5Qsozc6sdv5i4WxGHguhxtFTuiuNFhEld09I4O4xC2dzwgEnFzy50Q55JsaQItkd81O+IW3tDEGZJ2+hiQAss2At8gEDiBV+R//MZXxogjHRHmXkuPcBCwvu6+A51o/KuixnRPQVaaxNuwb6C4qArm9SDX06flPsCKYo+APDlTd4aXm6xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJ211g/xQ9EozfgjyUM5ps8F7M097mD2TeBPX5zf5hY=;
 b=ERJ/EVDrwDhQOjZb7sfEHRoyVsmMn9AWTj/cLbdzWoY/kcOWs7uq/WAdylZ81qusdLYh+zEONoLD8olpj6kpWXhHuGrxF5lSJNjVmp6uBPKYWqGRaXJ/bk2BKrwiOiLis3ua+vCVEIM6FIcdPLqwV0O9+tM6qUTe0tOCU51m1lg=
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
Subject: [RFC XEN PATCH v12 7/7] tools: Add new function to do PIRQ (un)map on PVH dom0
Date: Mon, 8 Jul 2024 19:41:24 +0800
Message-ID: <20240708114124.407797-8-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a51ddc-a332-4148-7099-08dc9f42ffb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2p8uK/ppXQQw7o4Np4bHG2L5tLRHd9tYH3t4BDnshFKx9knGw2EBJGpFvyyG?=
 =?us-ascii?Q?aU1zZbjx4CRsfuP1QuvnSKQo9r2ojBrqfK0c1Dr5XbtjzA4+phg/pYTuhqze?=
 =?us-ascii?Q?L/sJ2fyhPMO9XY5BPhu0MRhd5bnP3lOG2XMNMYFtWPqIE29Z/2cCeLyeLHzj?=
 =?us-ascii?Q?5toetIEMIy1l+AETFQonDka9TGuL/xCQbUqzdXar1gqzdGgFzeHHfTgidkbk?=
 =?us-ascii?Q?ohV7egWRFH1vTALGiU7H1baSGflwzmJpb/oPA5w6Jppin1208o1hAK5HCzMw?=
 =?us-ascii?Q?WsStp+mxWPV2hyt+C4uVV5u9UzYI7dAE8HbQ70+IZWybzgb0B42gbjdE6hWd?=
 =?us-ascii?Q?G2BQXVYsnTDucHZXr/TxooMLzHd3BWMOeHAXXq9ctgm0SOVzU20BoydNi1Io?=
 =?us-ascii?Q?M0G6tS79bT1ghHSycsxWTvnUowp2qAYcZxyXH5CtPMd35c+FXAdoHIm4UofX?=
 =?us-ascii?Q?9PACEw+66hGX+ZUaLNAQFoefxgCMRN8aGlXQJPpazhMRWTtT9zxKrajjRtfD?=
 =?us-ascii?Q?CfgNBWge85w7abS8aiCppE+Aseze8lXrITQpfbDZidHI0hjqlYvkwwWUhPwx?=
 =?us-ascii?Q?tXcVCqDUKTnFb0FMPD1/C/JMtHJeS/VuiJy3beol+iubU/W4tWU+FNpq0QXy?=
 =?us-ascii?Q?2RQJLs9dRHvT2HaQaRVof9UnVGS25+SJUmUgxtOxqVuP5A2Mbyh+yQfFyOrl?=
 =?us-ascii?Q?VCLadakqmZYk2FX9a7VSblOSULWuQamS1aBE3LzYquhq2df28mk7SLuWWt5r?=
 =?us-ascii?Q?zH14E4Xj4bVmb9AIlz3siTgwqQONt4njtBuDyYpT5eGnNxOMj2wziGbeB05M?=
 =?us-ascii?Q?X5zeWbSkzD3CMp/QE2plnurRvdg+SJpZq/1ydx1eDfTkX6ix4ewQn25jdyfF?=
 =?us-ascii?Q?S7QdwnwweB8yKDtJHSRyUmfG2/DRUZmUQYy/iO42bTeu5LPWuYxK7ieCnUgb?=
 =?us-ascii?Q?Po2hYTxQXtfikgkx7U2IUMNr6YMenXHYENSyLE8rbGxyRdUe+NNBsOy1mxeS?=
 =?us-ascii?Q?px4GyqXyNqxcnLW6vVdj9PBoOYKa3aPsy2OpSKy4BTzkduW/LlpJoDiWyS/e?=
 =?us-ascii?Q?lGm+gFFzVo/OKHr5WlPSz1oNpfpz+UQ7ioZzyUnU7cdpud+FmFKL/LXpIGEA?=
 =?us-ascii?Q?IxXGHTzRkBJat5vHFdjKPo9Lrk7OLOYENGbpRIwuMqeA23NmCPrHbffdu7Cr?=
 =?us-ascii?Q?MijfN/4SjG72UYStuU4/JFHbF5NsAKD25UYFbdWqpYY0wDczEef5K6Fyu/Z6?=
 =?us-ascii?Q?1A3dr+OGOagruFPdnKyZtS1zR2fPmMfIdxJ5Ttc8X5f/OI2SLBKl+UbYEe8J?=
 =?us-ascii?Q?59C31K1eEm16AaTkz371kAESWZPXiE3/FshdLVloYcnxb4b9qNsR1jHKn2Jf?=
 =?us-ascii?Q?iyerJgzKIDwlewrUiiumlvSe1mpX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 11:42:08.5881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a51ddc-a332-4148-7099-08dc9f42ffb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312

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
index 3720e22b399a..9ff5f1810cf8 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1382,6 +1382,11 @@ int xc_domain_irq_permission(xc_interface *xch,
                              uint32_t pirq,
                              bool allow_access);
 
+int xc_domain_gsi_permission(xc_interface *xch,
+                             uint32_t domid,
+                             uint32_t gsi,
+                             uint8_t access_flag);
+
 int xc_domain_iomem_permission(xc_interface *xch,
                                uint32_t domid,
                                unsigned long first_mfn,
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index f2d9d14b4d9f..4c89f07e4d6e 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1394,6 +1394,21 @@ int xc_domain_irq_permission(xc_interface *xch,
     return do_domctl(xch, &domctl);
 }
 
+int xc_domain_gsi_permission(xc_interface *xch,
+                             uint32_t domid,
+                             uint32_t gsi,
+                             uint8_t access_flag)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_gsi_permission,
+        .domain = domid,
+        .u.gsi_permission.gsi = gsi,
+        .u.gsi_permission.access_flag = access_flag,
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


