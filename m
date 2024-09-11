Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FCB974AF7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 09:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796236.1205746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHRY-00053x-WB; Wed, 11 Sep 2024 07:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796236.1205746; Wed, 11 Sep 2024 07:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHRY-00051x-SY; Wed, 11 Sep 2024 07:07:12 +0000
Received: by outflank-mailman (input) for mailman id 796236;
 Wed, 11 Sep 2024 07:07:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZHC4=QJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1soHRY-00051p-3B
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 07:07:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [2a01:111:f403:2415::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72f0657e-700c-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 09:07:05 +0200 (CEST)
Received: from BN9PR03CA0673.namprd03.prod.outlook.com (2603:10b6:408:10e::18)
 by SA3PR12MB7999.namprd12.prod.outlook.com (2603:10b6:806:312::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Wed, 11 Sep
 2024 07:07:01 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::c) by BN9PR03CA0673.outlook.office365.com
 (2603:10b6:408:10e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Wed, 11 Sep 2024 07:07:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 07:07:00 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 02:05:24 -0500
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
X-Inumbo-ID: 72f0657e-700c-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxuBxtDdHqIUMf33tEFiTk0+nVCBLZgCJ7qxfXzwK2d52Ef07bR2piyOiEh2jtQMLsC29CzYqZ0mKryeLTHGy4QIilW4gf8z7FhQVUIMktmlWnmmbn+BfSSpFf03kC/itGcymsuASPsgrKLYSPckCk1p4mJUtXvPxX0403nUy4b5j/kNl/HOEeVt7+iMGvPCg57boK1nXByhrvTTcTKfbYygZYCaQVsOf29Lou8AU3LxUXiT3JLunktN84qbgiCqTKBuqzIN0eJ4ss0ze75JPlq3fb9O4DnLhwf9MG9bWWe2E6ngW3Je3sEiNay1o/xJfHzd6rllR3Na/sdlMMQhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmpEfaaszLwTmRPaX4XY423m4TaFT5DpgGmosa5jtDk=;
 b=kn3AEixnX8+Z8PoVSezIBbDhKq97RZ0Fff5+bbJN/hW/hGgrEcMLFT+d+A3z5/m6l4rmuLfvXEjqU0bsiAS8sDA0NsaMUpbKOgoD35JK35cJZZRhR712iLXz0KB3YphE/FUASsQP3+wRvAUXnTnrqfios3jmFJYJJQn7G6lqiwNlSKkakkRX51AY4W9iJshZ5C5WyXAU7ZhopJIm3d19UXwe5YGbjmM/lpwU1AXJVdQp9fo5yGyAzr8NyLtdHAGOG0g/UEaPuUQ5kB34/mzNUTGg3YTAvrqHUr4RnaR97mSHqEqj3ajdepRqqWwRQJcbTe3sNJa8Yva694LM7cmt4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmpEfaaszLwTmRPaX4XY423m4TaFT5DpgGmosa5jtDk=;
 b=fc/CUt7o2RTrDSHEXuZYGQfIcEVEY7EfgK6vFZNFw68+my1D0fvVNZzZ6dkhvQlRGdWxEmfuvI8UTPXUSeqenjtdhwFtMHN2igcwA2qcWbEEFFNGYlj3voUuaJDKeVQvwcuk1SyJoHYWZQUYk5EMSxnLRhWYXgR4BS83gioIUJI=
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
Subject: [RFC XEN PATCH v15 4/4] tools: Add new function to do PIRQ (un)map on PVH dom0
Date: Wed, 11 Sep 2024 14:58:32 +0800
Message-ID: <20240911065832.1591273-5-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|SA3PR12MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: a1214b58-9faa-430a-9050-08dcd230552f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QWSdz/kvcqrpaSmMO4u3KagfGt7udNgC/ce4JCMYRrJAlykw0CdHUbz1jcdh?=
 =?us-ascii?Q?wBKxI2Rj9FbI6zBfiBITyMsRUoFrtnHheqoslGuEV5mVVOwpJ+v/BhsNweBQ?=
 =?us-ascii?Q?ioSzTmhlomzwPUG2rZ6GOpAyQQNonhOPDVff5Rqx9/PrOnGD8SZp7O2DksAP?=
 =?us-ascii?Q?hRojPuWgUVaWNrsiGffOFwQE2D+7EG82CUVeU8a4bJJgmtZMERcvGxhvbbvE?=
 =?us-ascii?Q?YUPnWFyusJ3irKMKiVIKS5O4x/eIIli4MTWuHj7zaevQ7Alw1A/dgMZ/asf3?=
 =?us-ascii?Q?XWljM/LyeXyQVEfsq9kKypLvc9HD62Hjnmj068HSMzDRLUlp/2HVWDbVFRti?=
 =?us-ascii?Q?ggkkSt4AJVCvh7bFmnE7r7jcrot5sf89ReqbUxBvwoSd4pS9i87DPgONRsh0?=
 =?us-ascii?Q?ETmCZu4+Q9EDo+qPbxUrsx5Aop6/zUYE5q0AhoBqNOgkcFoVEg0EsKhHsKGw?=
 =?us-ascii?Q?0hotZxOF5krJNl9EJy6nWVp0HCRm0cR/fm/ypSLzAujFSTLN6G1jPMCQH0fP?=
 =?us-ascii?Q?KLPF6cSSyOH/4gM7VvPEbt5EiCNL3ldIUBxfToChgdf7BXYIwlTilCMzB9ww?=
 =?us-ascii?Q?6hynOTgcLXbYUDG+vqOFqo943Z5nSpEK4S73dLYs2gYEVm5YgMkdgIAOt9hL?=
 =?us-ascii?Q?qggsKxFmHSLarbp6coGPAQBoYpm6WeSb20aqiHTJkdGefZ1UmcEIoetKydDZ?=
 =?us-ascii?Q?qLTzHxtni+5E+Dst6zJgM386f8UsnVmFal2l8fRODtgIPxyI5/lZLUr9eesh?=
 =?us-ascii?Q?cfqRThCiZ8Osxerp1qdwd5QaA2dykHmExmIChKBgmHH2L2V3zdKuHXMjG578?=
 =?us-ascii?Q?MQbn+OTMlo7HaVnM2uJNrHJygZgCsM3kVXSfu0UIx2Sy+50vxhbIIi6EH1/P?=
 =?us-ascii?Q?oCQX9l9fZGpUZWHgTg1g5JtHK6KHRcETHtyAoZPWuC3TcjkWfSyo0G8aYraE?=
 =?us-ascii?Q?iZN0LgKinvvH4NpEoIL55lqDZdN9Z9Fbim3T/oi5YRIJNfordfubQrT6MyaJ?=
 =?us-ascii?Q?K+zbX6EmQKU08bKv4GqazBbk8V8FI2vZMq8I2CiTC3SU2MmpqQ4V/VuIcSJL?=
 =?us-ascii?Q?+JDnNJ9tP4G2UbyzPQ/YOTNPG/MSwfjtT2khBgmDAJ5GH2ehEp9i7ImYV84L?=
 =?us-ascii?Q?OffDk2er/7OuQ8k+ozuFCyTuvz9zO4P8fSSNunOhxSvA+wZMdKKjAtP9NQpS?=
 =?us-ascii?Q?8mBNU3F3lJ0LpdyAp28Kgq9Rnt7CBxNEEvGYBmSiECSRgmM1SxjUpBGJID2k?=
 =?us-ascii?Q?nAG7sI8ncFCCQZ7BtWqyCG5Of8pmWiFe7Lac/UkYaoPcy5OibZ8/ibOiG9OU?=
 =?us-ascii?Q?IO4mwB4S1yFjyiSVE1J0C5yfL/voNtpg+/XP65DHYSmRgfoSaZ60DPF+Yq/e?=
 =?us-ascii?Q?iuSa5Cj1nko7FUCeOEhfzDjcwzj/Vpn9a2Mo+3+hDUjpaHvIdJnut0IUye76?=
 =?us-ascii?Q?oIGX/rcNKraX5cYIItKohIOUwfsmVvrI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 07:07:00.8430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1214b58-9faa-430a-9050-08dcd230552f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7999

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
---
RFC: it needs to wait for the corresponding third patch on linux kernel side to be merged.
https://lore.kernel.org/xen-devel/20240607075109.126277-4-Jiqian.Chen@amd.com/
---
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


