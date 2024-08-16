Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74900954778
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778509.1188585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seupS-000411-S8; Fri, 16 Aug 2024 11:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778509.1188585; Fri, 16 Aug 2024 11:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seupS-0003zD-Nx; Fri, 16 Aug 2024 11:09:10 +0000
Received: by outflank-mailman (input) for mailman id 778509;
 Fri, 16 Aug 2024 11:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uc/1=PP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1seupR-0001dU-FU
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:09:09 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2417::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3e4befa-5bbf-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 13:09:07 +0200 (CEST)
Received: from BL0PR02CA0053.namprd02.prod.outlook.com (2603:10b6:207:3d::30)
 by CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 11:08:59 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:207:3d:cafe::94) by BL0PR02CA0053.outlook.office365.com
 (2603:10b6:207:3d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Fri, 16 Aug 2024 11:08:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Fri, 16 Aug 2024 11:08:59 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 06:08:55 -0500
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
X-Inumbo-ID: f3e4befa-5bbf-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eH6BuZ+ExgZK/hER10eJY0XhegRz4fyygNk/Daj0ZfnGJPkzxyHKA0lFfaVDW7sfBj5ObM+RjIfRPIVI8ip4COTN2Dy2WD5tU57BsIhci9rGxL6mT3++hzhFpT8yx/cSZIdxTyErFwrl3/Se2+0rTQetmCc4bXu+VzZER3NqbuRI3JZ3t7MKGPkdWzspWzSf67x7Basy11ipBlXIaWCCSlZoZ7uximcj2W9+E/EpVYIV4dCii+eUf5Tvmdw78vUT+VN0gGtuXArnhFD6LtERzQHCTt/LU0hVj8ia+4f15U4JCMGCaE9sWIoZrpWbRp3rDaK1qN+l8mo+uboaNI4kjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu5Qz9WFGKymDn26KEbzd9h2r23enFrhojTi0ypkn/U=;
 b=VdBbbRreQBIcvqImzQKLNiUBY2DH4jCVzRFTre8hX6SyIDqUCqXtv8JyNzFlHy2x/Tl5ZdhLBQ2iBpNU9dYfWv973kwsBoOiZM7bijJYIs92EuTqUS7wVspTC5lldhj4wxvXDdIRtX+3xBqEl3EI1JpagnTMszidzJWIWyAZO5kppdktTgtUPE0xqSlzBergfYTC41WVYmhCq0JrYNhiMPMqGfhaEqilj4pMCdpuOgfBWJ5MnViq58wdoDNH2v6qZu0OcTEQ6gfqVbsyRpIYWPXxq6SZITmDBQjJc6xclxRejA3NoxhBe2WvRG4EoQcG+AmSnFm4AjBKAlrGfRHFZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu5Qz9WFGKymDn26KEbzd9h2r23enFrhojTi0ypkn/U=;
 b=aOookuMGajrnUHkXV4V1bAsL5V3q/BLR4J3WwUcePNpX7e/yVr04NJ+KrPp84ZJW/NMcuhNI5LnHEgJ9mDYoLcjdtPJLZJywp4jzV4ILMIUDW83FVCeO/P4TPDpGsSWSlwz5LlzsiAKUIm0T06WZMU4ScpcWxP6flUWWm+Wr4IE=
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
Subject: [RFC XEN PATCH v13 6/6] tools: Add new function to do PIRQ (un)map on PVH dom0
Date: Fri, 16 Aug 2024 19:08:20 +0800
Message-ID: <20240816110820.75672-7-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|CH3PR12MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a13c71-18f9-43dc-f35c-08dcbde3d41a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M3RMgYltroc2QiHlmkQv2U29IYla6ChUOs3AcZXiSivwXo8Tv0RF7C/qWT3V?=
 =?us-ascii?Q?taCiN9i1nH9CPCVt2VCPOaKH9ZH3TJ2cEKb3RjUz8aALGZGlMy4CiMomOq4N?=
 =?us-ascii?Q?aMX6J3/caPNtvk7HiuOXhVq0bjq9QaYZNQMv73pU3T5c6CV/XlrTW8vb7f/+?=
 =?us-ascii?Q?HQClRurjvFmPFTg2EZKEPrkPBV2qBOgaH5vFrZWd7UUHRiCS5VIra5KtY0n/?=
 =?us-ascii?Q?ECSDMEOfqGDdGTzltzRXJcUP3wx3jP33iuclj8u/+P6KNVnNPG4Dd0GdXk18?=
 =?us-ascii?Q?SKPoFeiiHAdnGv9JfrNsoAh07F0kWq86V0OJzqNa0THR7czYZPrpDnNLjk00?=
 =?us-ascii?Q?I49AKLqh8uElcmzFVwwyZZLxdi6GKl99INDT1ceUlcOYzMzo05Dbw++KhoYx?=
 =?us-ascii?Q?l1nImMfmSMRux8psucQYDkQTqP6PXtvUO+CCpQHEWk5N2czNn6pMqfR91upa?=
 =?us-ascii?Q?pzBWpLPHSGGNAfzeS1spw4KWzSz0gEAmqbj9p451C41fOiqz1k+0dAFp5lgI?=
 =?us-ascii?Q?Kf91vyRIsgiG5ndGx+CNZPXAszWoiOswlDGkObCMJzD+GYBzrsw6RvbFQLCB?=
 =?us-ascii?Q?H0XEVk/Y4Pk3tsYGaaKnlFb53fuYvuXfvhaS21s6hUsf7uXp0yiAhlq7Rfpi?=
 =?us-ascii?Q?FGh4WSfG4UFQl58Fcas72ZT5cNeRhFQLhsnujQ0MW4Fbs8XkiTC2qx8MBJ6+?=
 =?us-ascii?Q?dxEcXthzsYzmAJGc2XcxFXt9ZdFdhizXdtOr8hrgYx6+KoFpig1n1zPl75PB?=
 =?us-ascii?Q?L3gkds1/+TeLRZ2wZypPAGtkZDqwn4WpnoRU82gHaFIzWXUDUxP9qL4LnM5U?=
 =?us-ascii?Q?5dUZisN/cLE83WVZh3QUC2ZKbOfWzMJr5hQKIjgDWe13QFEBpQ0AywnCpnRk?=
 =?us-ascii?Q?7AriQ1BHDrSdlE2Kt9OaiX1Im/PU1KkCnYGGcZ180Ul/OvHPtYP8HAhRG41X?=
 =?us-ascii?Q?Pa0KRvPmj7r/3jEA2SyhIqnuzmGkByMjM1hmTFVTvmAC+2QY0H7yuKOPKJCi?=
 =?us-ascii?Q?gPX7DkiINSGoXN4LJNx0x8H/bY8y9dIs3XRoxeqYKPgXLfRvOZPOg028SmLD?=
 =?us-ascii?Q?19MPa+VrmrJOf+YSCCBzXgyhWxexfok16Jow8S3n30HO58ziuoHVhqCDBgHo?=
 =?us-ascii?Q?Up2NS21gkJJCb+/xu+EnDeK4PLuA3Y6I1dTHkU/qDZ7VTw3MHjtLq45kkg3o?=
 =?us-ascii?Q?3cEG9WurOqWJyTptkO+nRVd0MoQmI+BfPBTRVVd9Hxj7agJ4RoLQHRzDP5Nk?=
 =?us-ascii?Q?3afz8fQCBdQRpD1GNzLf6r30x3ijxqOiHvm4ubHQp5NgIoBg0eP99M19N+X+?=
 =?us-ascii?Q?wJCJ9FN1Go82snhhnWXOTDu3CX1YyKTAkkiMfGimH+5P8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 11:08:59.2904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a13c71-18f9-43dc-f35c-08dcbde3d41a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233

When dom0 is PVH, and passthrough a device to dumU, xl will
use the gsi number of device to do a pirq mapping, see
pci_add_dm_done->xc_physdev_map_pirq, but the gsi number is
got from file /sys/bus/pci/devices/<sbdf>/irq, that confuses
irq and gsi, they are in different space and are not equal,
so it will fail when mapping.
To solve this issue, use xc_physdev_gsi_from_dev to get the
real gsi and add a new function xc_physdev_map_pirq_gsi to get
a free pirq for gsi(why not use current function
xc_physdev_map_pirq, because it doesn't support to allocate a
free pirq, what's more, to prevent changing it and affecting
its callers, so add xc_physdev_map_pirq_gsi).

Besides, PVH dom0 doesn't have PIRQ flag, it doesn't do
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
---
v12->v13 changes:
Deleted patch #6 of v12, and added function xc_physdev_map_pirq_gsi to map pirq for gsi.
For functions that generate libxl error, changed the return value from -1 to ERROR_*.
Instead of declaring "ctx", use the macro "CTX".
Add the function libxl__arch_local_romain_ has_pirq_notion to determine if there is a concept of pirq in the domain where xl is located.
In the function libxl__arch_hvm_unmap_gsi, before unmap_pirq, use map_pirq to obtain the pirq corresponding to gsi.

v11->v12 changes:
Nothing.

v10->v11 changes:
New patch
Modification of the tools part of patches#4 and #5 of v10, use privcmd_gsi_from_dev to get gsi, and use XEN_DOMCTL_gsi_permission to grant gsi.
Change the hard-coded 0 to use LIBXL_TOOLSTACK_DOMID.
Add libxl__arch_hvm_map_gsi to distinguish x86 related implementations.
Add a list pcidev_pirq_list to record the relationship between sbdf and pirq, which can be used to obtain the corresponding pirq when unmap PIRQ.
---
 tools/include/xenctrl.h       |  10 +++
 tools/libs/ctrl/xc_domain.c   |  15 +++++
 tools/libs/ctrl/xc_physdev.c  |  27 ++++++++
 tools/libs/light/libxl_arch.h |   6 ++
 tools/libs/light/libxl_arm.c  |  15 +++++
 tools/libs/light/libxl_pci.c  | 112 ++++++++++++++++++++--------------
 tools/libs/light/libxl_x86.c  |  72 ++++++++++++++++++++++
 7 files changed, 212 insertions(+), 45 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 82de6748f7a7..c798472995f7 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1382,6 +1382,11 @@ int xc_domain_irq_permission(xc_interface *xch,
                              uint32_t pirq,
                              bool allow_access);
 
+int xc_domain_gsi_permission(xc_interface *xch,
+                             uint32_t domid,
+                             uint32_t gsi,
+                             uint32_t flags);
+
 int xc_domain_iomem_permission(xc_interface *xch,
                                uint32_t domid,
                                unsigned long first_mfn,
@@ -1637,6 +1642,11 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
                             int entry_nr,
                             uint64_t table_base);
 
+int xc_physdev_map_pirq_gsi(xc_interface *xch,
+                            uint32_t domid,
+                            int gsi,
+                            int *pirq);
+
 int xc_physdev_unmap_pirq(xc_interface *xch,
                           uint32_t domid,
                           int pirq);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index f2d9d14b4d9f..e3538ec0ba80 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1394,6 +1394,21 @@ int xc_domain_irq_permission(xc_interface *xch,
     return do_domctl(xch, &domctl);
 }
 
+int xc_domain_gsi_permission(xc_interface *xch,
+                             uint32_t domid,
+                             uint32_t gsi,
+                             uint32_t flags)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_gsi_permission,
+        .domain = domid,
+        .u.gsi_permission.gsi = gsi,
+        .u.gsi_permission.flags = flags,
+    };
+
+    return do_domctl(xch, &domctl);
+}
+
 int xc_domain_iomem_permission(xc_interface *xch,
                                uint32_t domid,
                                unsigned long first_mfn,
diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 460a8e779ce8..c752cd1f4410 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -95,6 +95,33 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
     return rc;
 }
 
