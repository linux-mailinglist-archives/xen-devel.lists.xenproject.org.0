Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8549969499
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788647.1198121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNbD-0004IK-D7; Tue, 03 Sep 2024 07:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788647.1198121; Tue, 03 Sep 2024 07:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNbD-0004EL-7A; Tue, 03 Sep 2024 07:05:11 +0000
Received: by outflank-mailman (input) for mailman id 788647;
 Tue, 03 Sep 2024 07:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqql=QB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1slNbB-0003uZ-Nf
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:05:09 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2407::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da0440a4-69c2-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 09:05:08 +0200 (CEST)
Received: from CH0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:610:b3::32)
 by DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 07:05:02 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::81) by CH0PR03CA0057.outlook.office365.com
 (2603:10b6:610:b3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 07:05:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 07:05:02 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 02:04:57 -0500
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
X-Inumbo-ID: da0440a4-69c2-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1j+O6ZDEhOMFVP+8ObHEbaIlE2ORQjdo/WToy+xalLBQt3NJMTZWRT/WjpUellANqFSrGcgPh8TsNz2U4CQh6hhL5AD+gbIeIJFgJkEzfznbLk96McbrybccZxgKQQe3BvsfORazCx7HayCs/7Six12Hs1hycUxTNarA72nX8gTS66efEge9fAneMA1waGELl+ZL2yxG9VybYtAjEvArj+DuvvcwAy71IigtQOwR7IXjzCUyVMppIV0uwWEAbxSAAhDJIwJcpLgzNvS8t0ra1H9S1flW63L/nR1n+651/i/XIsT95IPItiX4BlErIjrOFD1x9qdBJC8cfBlanrrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uN6uinjkD++lJwGhkWPicpaIqnb2rcz/HMu9Gws23TY=;
 b=DlqwA61fyvUcvW0EOFa2Z1Xj5zf/+42x9s+1TohWX6E4Q9ngK6eS0+cFYmhLRxFF1BRNMyZ7/gI7cGgnN/K7/ApI6JoIIS9V6rO4+7ZdGxHAzkOkcXE/0JMEhhqZ5BfLC5DljahdWIQMDgBL9ZL8xd7woj4STXi//ZNaixU9y2g+hPAanQsSX0sV+bwLfnw0f0TsW8qcr6yhK/BYB78WYJzdBxiYqEwXpe6iETWwbBzcnAUq/qZEKIfw5iIxTokn4NaxFJpOR61oizw04DIa59m2tPZNXssIUO9f7rbFFr2WsuIY8OLPzDd07evv+Q17yuKnix55jGEsHONDgtUTpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uN6uinjkD++lJwGhkWPicpaIqnb2rcz/HMu9Gws23TY=;
 b=OUO9jC3npZMZketbAQUanIefggt7AYDyBv0LRNIq5IFlTfHpgItlXqkspZbDTr6WReqh8IOB9xEjjBuxNmueIgThWSrWU0kdhBRrAGVoGE7wjuvJjbZBezQeSL0Ywd/jYg2V1YIkSEbhXoNwrlDbyIrO4mIBgId/O2mKetNMip8=
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
Subject: [RFC XEN PATCH v14 5/5] tools: Add new function to do PIRQ (un)map on PVH dom0
Date: Tue, 3 Sep 2024 15:04:24 +0800
Message-ID: <20240903070424.982218-6-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: cab03c9f-bab6-4ac6-a668-08dccbe6bb61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1qRkFU8+p9gpAjPsGpd/i4snnR5Y0W2Qpp0uZUN+7qHzqwpjWWxsDiPt0xST?=
 =?us-ascii?Q?e3Xu7aCGFB8lCbomPCq9GD2094pPd1JxA0U+ZE0h/CxknDwmD9DvvF5ay1R5?=
 =?us-ascii?Q?jnpk+tD/DGHvIypJg6szZStaOIrFDaK8BF+BzM63tYvzY/KbgksuShnp7zB2?=
 =?us-ascii?Q?cVCISbmDbjAFzFqHySkN4RBh8tn+j9UL3WnkBVV67IEjcLdeCHblm+I1C7gB?=
 =?us-ascii?Q?zLfoLkASdZQG6KUE9+UeTBZMpH5tBBfTbZ+egq9V6ls15UCELiRyv/QqgGVa?=
 =?us-ascii?Q?rPEmGJXbHbFQr6RcJZYA3ORF8zgCFKjuXm7sPdRQztUeyo25cmdsNHHyQ5M5?=
 =?us-ascii?Q?zfJOiEl5/kcf3SAuR+hagLxGGYcc3h3g3qNCsJfYZvw9TlmJtWmJ1Q1KXMcM?=
 =?us-ascii?Q?TbvA5V3ZvY0g3uEU1C83Q1frm6h+pOydNLnK9DRrKWPmppka58+5xIETfAtE?=
 =?us-ascii?Q?kQYG7okA0xVPsAAR5vhahH7vhH6WCe+28nMc968j7TkcqGgsNimTmyYOen29?=
 =?us-ascii?Q?WVslngGGU439BryTx8XDCXOJxYXUH3eYEd8HJd/UbOgSFKebldK4hcDTpFzc?=
 =?us-ascii?Q?A/GjiC32P9ljboiZxFtaAsa2Dcbt39if+eI4SSorLlH/cp//xqcTNIa/7cSe?=
 =?us-ascii?Q?Qr/fdohfPDFYgyPHYT5RJseUfNCGg873h9pLiO7nLIth/ssu6TBgVvRyTqFT?=
 =?us-ascii?Q?mwvOyRQDu1J1ISQcIkGHSJoSWqaelmgO9goibbB38BlKsHT3dEYL8p4kolO8?=
 =?us-ascii?Q?EMmHjO53NquhFpfbiKJEG5TaWKBcz4ZBh/bO6Dj9d2sL2uNfcQA62VtXWw3W?=
 =?us-ascii?Q?wmAlGMRIlGQJZfBdqLK2IoQkHmeNs6AsOEkePXTvNs3XJq5ihXB/htWaI8U2?=
 =?us-ascii?Q?e+dX0vdx8TxO+T7eDsGQ5zrhEoBfeOnONg/vtx3DBgBuDeccXyA0C5hURAr3?=
 =?us-ascii?Q?mt8TKQiAT6tHbRhFRsVIiohNdob6w1zRdB28keHInaRoPoj7T7fmUXOK9I4L?=
 =?us-ascii?Q?9SPqF+F9Lz5+peBeGhZDpUsW2qLxG179jV4dt/pXLQLwSpVAr5w/zHTrAdk1?=
 =?us-ascii?Q?8oniwWsuMQRLAsH9wyrq2lks8D0q0dv+aPRuKrbnC0QJ7wNV/9NXSN9Rx7S+?=
 =?us-ascii?Q?mw25+vv4Oam0IazBKu6t7/K87ty3jTfEcSxlRLgJH6AIXwBpY//DH9gggUK9?=
 =?us-ascii?Q?06Y4muTUaopXbKGid6ke54VsGaUG2HlD2AV5OkrgOpla4jY3OaMl1ZpSRKG2?=
 =?us-ascii?Q?Q/NAEkTV4vSR3L4mapfRrN5sgnv+BuBpCDWhG9ORXIgeiitnAUxiC12A0M/c?=
 =?us-ascii?Q?RFsSU8DRYogXjnZk402OE/cbG+eouMMF8sO9qsGTmVEI6thEPgJCCnHlnU71?=
 =?us-ascii?Q?GoNSVnxr4nWYq2EU3uIXg4lrJyQiISFgGEIYwpZE4QTfPNjkR/LgCiCI6l0/?=
 =?us-ascii?Q?7sirevwWSyND2NTnMswDJfAG4FbT/DeT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:05:02.3454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab03c9f-bab6-4ac6-a668-08dccbe6bb61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813

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
v13->v14 changes:
No.

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


