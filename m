Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6614989990
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 05:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806961.1218125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sv7KO-0005A3-Ed; Mon, 30 Sep 2024 03:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806961.1218125; Mon, 30 Sep 2024 03:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sv7KO-00057A-Aw; Mon, 30 Sep 2024 03:44:04 +0000
Received: by outflank-mailman (input) for mailman id 806961;
 Mon, 30 Sep 2024 03:44:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYXA=Q4=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sv7KM-0004MV-F2
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 03:44:02 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2415::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39fd9da1-7ede-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 05:44:00 +0200 (CEST)
Received: from BN9PR03CA0862.namprd03.prod.outlook.com (2603:10b6:408:13d::27)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 03:43:52 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::58) by BN9PR03CA0862.outlook.office365.com
 (2603:10b6:408:13d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26 via Frontend
 Transport; Mon, 30 Sep 2024 03:43:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Mon, 30 Sep 2024 03:43:51 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 29 Sep
 2024 22:43:48 -0500
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
X-Inumbo-ID: 39fd9da1-7ede-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtYd+vED7dHBsaN+u7u5R/nTt2BZwfi4Nzk0i2L+ApKDCKuRKteuQ90w4e/LlnLTJtwHxczSBE0FsZ1cm3iMr1zzdzrYBsR87HG8CbcgMwmquDtRV35McNnL6hLmeUFAdKmggy7gyA2yMRJPzQzdEfOL+Q3/yfSnxv9pMNbHWu7awUW8TiNdFFR+JXiMfCbPcrHYBiBmv9zFZQChhPY0Btm59uGgRKWaoxhMOCWt9UnlcVWwpZ8FkrJCrKSLsHSUGZdpIg2yLq/RrhpzRsiYwGQ7HKoSEk7h+Qmf2BoTjxq8/hMV4bTggZtf/F1z3apGTNQlPECK1fwHl3AqtFhvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLF41WJtSVPF+fX/Xak9jnw8Lh+HUu0aQgL/Ovafjck=;
 b=JzoJ0AyeOwSdsSuqb08XqZ+I5R/SfHKMrC2OHxfHyEpAg/UBfmBVUGa1z2qdC9UlOtbSPSR+dHQ5B8WpLjTXaeVcn/aUIZCj2Y6+GciNe5fxtEni2HHB/8b9+f/29MVHyQuigusRx8QjKjBLaPoCOiY2B+Xy8YfnF5ZEyMPqRlCHVzpiiaVGsB7S5h2yGMVhaY9KMP+Yl/+V4MT43Q3N18tlGvHLsU39JXmeMW06tLcOhPA/5Gvq26V6z9EnXG3DJDTEpduuiBWfaTs55N5U12Xz+xB6wGVp3D4cfB4Kf/2/LEapG7qxMRQ4+dLUn7S2F9/y/kDSdx04fGVVq1JpwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLF41WJtSVPF+fX/Xak9jnw8Lh+HUu0aQgL/Ovafjck=;
 b=VPAnisSGwalCE3zjPN/W9fgZLvgzkCWQhiPX1IESioBdRLS9fO1H6+vzEiY1uENPDU/st+TepkOF0ckEBSBnudUb+ZsgxSzOidreb1wcdZeqrBzrxjoh5J6rPvwLZAfu5d+xmQc5et0Nzd/H6lNUB5y7AXfbhgjpnXdVKZIFBD8=
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
	Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>
Subject: [XEN PATCH v16 3/3] tools: Add new function to do PIRQ (un)map on PVH dom0
Date: Mon, 30 Sep 2024 11:42:50 +0800
Message-ID: <20240930034250.2682265-4-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: 309c01ad-f11e-4232-0040-08dce10219bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DXarSAUFHUDJ2dzVG0sFDK7CmgweGhxCbXjnq8dKVFXJrLIYDdoIwt/WBr95?=
 =?us-ascii?Q?WSiu76o0lw912S+D9hPXer9i3dRQ0+23NtOkh33doyjfSBwdoZkyU/s4Cn2B?=
 =?us-ascii?Q?wcL+K/YUmfC6kTY+GHjRbQEzDJAWJ68AZzUpkdTi8mYSSIls03aN3dxcRjYi?=
 =?us-ascii?Q?cQDY0mT2jqt2iY/qy0u7MPReqwaX1QcA8ioMv/yiuVeRF8LGbphEKlQrJZ5A?=
 =?us-ascii?Q?oaCkttDb/QnLv/bEOVUfH8bAq2ZR+4HR7aX+kvxoOd6wUi2EJK9NM7efhjiV?=
 =?us-ascii?Q?M/T77fX9Z7dwWDKpMmggQaLRRPP+IVuSvW+G3ph1+G5AJSeI5BBtX+TKAtD3?=
 =?us-ascii?Q?HGHK9DXhv3VPeD2Sqw+t/0bBcOOqZsHQKsV2H+jdB0L8gUJbldlR4S+ziFaD?=
 =?us-ascii?Q?hwh/oH+GqnFOmCOJUaNUjiqk53iIVHZ+l2f2hI4bBoNFEmaNCRbsvdGI+sMN?=
 =?us-ascii?Q?ftifnu0I2HXRpamw1nQV9KSbmeehUI4szK3WDKKrsu2SV8u7Q2n9SHteCX3Q?=
 =?us-ascii?Q?ZWCWq2XxDHLH/gPppd8K9XIz+YK3d7SQtWioL6KkjstWqjllQYtcnE4avK1i?=
 =?us-ascii?Q?Kzy+whQGKJHi+sxaMqN9zvUX08wY63jrBSsNXgcl+SlggjaQkBvZP3KM2mpf?=
 =?us-ascii?Q?13U/W5xG7bsmRV1S6PbprYdW8GLIwMImOkAB/c6TM8bzsmM9uRpWX/l+NMAT?=
 =?us-ascii?Q?r/5pfuS+g81i3Gbgly4DVhZFNXIh0VB9xBy77mO2bOZUM05f2a2qhQkXHxKU?=
 =?us-ascii?Q?B68cDax+gG2K6BbKpmLABqhUZLOCXOfXUeHp6YsMGq4M2HGAgz4sN7bOaDS3?=
 =?us-ascii?Q?mO0Ho+kHgaufETw88650FbsbfGBd3zIpnl8Q2/d9bBF3SLI+NK196N9VOHx6?=
 =?us-ascii?Q?Gwu2wmZj2kWbFpicFCvKX4I2MC4biun2lWuvC/Pkz2hzU95l1ZjIvpChSaBo?=
 =?us-ascii?Q?8kf06a6m3gxtJBcsc4+9eN2V9LGwAQemAocS9klDOLiVv4tkI7mtCBSeJ59+?=
 =?us-ascii?Q?QzL2WzZeE7fcCeOK+lEOGGVU6S/TyItw0loexnA5bY04UquJNivsZUGQFvio?=
 =?us-ascii?Q?OdJ8MKnmX7CityQ5wJCcPcG05Sqw0eCX4awHZ5tJk+is7t6h+DOlsQR0a6Q9?=
 =?us-ascii?Q?i977Hs4xypfMwIIWRu+VC7bgvtBtPMmOq04J8O9QOfVHTHzAceEHBKIFLCmV?=
 =?us-ascii?Q?q7oJvIuizqpoTuqf65vknJZT8u6ppb38x0NOQN3eS1u/YJwCrI85O3W2wAq3?=
 =?us-ascii?Q?sY4fdh2ab83mTFK6FyfMSn51Qdz3qgffwGtkljbuwFimlARTBI5945T9ledS?=
 =?us-ascii?Q?o7wbqqAD+du3xe7lIkmczM1sJu7Ir2to68rBOOn+pMyvgHmTeUu9NnoKibry?=
 =?us-ascii?Q?518YV4IlfCDNYpo1fB7THRav1ev5gXLfh/NwPAN8LA35XNfq8o0+E3Bu9A73?=
 =?us-ascii?Q?xu0/26qyyLg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 03:43:51.7078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 309c01ad-f11e-4232-0040-08dce10219bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272

When dom0 is PVH, and passthrough a device to dumU, xl will
use the gsi number of device to do a pirq mapping, see
pci_add_dm_done->xc_physdev_map_pirq, but the gsi number is
got from file /sys/bus/pci/devices/<sbdf>/irq, that confuses
irq and gsi, they are in different space and are not equal,
so it will fail when mapping.
To solve this issue, to get the real gsi and add a new function
xc_physdev_map_pirq_gsi to get a free pirq for gsi.
Note: why not use current function xc_physdev_map_pirq, because
it doesn't support to allocate a free pirq, what's more, to
prevent changing it and affecting its callers, so add
xc_physdev_map_pirq_gsi.

Besides, PVH dom0 doesn't have PIRQs flag, it doesn't do
PHYSDEVOP_map_pirq for each gsi. So grant function callstack
pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
domain_pirq_to_irq. And old hypercall XEN_DOMCTL_irq_permission
requires passing in pirq, it is not suitable for PVH dom0 that
doesn't have PIRQs to grant irq permission.
To solve this issue, use the another hypercall
XEN_DOMCTL_gsi_permission to grant the permission of irq(
translate from gsi) to dumU when dom0 has no PIRQs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
v15->v16 changes:
Added Reviewed-by of Anthony PERARD.
And the dependent patches on kernel side were merged, so removed the RFC tag of this patch.

v13->v15 changes:
Change the initialization way of "struct physdev_map_pirq map" in function xc_physdev_map_pirq_gsi to be definition and set value directly.
Change code from "rc = libxl__arch_local_domain_has_pirq_notion(gc); if (!rc) {}" to "if (libxl__arch_local_domain_has_pirq_notion(gc) == false) {}"
Modified some log prints codes.

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
 tools/include/xenctrl.h       |  10 ++++
 tools/libs/ctrl/xc_domain.c   |  15 +++++
 tools/libs/ctrl/xc_physdev.c  |  27 +++++++++
 tools/libs/light/libxl_arch.h |   6 ++
 tools/libs/light/libxl_arm.c  |  15 +++++
 tools/libs/light/libxl_pci.c  | 110 ++++++++++++++++++++--------------
 tools/libs/light/libxl_x86.c  |  72 ++++++++++++++++++++++
 7 files changed, 210 insertions(+), 45 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 924f9a35f790..29617585c535 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1383,6 +1383,11 @@ int xc_domain_irq_permission(xc_interface *xch,
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
@@ -1638,6 +1643,11 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
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
index 460a8e779ce8..25e686d7b389 100644
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
+    struct physdev_map_pirq map = {
+        .domid = domid,
+        .type = MAP_PIRQ_TYPE_GSI,
+        .index = gsi,
+    };
+
+    if ( !pirq )
+    {
+        errno = EINVAL;
+        return -1;
+    }
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
index 96cb4da0794e..8ef6a7b5fe3a 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -17,6 +17,7 @@
 #include "libxl_osdeps.h" /* must come before any other headers */
 
 #include "libxl_internal.h"
+#include "libxl_arch.h"
 
 #define PCI_BDF                "%04x:%02x:%02x.%01x"
 #define PCI_BDF_SHORT          "%02x:%02x.%01x"
@@ -1478,32 +1479,42 @@ static void pci_add_dm_done(libxl__egc *egc,
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
+    if (libxl__arch_local_domain_has_pirq_notion(gc) == false) {
+        rc = libxl__arch_hvm_map_gsi(gc, pci_encode_bdf(pci), domid);
+        if (rc) {
+            LOGD(ERROR, domainid, "libxl__arch_hvm_map_gsi failed");
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
@@ -2229,33 +2240,42 @@ skip_bar:
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
+    if (libxl__arch_local_domain_has_pirq_notion(gc) == false) {
+        rc = libxl__arch_hvm_unmap_gsi(gc, pci_encode_bdf(pci), domid);
+        if (rc) {
+            LOGD(ERROR, domid, "libxl__arch_hvm_unmap_gsi failed");
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
+                 * QEMU may have already unmapped the IRQ. So the error
+                 * may be spurious. For now, still print an error message as
+                 * it is not easy to distinguished between valid and
+                 * spurious error.
+                 */
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
index 60643d6f5376..a3164a3077fe 100644
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
+        LOGED(ERROR, domid, "xc_physdev_map_pirq_gsi gsi=%d", gsi);
+        return ERROR_FAIL;
+    }
+
+    r = xc_domain_gsi_permission(CTX->xch, domid, gsi, XEN_DOMCTL_GSI_GRANT);
+    if (r < 0) {
+        LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d", gsi);
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
+        LOGED(ERROR, domid, "xc_physdev_map_pirq_gsi gsi=%d", gsi);
+        return ERROR_FAIL;
+    }
+
+    r = xc_physdev_unmap_pirq(CTX->xch, domid, pirq);
+    if (r < 0) {
+        LOGED(ERROR, domid, "xc_physdev_unmap_pirq gsi=%d", gsi);
+        return ERROR_FAIL;
+    }
+
+    r = xc_domain_gsi_permission(CTX->xch, domid, gsi, XEN_DOMCTL_GSI_REVOKE);
+    if (r < 0) {
+        LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d", gsi);
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