+int xc_physdev_map_pirq_gsi(xc_interface *xch,
+                            uint32_t domid,
+                            int gsi,
+                            int *pirq)
+{
+    int rc;
+    struct physdev_map_pirq map;
+
+    if ( !pirq )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+    memset(&map, 0, sizeof(struct physdev_map_pirq));
+    map.domid = domid;
+    map.type = MAP_PIRQ_TYPE_GSI;
+    map.index = gsi;
+    map.pirq = *pirq;
+
+    rc = do_physdev_op(xch, PHYSDEVOP_map_pirq, &map, sizeof(map));
+
+    if ( !rc )
+        *pirq = map.pirq;
+
+    return rc;
+}
+
 int xc_physdev_unmap_pirq(xc_interface *xch,
                           uint32_t domid,
                           int pirq)
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index f88f11d6de1d..c8ef52ddbe7f 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -91,6 +91,12 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src);
 
+_hidden
+int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid);
+_hidden
+int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid);
+_hidden
+bool libxl__arch_local_domain_has_pirq_notion(libxl__gc *gc);
 #if defined(__i386__) || defined(__x86_64__)
 
 #define LAPIC_BASE_ADDRESS  0xfee00000
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index a4029e3ac810..5a9db5e85f6f 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1774,6 +1774,21 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
 {
 }
 
