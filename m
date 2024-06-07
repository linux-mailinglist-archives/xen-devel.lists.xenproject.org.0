Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6EA8FFDDF
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 10:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736385.1142490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhv-0002wX-NM; Fri, 07 Jun 2024 08:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736385.1142490; Fri, 07 Jun 2024 08:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhv-0002rV-Jm; Fri, 07 Jun 2024 08:12:19 +0000
Received: by outflank-mailman (input) for mailman id 736385;
 Fri, 07 Jun 2024 08:12:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Avvd=NJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sFUhu-0001Em-2N
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 08:12:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2414::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6aa1a0c-24a5-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 10:12:15 +0200 (CEST)
Received: from SJ0PR05CA0006.namprd05.prod.outlook.com (2603:10b6:a03:33b::11)
 by SJ2PR12MB8689.namprd12.prod.outlook.com (2603:10b6:a03:53d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 08:12:12 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:33b:cafe::bd) by SJ0PR05CA0006.outlook.office365.com
 (2603:10b6:a03:33b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.12 via Frontend
 Transport; Fri, 7 Jun 2024 08:12:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.0 via Frontend Transport; Fri, 7 Jun 2024 08:12:12 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 03:12:06 -0500
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
X-Inumbo-ID: a6aa1a0c-24a5-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ks6oLTWhdNjumqJVkJt+3cQQ/5MvirhbfRntUsLM0HK3DWHfY4ns8J9MzUnlRzhUBYpxqakKdIKCB7rhQbc1xCreBXlVqKJHxAX/UFIxOx/4TXWtBnFFHnftnkddBTVxDydkU5pZA2a+xcbpAmmTTSoHU3Juz1j2ZaOWdnQ4TOkWIxM7lSHEy6hkqSmYfVc4R4hZhuWo5LkEa8vRgP/MDqvnMSBFfAM3H+YnJkjqKW5Ut9JIHnBlrosmYszVIHA8mwBburNqNJtTOvCXRZkMg+bvT94r+S8kL5d1IZyO0pNRisq3rzgD/2M6QulS5WNTCXZOGVJ5ohoTrpSOaANW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIL2jjEjx9U91HHLhsRLBwmWlPr2GNH9RAR8j3dN22k=;
 b=aljpSylcYQ9Y3H0a3OO5FRBT7OCtqq/G6y+LybXDR9kgknFiriVbBKdGTrmdP27UEIAVVl02mgyeLTb7Jo9apcS7gYPBxcSeNsaDymHtoj54C5lF31xT6kAEBuQv/X1MgaqkHa4WMScDtDna25b21TGOI4YUv6eaj/7K+Fl4cSq6m72SbJJ2cc3JusEVV+ipmI4M508f2tH7iqCpCcwbJ4ARMALPvsXqWrfdp3u0FjIr6Bh7X5IR25ZfuK2g0ncIpcox1xkSjH6iHZFdP4c7b1fzamikZltgbu6gc3ye2Lx0eRzIDWNHt3hneO++aGSavZkebYs1Lr9MaiuDD0y1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIL2jjEjx9U91HHLhsRLBwmWlPr2GNH9RAR8j3dN22k=;
 b=BSIZLkbc5G/wuGhZ+RO3WHrmEDGIrdoIFgemmZ6IvHCC6Og+o24YpBV+ZoXz9EMmMDdgU46QWRjSecQ5AsVmjQMbFL4oPANc+LIaRT4EXTwddGjvqPxfqkJ3HzjXsqe4tVwIrcFZ9vfBM48veWH6d7px2w91Q4bixO6l+B/BcmM=
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
Subject: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to grant gsi
Date: Fri, 7 Jun 2024 16:11:27 +0800
Message-ID: <20240607081127.126593-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607081127.126593-1-Jiqian.Chen@amd.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|SJ2PR12MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd9d50d-fc0a-43ec-93c4-08dc86c988ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|7416005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JXI+JMpP0iQskjsFuRdwycAmUbZk4N1xXpD+ScvTAkww+AwqFCyW4D0fpePs?=
 =?us-ascii?Q?RAdSxM6MS2IQrqQN04VdaUElg3PheuuDMZ94BUa4f17yzh1TWRTcedoDCWbh?=
 =?us-ascii?Q?teqeB00Qi2P7fR12UHOktlpe8vV5/nx7ZOa5hJCuWVHOufwYzZfWcPpOI/W/?=
 =?us-ascii?Q?f9c3s/yIDqgphit46utufsAzwYMGd9MjT7Vf6a07SHFEJKjn/s2nO7B1ryK4?=
 =?us-ascii?Q?s/aRp5dMGJNeM9zD2ekRnWBpS9xx75VB6//RtGIjiacvJQJnjESFU8v9pjx+?=
 =?us-ascii?Q?X/33DJM8oYU+D8u1pCvmwOW/QVIMEJAxooeh0PjORwzLxy1wjqI2eQ1ZPHL0?=
 =?us-ascii?Q?yK+Z3TYBP7APsbBP5VbqL1aDz6THkvd7T+P7HGpULZqhtnwHpBiD0FF6rQEs?=
 =?us-ascii?Q?9PA9dkz7yCaCytI0aZQGMwHWf3t1U1cZQB+LKwOCZC96ibF1llt8A8LMher+?=
 =?us-ascii?Q?KR3JSB82FcPBI5+cYjSZ6HxDcZYqdqBAx+WErteqk4DNMRm9LxEVEXUUHkR/?=
 =?us-ascii?Q?9NZAaoApENyjQI/+eov6uyMMjl4cVkf/0kDz11FhYYGPmUL7V/J6BCKwNMIK?=
 =?us-ascii?Q?tIQgPdkpDs050pF9yFkxc9U9YXxlQ6DuuqmLgXt0xtJQhdivVF5Io6yPlD7I?=
 =?us-ascii?Q?4H1gb6NZBMgyLkB7rhlDk+xam0bKPzlrwSym6s/4OPNX/Kexn7Dbjamkt0e1?=
 =?us-ascii?Q?DJ1q0U9kyktcFQpnq3LPUamVmvXVNc11PUUb6dJuuIKOc0noqq71h65h65L9?=
 =?us-ascii?Q?PM3VNPKpQZA/nxfCkAQi2w46VNb+nIP+Y4N1kSq/K/TaMY6QNHmBFqgra7Zl?=
 =?us-ascii?Q?wcg82mNCGUaRZiCVJ02GVSe85FufteBAGplL7j3ROzdBJB6wsW6vAohyAXOx?=
 =?us-ascii?Q?TLioMMuHiT5Th87cPK1WQNxf/3tJl8qpM/NKK85gniCnBsQI2Yj/BCKO5+N1?=
 =?us-ascii?Q?5niP1dsmWsHSI7QYma7RXariJSFwMW6q3wwE0tI6tr4qe4JxLuZ+b2NCiVTs?=
 =?us-ascii?Q?0JCqSCM+yxFAbLA/8rGtX8qpv62Rr0oxx1lGD84++2YB/X3XIkEFBX0cybBE?=
 =?us-ascii?Q?qwU4yIZAfkQK18UJK+5TVVB2+4NLqcvCbgQrYCxDl5HU42Ofc518UqTVxjW9?=
 =?us-ascii?Q?bLb98k7EE1L3kEtVLHnmu9FGb0SId7/K7OctRphqHBYKAlekgtbfc0Hygemn?=
 =?us-ascii?Q?q4pF738sHInGxt5/QUayGWMV3iE+K4TuseqRvmi5FtUQsVOFKIJqTdgONxtn?=
 =?us-ascii?Q?LUq93Wv4r1GBP+6KP9Bx1mgMhtTMeE7CNL8PCCd3xuj4xVLQJcFhezx73DXh?=
 =?us-ascii?Q?obwaztLkylerIQNdUbNJ78roC8e2w3uekC4izuTBCNlTp0KH9IcbXZtBmL2Q?=
 =?us-ascii?Q?ZbWdEipoGGXd7eFMvbGM2VOn7y63sKousYsKv6OfI49X9J6dRA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 08:12:12.2156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd9d50d-fc0a-43ec-93c4-08dc86c988ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8689

Some type of domain don't have PIRQ, like PVH, it do not do
PHYSDEVOP_map_pirq for each gsi. When passthrough a device
to guest on PVH dom0, callstack
pci_add_dm_done->XEN_DOMCTL_irq_permission will failed at
domain_pirq_to_irq, because PVH has no mapping of gsi, pirq
and irq on Xen side.

What's more, current hypercall XEN_DOMCTL_irq_permission require
passing in pirq and grant the access of irq, it is not suitable
for dom0 that has no PIRQ flag, because passthrough a device
needs gsi and grant the corresponding irq to guest. So, add a
new hypercall to grant gsi permission when dom0 is not PV or dom0
has not PIRQ flag.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
RFC: it needs review and needs to wait for the corresponding third patch on linux kernel side to be merged.
---
 tools/include/xenctrl.h            |  5 +++
 tools/libs/ctrl/xc_domain.c        | 15 +++++++
 tools/libs/light/libxl_pci.c       | 72 +++++++++++++++++++++++-------
 xen/arch/x86/domctl.c              | 38 ++++++++++++++++
 xen/arch/x86/include/asm/io_apic.h |  2 +
 xen/arch/x86/io_apic.c             | 21 +++++++++
 xen/arch/x86/mpparse.c             |  3 +-
 xen/include/public/domctl.h        | 10 +++++
 xen/xsm/flask/hooks.c              |  1 +
 9 files changed, 149 insertions(+), 18 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index a0381f74d24b..f3feb6848e25 100644
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
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 7e44d4c3ae2b..b8ec37d8d7e3 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1412,6 +1412,37 @@ static bool pci_supp_legacy_irq(void)
 #define PCI_SBDF(seg, bus, devfn) \
             ((((uint32_t)(seg)) << 16) | (PCI_DEVID(bus, devfn)))
 
+static int pci_device_set_gsi(libxl_ctx *ctx,
+                              libxl_domid domid,
+                              libxl_device_pci *pci,
+                              bool map,
+                              int *gsi_back)
+{
+    int r, gsi, pirq;
+    uint32_t sbdf;
+
+    sbdf = PCI_SBDF(pci->domain, pci->bus, (PCI_DEVFN(pci->dev, pci->func)));
+    r = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
+    *gsi_back = r;
+    if (r < 0)
+        return r;
+
+    gsi = r;
+    pirq = r;
+    if (map)
+        r = xc_physdev_map_pirq(ctx->xch, domid, gsi, &pirq);
+    else
+        r = xc_physdev_unmap_pirq(ctx->xch, domid, pirq);
+    if (r)
+        return r;
+
+    r = xc_domain_gsi_permission(ctx->xch, domid, gsi, map);
+    if (r && errno == EOPNOTSUPP)
+        r = xc_domain_irq_permission(ctx->xch, domid, pirq, map);
+
+    return r;
+}
+
 static void pci_add_dm_done(libxl__egc *egc,
                             pci_add_state *pas,
                             int rc)
@@ -1424,10 +1455,10 @@ static void pci_add_dm_done(libxl__egc *egc,
     unsigned long long start, end, flags, size;
     int irq, i;
     int r;
-    uint32_t sbdf;
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
+    int gsi;
 
     /* Convenience aliases */
     bool starting = pas->starting;
@@ -1485,6 +1516,19 @@ static void pci_add_dm_done(libxl__egc *egc,
     fclose(f);
     if (!pci_supp_legacy_irq())
         goto out_no_irq;
+
+    r = pci_device_set_gsi(ctx, domid, pci, 1, &gsi);
+    if (gsi >= 0) {
+        if (r < 0) {
+            rc = ERROR_FAIL;
+            LOGED(ERROR, domainid,
+                  "pci_device_set_gsi gsi=%d (error=%d)", gsi, errno);
+            goto out;
+        } else {
+            goto process_permissive;
+        }
+    }
+    /* if gsi < 0, keep using irq */
     sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                                 pci->bus, pci->dev, pci->func);
     f = fopen(sysfs_path, "r");
@@ -1493,13 +1537,6 @@ static void pci_add_dm_done(libxl__egc *egc,
         goto out_no_irq;
     }
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
-        sbdf = PCI_SBDF(pci->domain, pci->bus,
-                        (PCI_DEVFN(pci->dev, pci->func)));
-        r = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
-        /* if fail, keep using irq; if success, r is gsi, use gsi */
-        if (r != -1) {
-            irq = r;
-        }
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
@@ -1519,6 +1556,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     }
     fclose(f);
 
+process_permissive:
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
         if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/permissive",
@@ -2186,10 +2224,10 @@ static void pci_remove_detached(libxl__egc *egc,
     int  irq = 0, i, stubdomid = 0;
     const char *sysfs_path;
     FILE *f;
-    uint32_t sbdf;
     uint32_t domainid = prs->domid;
     bool isstubdom;
     int r;
+    int gsi;
 
     /* Convenience aliases */
     libxl_device_pci *const pci = &prs->pci;
@@ -2245,6 +2283,15 @@ skip_bar:
     if (!pci_supp_legacy_irq())
         goto skip_legacy_irq;
 
+    r = pci_device_set_gsi(ctx, domid, pci, 0, &gsi);
+    if (gsi >= 0) {
+        if (r < 0) {
+            LOGED(ERROR, domainid,
+                  "pci_device_set_gsi gsi=%d (error=%d)", gsi, errno);
+        }
+        goto skip_legacy_irq;
+    }
+    /* if gsi < 0, keep using irq */
     sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                            pci->bus, pci->dev, pci->func);
 
@@ -2255,13 +2302,6 @@ skip_bar:
     }
 
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
-        sbdf = PCI_SBDF(pci->domain, pci->bus,
-                        (PCI_DEVFN(pci->dev, pci->func)));
-        r = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
-        /* if fail, keep using irq; if success, r is gsi, use gsi */
-        if (r != -1) {
-            irq = r;
-        }
         rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
         if (rc < 0) {
             /*
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 9a72d57333e9..c69b4566ac4f 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -36,6 +36,7 @@
 #include <asm/xstate.h>
 #include <asm/psr.h>
 #include <asm/cpu-policy.h>
+#include <asm/io_apic.h>
 
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
@@ -237,6 +238,43 @@ long arch_do_domctl(
         break;
     }
 
+    case XEN_DOMCTL_gsi_permission:
+    {
+        unsigned int gsi = domctl->u.gsi_permission.gsi;
+        int irq = gsi_2_irq(gsi);
+        bool allow = domctl->u.gsi_permission.allow_access;
+
+        /*
+         * If current domain is PV or it has PIRQ flag, it has a mapping
+         * of gsi, pirq and irq, so it should use XEN_DOMCTL_irq_permission
+         * to grant irq permission.
+         */
+        if ( is_pv_domain(current->domain) || has_pirq(current->domain) )
+        {
+            ret = -EOPNOTSUPP;
+            break;
+        }
+
+        if ( gsi >= nr_irqs_gsi || irq < 0 )
+        {
+            ret = -EINVAL;
+            break;
+        }
+
+        if ( !irq_access_permitted(current->domain, irq) ||
+             xsm_irq_permission(XSM_HOOK, d, irq, allow) )
+        {
+            ret = -EPERM;
+            break;
+        }
+
+        if ( allow )
+            ret = irq_permit_access(d, irq);
+        else
+            ret = irq_deny_access(d, irq);
+        break;
+    }
+
     case XEN_DOMCTL_getpageframeinfo3:
     {
         unsigned int num = domctl->u.getpageframeinfo3.num;
diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index 78268ea8f666..7e86d8337758 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -213,5 +213,7 @@ unsigned highest_gsi(void);
 
 int ioapic_guest_read( unsigned long physbase, unsigned int reg, u32 *pval);
 int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val);
