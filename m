Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555228C7430
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722964.1127432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xng-0000gR-01; Thu, 16 May 2024 09:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722964.1127432; Thu, 16 May 2024 09:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xnf-0000dT-Ru; Thu, 16 May 2024 09:53:23 +0000
Received: by outflank-mailman (input) for mailman id 722964;
 Thu, 16 May 2024 09:53:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hz7T=MT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7Xne-0007bz-3w
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:53:22 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fa43e0b-136a-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 11:53:20 +0200 (CEST)
Received: from PH0PR07CA0076.namprd07.prod.outlook.com (2603:10b6:510:f::21)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 09:53:14 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::54) by PH0PR07CA0076.outlook.office365.com
 (2603:10b6:510:f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30 via Frontend
 Transport; Thu, 16 May 2024 09:53:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 09:53:13 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 04:53:09 -0500
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
X-Inumbo-ID: 1fa43e0b-136a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=en+yW7As1fcorNDSSKNdqp/lo4/ntiAwgEZsAEfxu0oUpnPGcGuk3Id5RiUJzn7deIGBXY/HTE+qGwWk360k8s4sawPgUgTtpaHnkwjaXp/jH13smz72YSrH6VwZWlHAEkW0qB0PJh0ugH2LTP+OoR2xzqkPVi5sB2yX9O68x3lRDerAYDBl5ULvZGexurbgFh0BXKJdD1BtWkb0GA64nRwoFh2tTU1T39AF3xePURCyPlQ9yf5Qi9uNitfZVCO2dkMLcKktXc/+GslO2xNP4JQGu3LBNtuaOeG16VJjSli7th3zVGFed2bbpy7gowTVJl1pDdQozr1CQeYC5cV0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PVXKQu58hDwgfbrYDE/kcfnEXNdd+32q921wt8QLfU=;
 b=lHkeH8k6mbKH92U2607Xz0G2Hjm42ShQQYelsYxbjn6wCRdReEaLGMApvNtyIKo/jISMHhEtdkNOnoGrEBeEkkv/C/SaO+umcwtawEas/ssS/a9H0yWqpQL7xF26yxLcXWU4KDlzkA1d4bIS61Me3VKtUk9EkfR/rykS+sBUWwaJwWNYS4dOxxv1auaJPpWYPwcRCK7wozrY26oOev5TpXVSEUVP3TrzVTOu/B1xky3DmwnBqBjCqr1rq3PfJWwInCPQivIX4+zOQEt9hDyEWSi1MexxwvLf628As2tKU+u9FxQpK4fVzS1WMl/IIhhvUackp4A65IXP4KLhs3vbDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PVXKQu58hDwgfbrYDE/kcfnEXNdd+32q921wt8QLfU=;
 b=ZaHjO+b19cD9IVru6l5lmSlLGZJ6CY/Gt/u/86G7RLUdttvyIN7pZrdKo4VMrbltn12lRAs2s3u8Hd6q1+QAqg0MkCALMXVKRS7/qy74Tms3yecnUTI+BtrkguMUArhLKMBKql2NjlgqjZltzokQHA1wT2ovTadqkYbf0MQmgGM=
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
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Anthony
 PERARD" <anthony.perard@cloud.com>, Juergen Gross <jgross@suse.com>, "Daniel
 P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to grant gsi
Date: Thu, 16 May 2024 17:52:35 +0800
Message-ID: <20240516095235.64128-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516095235.64128-1-Jiqian.Chen@amd.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1f936c-5b6c-4433-bbde-08dc758e00dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|7416005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PTOxP3HXRO/oXx3ZfDWkb+W12ioUwyLKMwH2Su8T48UTKyDOU7IeoDOmesBZ?=
 =?us-ascii?Q?nAqZzMLWEx8SkewNpInH5oQhZqPyA3b/mm3LJih/oxWY1B3jHQSIqdlUIZ2p?=
 =?us-ascii?Q?kBZfZ7+doHTtlMeKCqx3i365RjD1Po0qc/6aEd6UhwPhHeVMjHY7F3U6i1Iy?=
 =?us-ascii?Q?L+XB1PDkuwZgCaeZf3EED5DLDH+aw/xf0mC5iZEcl1cHAXrd68rRFjZ6JkX8?=
 =?us-ascii?Q?wj3XZpWrx5Pw7P52RwerxWWP4z9p/v3ZsXwVfMdeTf6qZ8mndSF3lusvXAHa?=
 =?us-ascii?Q?REQiqNw8DuWIZWp3XgaKMekxYp717N2XIX2QGWkcyl3vcLzK1d7050JH5MwX?=
 =?us-ascii?Q?F+HX+Q0vwc55bDKFvwOR0N8hQcvmKizM8GT8yfui24e7j3nlaSYFl3hxeVUy?=
 =?us-ascii?Q?qq/hA17aFCMk/HA7ux9SSNqv9nV4TAbKeb/PR19PucSaMk8UEL4VBrxM10Y1?=
 =?us-ascii?Q?ncKzdu4Oaq51Q9jhgQyv1G/YgoDMxpiS1ICnFiR8eADetaGpA3M4u0FuG/Lx?=
 =?us-ascii?Q?p3bOVDQPix7XrAIHkZ+y74AEYOCvaDbzqd3TYu14L1xH95VkrnzQBwWO6Nxs?=
 =?us-ascii?Q?6PofegC99j25FoX74FsDTMDxcgZbNsKl9fPPCZcxq8wFlA4fDH5h5MP//hwQ?=
 =?us-ascii?Q?yz41K4+hkstjaLU0DQtZWyPHz7utsP6tQx6oagoIkMkR7HxqbZga2jWU6SGD?=
 =?us-ascii?Q?6YIFGR6/xygul93PgSxbMcQvEEaZWxPEotxyY8HH6V10qSpDzixbVydLOqF+?=
 =?us-ascii?Q?nm5lwJR3zUbb7NfcYAhLB4KtxU98L0Chn2jkFh6hmL5Eh5c6O+873NZ8NkR7?=
 =?us-ascii?Q?N7Ki8efBSjYhSaC2L625s0blxh/wh7UWL/+umwMUWK6HL5jYIjKKIS6qi4YI?=
 =?us-ascii?Q?qKPYgrjd0s1N3D7a6g+cwBbQNn/6mXsNGHSv4l+nZDNLxAFyDmVIdCmD0Egn?=
 =?us-ascii?Q?CaTUYeROEw9Rjt4r1RmR5E/31pPhfaTwlLgfQjqblJvhDakXfF/ltqr7jEtj?=
 =?us-ascii?Q?FCgBbHv8/+4AUcKLAEcSUeDiFH7K18bS8lC0dZHVWkA6sw3nEqnrF1INRPMq?=
 =?us-ascii?Q?rbv3KWJ+8Vrq7qaU2tMUbzvhE42+u65qYukyFnfQNv/3+xWMCNt9It6vHh2+?=
 =?us-ascii?Q?r5rjgCmD+1XhKnin7JrvBv3JhzeRrr6hHqu9n7VY6a73wW3jKzUBIUUKoLFa?=
 =?us-ascii?Q?Zbl1rZIKSZYNGB2L4TTlU5fXXYVQfyj7kVj6xhqETlk3BUotVw5cCIco99ce?=
 =?us-ascii?Q?0hDiJqVSw1Rn18YYg0OgJ3jQV6oU0JXAVg/AzLoRHMRMCEmJXf2NyVk4+yy8?=
 =?us-ascii?Q?ZcvSysWnQHyNTjMRvWQFT24fJ5Bqta91pktxZdUtwxCawfMNaIyhEUfEunYL?=
 =?us-ascii?Q?erJ5kFQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 09:53:13.9480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1f936c-5b6c-4433-bbde-08dc758e00dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438

Some type of domain don't have PIRQ, like PVH, when
passthrough a device to guest on PVH dom0, callstack
pci_add_dm_done->XEN_DOMCTL_irq_permission will failed
at domain_pirq_to_irq.

So, add a new hypercall to grant/revoke gsi permission
when dom0 is not PV or dom0 has not PIRQ flag.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 tools/include/xenctrl.h      |  5 +++
 tools/libs/ctrl/xc_domain.c  | 15 ++++++++
 tools/libs/light/libxl_pci.c | 72 ++++++++++++++++++++++++++++--------
 xen/arch/x86/domctl.c        | 31 ++++++++++++++++
 xen/include/public/domctl.h  |  9 +++++
 xen/xsm/flask/hooks.c        |  1 +
 6 files changed, 117 insertions(+), 16 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 841db41ad7e4..c21a79d74be3 100644
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
index 7e44d4c3ae2b..1d1b81dd2844 100644
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
+        r = xc_domain_irq_permission(ctx->xch, domid, gsi, map);
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
index 9a72d57333e9..9b8a08b2a81d 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -237,6 +237,37 @@ long arch_do_domctl(
         break;
     }
 
+    case XEN_DOMCTL_gsi_permission:
+    {
+        unsigned int gsi = domctl->u.gsi_permission.gsi;
+        int allow = domctl->u.gsi_permission.allow_access;
+
+        if ( is_pv_domain(current->domain) || has_pirq(current->domain) )
+        {
+            ret = -EOPNOTSUPP;
+            break;
+        }
+
+        if ( gsi >= nr_irqs_gsi )
+        {
+            ret = -EINVAL;
+            break;
+        }
+
+        if ( !irq_access_permitted(current->domain, gsi) ||
+             xsm_irq_permission(XSM_HOOK, d, gsi, allow) )
+        {
+            ret = -EPERM;
+            break;
+        }
+
+        if ( allow )
+            ret = irq_permit_access(d, gsi);
+        else
+            ret = irq_deny_access(d, gsi);
+        break;
+    }
+
     case XEN_DOMCTL_getpageframeinfo3:
     {
         unsigned int num = domctl->u.getpageframeinfo3.num;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b08..47e95f9ee824 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -447,6 +447,13 @@ struct xen_domctl_irq_permission {
 };
 
 
+/* XEN_DOMCTL_gsi_permission */
+struct xen_domctl_gsi_permission {
+    uint32_t gsi;
+    uint8_t allow_access;    /* flag to specify enable/disable of x86 gsi access */
+};
+
+
 /* XEN_DOMCTL_iomem_permission */
 struct xen_domctl_iomem_permission {
     uint64_aligned_t first_mfn;/* first page (physical page number) in range */
@@ -1277,6 +1284,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
+#define XEN_DOMCTL_gsi_permission                87
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1299,6 +1307,7 @@ struct xen_domctl {
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