+int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
+{
+    return ERROR_INVAL;
+}
+
+int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
+{
+    return ERROR_INVAL;
+}
+
+bool libxl__arch_local_domain_has_pirq_notion(libxl__gc *gc)
+{
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da0794e..2014a67e6e56 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -17,6 +17,7 @@
 #include "libxl_osdeps.h" /* must come before any other headers */
 
 #include "libxl_internal.h"
+#include "libxl_arch.h"
 
 #define PCI_BDF                "%04x:%02x:%02x.%01x"
 #define PCI_BDF_SHORT          "%02x:%02x.%01x"
@@ -1478,32 +1479,43 @@ static void pci_add_dm_done(libxl__egc *egc,
     fclose(f);
     if (!pci_supp_legacy_irq())
         goto out_no_irq;
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
-                                pci->bus, pci->dev, pci->func);
-    f = fopen(sysfs_path, "r");
-    if (f == NULL) {
-        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
-        goto out_no_irq;
-    }
-    if ((fscanf(f, "%u", &irq) == 1) && irq) {
-        r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
-        if (r < 0) {
-            LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
-                  irq, r);
-            fclose(f);
-            rc = ERROR_FAIL;
+
+    /* When dom0 is PVH, should use gsi to map pirq and grant permission */
+    rc = libxl__arch_local_domain_has_pirq_notion(gc);
+    if (!rc) {
+        rc = libxl__arch_hvm_map_gsi(gc, pci_encode_bdf(pci), domid);
+        if (rc) {
+            LOGED(ERROR, domainid, "libxl__arch_hvm_map_gsi failed");
             goto out;
         }
-        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
-        if (r < 0) {
-            LOGED(ERROR, domainid,
-                  "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
-            fclose(f);
-            rc = ERROR_FAIL;
-            goto out;
+    } else {
+        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                                    pci->bus, pci->dev, pci->func);
+        f = fopen(sysfs_path, "r");
+        if (f == NULL) {
+            LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+            goto out_no_irq;
+        }
+        if ((fscanf(f, "%u", &irq) == 1) && irq) {
+            r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
+            if (r < 0) {
+                LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
+                    irq, r);
+                fclose(f);
+                rc = ERROR_FAIL;
+                goto out;
+            }
+            r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
+            if (r < 0) {
+                LOGED(ERROR, domainid,
+                    "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
+                fclose(f);
+                rc = ERROR_FAIL;
+                goto out;
+            }
         }
+        fclose(f);
     }
-    fclose(f);
 
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
@@ -2229,33 +2241,43 @@ skip_bar:
     if (!pci_supp_legacy_irq())
         goto skip_legacy_irq;
 
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
-                           pci->bus, pci->dev, pci->func);
-
-    f = fopen(sysfs_path, "r");
-    if (f == NULL) {
-        LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
-        goto skip_legacy_irq;
-    }
+    /* When dom0 is PVH, should use gsi to unmap pirq and deny permission */
+    rc = libxl__arch_local_domain_has_pirq_notion(gc);
+    if (!rc) {
+        rc = libxl__arch_hvm_unmap_gsi(gc, pci_encode_bdf(pci), domid);
+        if (rc) {
+            LOGED(ERROR, domid, "libxl__arch_hvm_unmap_gsi failed");
+            goto out;
+        }
+    } else {
+        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                            pci->bus, pci->dev, pci->func);
 
-    if ((fscanf(f, "%u", &irq) == 1) && irq) {
-        rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
-        if (rc < 0) {
-            /*
-             * QEMU may have already unmapped the IRQ. So the error
-             * may be spurious. For now, still print an error message as
-             * it is not easy to distinguished between valid and
-             * spurious error.
-             */
-            LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
+        f = fopen(sysfs_path, "r");
+        if (f == NULL) {
+            LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
+            goto skip_legacy_irq;
         }
-        rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
-        if (rc < 0) {
-            LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
+
+        if ((fscanf(f, "%u", &irq) == 1) && irq) {
+            rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
+            if (rc < 0) {
+                /*
+                * QEMU may have already unmapped the IRQ. So the error
+                * may be spurious. For now, still print an error message as
+                * it is not easy to distinguished between valid and
+                * spurious error.
+                */
+                LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
+            }
+            rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
+            if (rc < 0) {
+                LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
+            }
         }
-    }
 
-    fclose(f);
+        fclose(f);
+    }
 
 skip_legacy_irq:
 
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 60643d6f5376..20e3956f09b8 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -879,6 +879,78 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
                                  libxl_defbool_val(src->b_info.u.hvm.pirq));
 }
 
+bool libxl__arch_local_domain_has_pirq_notion(libxl__gc *gc)
+{
+    int r;
+    xc_domaininfo_t info;
+
+    r = xc_domain_getinfo_single(CTX->xch, LIBXL_TOOLSTACK_DOMID, &info);
+    if (r == 0) {
+        if (!(info.flags & XEN_DOMINF_hvm_guest) ||
+            (info.arch_config.emulation_flags & XEN_X86_EMU_USE_PIRQ))
+            return true;
+    } else {
+        LOGE(ERROR, "getdomaininfo failed ret=%d", r);
+    }
+
+    return false;
+}
+
+int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
+{
+    int pirq = -1, gsi, r;
+
+    gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
+    if (gsi < 0) {
+        return ERROR_FAIL;
+    }
+
+    r = xc_physdev_map_pirq_gsi(CTX->xch, domid, gsi, &pirq);
+    if (r < 0) {
+        LOGED(ERROR, domid, "xc_physdev_map_pirq_gsi gsi=%d ret=%d", gsi, r);
+        return ERROR_FAIL;
+    }
+
+    r = xc_domain_gsi_permission(CTX->xch, domid, gsi, XEN_DOMCTL_GSI_GRANT);
+    if (r < 0) {
+        LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d ret=%d", gsi, r);
+        return ERROR_FAIL;
+    }
+
+    return 0;
+}
+
+int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
+{
+    int pirq = -1, gsi, r;
+
+    gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
+    if (gsi < 0) {
+        return ERROR_FAIL;
+    }
+
+    /* Before unmapping, use mapping to get the already mapped pirq first */
+    r = xc_physdev_map_pirq_gsi(CTX->xch, domid, gsi, &pirq);
+    if (r < 0) {
+        LOGED(ERROR, domid, "xc_physdev_map_pirq_gsi gsi=%d ret=%d", gsi, r);
+        return ERROR_FAIL;
+    }
+
+    r = xc_physdev_unmap_pirq(CTX->xch, domid, pirq);
+    if (r < 0) {
+        LOGED(ERROR, domid, "xc_physdev_unmap_pirq gsi=%d ret=%d", gsi, r);
+        return ERROR_FAIL;
+    }
+
+    r = xc_domain_gsi_permission(CTX->xch, domid, gsi, XEN_DOMCTL_GSI_REVOKE);
+    if (r < 0) {
+        LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d ret=%d", gsi, r);
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