+int mp_find_ioapic(int gsi);
+int gsi_2_irq(int gsi);
 
 #endif
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index b48a64246548..d03bcdef4d19 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -955,6 +955,27 @@ static int pin_2_irq(int idx, int apic, int pin)
     return irq;
 }
 
+int gsi_2_irq(int gsi)
+{
+    int entry, ioapic, pin;
+
+    ioapic = mp_find_ioapic(gsi);
+    if ( ioapic < 0 )
+        return -1;
+
+    pin = gsi - io_apic_gsi_base(ioapic);
+
+    entry = find_irq_entry(ioapic, pin, mp_INT);
+    /*
+     * If there is no override mapping for irq and gsi in mp_irqs,
+     * then the default identity mapping applies.
+     */
+    if ( entry < 0 )
+        return gsi;
+
+    return pin_2_irq(entry, ioapic, pin);
+}
+
 static inline int IO_APIC_irq_trigger(int irq)
 {
     int apic, idx, pin;
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index d8ccab2449c6..c95da0de5770 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -841,8 +841,7 @@ static struct mp_ioapic_routing {
 } mp_ioapic_routing[MAX_IO_APICS];
 
 
-static int mp_find_ioapic (
-	int			gsi)
+int mp_find_ioapic(int gsi)
 {
 	unsigned int		i;
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 2a49fe46ce25..f933af8722f4 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -465,6 +465,14 @@ struct xen_domctl_irq_permission {
 };
 
 
+/* XEN_DOMCTL_gsi_permission */
+struct xen_domctl_gsi_permission {
+    uint32_t gsi;
+    uint8_t allow_access;    /* flag to specify enable/disable of x86 gsi access */
+    uint8_t pad[3];
+};
+
+
 /* XEN_DOMCTL_iomem_permission */
 struct xen_domctl_iomem_permission {
     uint64_aligned_t first_mfn;/* first page (physical page number) in range */
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
index 5e88c71b8e22..a5b134c91101 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -685,6 +685,7 @@ static int cf_check flask_domctl(struct domain *d, int cmd)
     case XEN_DOMCTL_shadow_op:
     case XEN_DOMCTL_ioport_permission:
     case XEN_DOMCTL_ioport_mapping:
+    case XEN_DOMCTL_gsi_permission:
 #endif
 #ifdef CONFIG_HAS_PASSTHROUGH
     /*
-- 
2.34.1


