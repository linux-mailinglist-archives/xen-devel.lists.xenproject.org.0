Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27AF82BB2E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 07:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666645.1037436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOApF-00023P-ND; Fri, 12 Jan 2024 06:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666645.1037436; Fri, 12 Jan 2024 06:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOApF-00020v-Ip; Fri, 12 Jan 2024 06:15:29 +0000
Received: by outflank-mailman (input) for mailman id 666645;
 Fri, 12 Jan 2024 06:15:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/PwP=IW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rOApD-0000lq-Nk
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 06:15:27 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8448d00-b111-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 07:15:25 +0100 (CET)
Received: from CH2PR14CA0005.namprd14.prod.outlook.com (2603:10b6:610:60::15)
 by CY8PR12MB7515.namprd12.prod.outlook.com (2603:10b6:930:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 06:15:20 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::f6) by CH2PR14CA0005.outlook.office365.com
 (2603:10b6:610:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Fri, 12 Jan 2024 06:15:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 06:15:20 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 00:15:16 -0600
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
X-Inumbo-ID: f8448d00-b111-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAVSCJYFwHIdovrr4N6QiUnWEu3KwFi6T00bg2NvFWRqV4HJw3H1gFE6DwMlKO8LSQoSIhqDmn785ehkTJpZGCpTic3wH0PHduOCENXs9wBmIOaaqoVI8O+9PUZNKOkVIWghiYuJofe/jc2D9hLPwB22ccWds8/ITfEh+7cFqk8TQwWkweQnDywpZ/2voofQ7Zkj0OdZipwvwAV9pIz/D4XNjMlexTjYfyVqcybTeSKErORSMrBS4qvsCetjNLomgr0VLOOUj6KBkXGSAZZADu+C6WOmcqm9DW4jNO3yQJ5O4Bbkhi27DRlifaCgUJQPV7cAsrwBoa5JtCod46HiYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSkLYrAo95Wea4+HG7BuppVa+CyaaIyZn3k0KcMeVOM=;
 b=NOYXnsKZTXzIIz74DC0T5lnDjFihVFVAtbRky2/Uhns7psBfH2jRSqczHbgnqSqGKoCp9h9T3Xyq0zs/SmV5S9fVuaeOfU+m2Sl7GbQ7PbIImnXk5on31/xwdvU7HXo/VdvCW1zByxBUKKLtsODxoKthO9KAU63LiSGNy64TCMQfroG2jrGS6HFbBoNbQ/kMUU9Cac+5kj179yAbMvbVFtkJuupb6LE/EkGJUXwKXHbRPLwTizMiIWgVh6ajhZDxoUzijuS67eIVJZfgRMtqrmyub/J0J1Att2RM+jbTr1ygyglzfnJ8SXbASV6SF7PRo2GVzOPA5zfKMYpIAklwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSkLYrAo95Wea4+HG7BuppVa+CyaaIyZn3k0KcMeVOM=;
 b=eIzMRbrDDMEolzdkoDbJKlUzatUDOCVgSJk7Bn30355IUrh5+4B3Ctxr3LA4Bl6q3op4A2ETOQh65dGa+y8y2vZuMdB/XCioFS51QJ5TAO8lb/Y1uJiB1fCW9t8X39aF2vT4HzYVUc/8rUlpT1KytUC6tCCYWZtc91ChPhLQgYc=
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
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v5 5/5] domctl: Add XEN_DOMCTL_gsi_permission to grant gsi
Date: Fri, 12 Jan 2024 14:13:17 +0800
Message-ID: <20240112061317.418658-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112061317.418658-1-Jiqian.Chen@amd.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|CY8PR12MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: e28c13e0-239e-4a61-bcb3-08dc1335daa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hRt08wOhZtQQ5iUEfWVxVBnv1BKULd5sGNPpE6dnxplP3oFebyZf2Uaw12VUfHnRT6To/IrKfUGHSqxWkrDbWHDL9S0/IDn6XekXJTQUWYTSeCG+OIdKh/9dG+dgIlpiv+ZyKXPsUPYCAtgd5cuoG+6eB0AFvGoS1rl3u8Wrf+TZoSIOW6akZO3xmSbemc3B9QS3P94KvhLNojI6/D/4rxKk8AaLT9UwEByoxO1oGd6XRm3QNnOC3wyO1xyg1qBVFEy9Sct0hQPPKdWymFVy928DAvsuvT9KEs1WLwtdkSMBKycVWayBryXExIBxRKzuJX9Jgsx9W/92b1aSk0SUZIaDcC4B9rciBEgleKGCBUpFwDdtUr2CSm91z9Gm7dUmncZvyXfXugd4wm+876fPXNUzpn+nHMjKiPHcDhFw0Yu3oXIpRhJVQZikYUVHF/pd+O5q1KFPaa6+zbbJ7MWZ3kkP/wBHk1QvaU96x1ipcI/it+D7O98HGL2XY2hWgAIWZCuEEdauxROke2xKr4FnkGCdBVexEilJkEPuM20TusWTtIQPnIUCEzZL1WZdyZGPx9wgFWnx04+b5yVs98c0nyfkmAHtSPyvDFSHIdVrcNVPzTXRuscMrdPz7+yifPZr/vbP0YGl65HfAX1iUhI78iDMXYZ74690j+9oNSwdFTUcT+r9wcNaLHh0ualZx7jRcbSLdVoppQ60Plz4Q2Fv9FqYRIMazwXar+bgJ1I8u8BG7nNYIy5Fn3ybavP+zWyfI1V3D4YGIPlw81eMqaJpAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(83380400001)(7416002)(86362001)(26005)(1076003)(2616005)(5660300002)(2906002)(336012)(16526019)(426003)(8936002)(316002)(8676002)(6916009)(70586007)(70206006)(54906003)(7696005)(4326008)(478600001)(82740400003)(41300700001)(81166007)(356005)(47076005)(36860700001)(40480700001)(40460700003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 06:15:20.1475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e28c13e0-239e-4a61-bcb3-08dc1335daa5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7515

Some type of domain don't have PIRQ, like PVH, when
passthrough a device to guest on PVH dom0, callstack
pci_add_dm_done->XEN_DOMCTL_irq_permission will failed
at domain_pirq_to_irq.

So, add a new hypercall to grant/revoke gsi permission
when dom0 is not PV or dom0 has not PIRQ flag.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 tools/include/xenctrl.h      |  5 +++++
 tools/libs/ctrl/xc_domain.c  | 15 +++++++++++++++
 tools/libs/light/libxl_pci.c | 16 ++++++++++++++--
 xen/arch/x86/domctl.c        | 31 +++++++++++++++++++++++++++++++
 xen/include/public/domctl.h  |  9 +++++++++
 xen/xsm/flask/hooks.c        |  1 +
 6 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e05422..519c860a00d5 100644
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
index f2d9d14b4d9f..448ba2c59ae1 100644
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
+    struct xen_domctl domctl = {};
+
+    domctl.cmd = XEN_DOMCTL_gsi_permission;
+    domctl.domain = domid;
+    domctl.u.gsi_permission.gsi = gsi;
+    domctl.u.gsi_permission.allow_access = allow_access;
+
+    return do_domctl(xch, &domctl);
+}
+
 int xc_domain_iomem_permission(xc_interface *xch,
                                uint32_t domid,
                                unsigned long first_mfn,
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index a1c6e82631e9..4136a860a048 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1421,6 +1421,8 @@ static void pci_add_dm_done(libxl__egc *egc,
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
+    int gsi;
+    bool has_gsi = true;
 
     /* Convenience aliases */
     bool starting = pas->starting;
@@ -1482,6 +1484,7 @@ static void pci_add_dm_done(libxl__egc *egc,
                                 pci->bus, pci->dev, pci->func);
 
     if ( access(sysfs_path, F_OK) != 0 ) {
+        has_gsi = false;
         if ( errno == ENOENT )
             sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                                 pci->bus, pci->dev, pci->func);
@@ -1497,6 +1500,7 @@ static void pci_add_dm_done(libxl__egc *egc,
         goto out_no_irq;
     }
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        gsi = irq;
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
@@ -1505,7 +1509,10 @@ static void pci_add_dm_done(libxl__egc *egc,
             rc = ERROR_FAIL;
             goto out;
         }
-        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
+        if ( has_gsi )
+            r = xc_domain_gsi_permission(ctx->xch, domid, gsi, 1);
+        if ( !has_gsi || r == -EOPNOTSUPP )
+            r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
         if (r < 0) {
             LOGED(ERROR, domainid,
                   "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
@@ -2185,6 +2192,7 @@ static void pci_remove_detached(libxl__egc *egc,
     FILE *f;
     uint32_t domainid = prs->domid;
     bool isstubdom;
+    bool has_gsi = true;
 
     /* Convenience aliases */
     libxl_device_pci *const pci = &prs->pci;
@@ -2244,6 +2252,7 @@ skip_bar:
                            pci->bus, pci->dev, pci->func);
 
     if ( access(sysfs_path, F_OK) != 0 ) {
+        has_gsi = false;
         if ( errno == ENOENT )
             sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                                 pci->bus, pci->dev, pci->func);
@@ -2270,7 +2279,10 @@ skip_bar:
              */
             LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
         }
-        rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
+        if ( has_gsi )
+            rc = xc_domain_gsi_permission(ctx->xch, domid, irq, 0);
+        if ( !has_gsi || rc == -EOPNOTSUPP )
+            rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
         if (rc < 0) {
             LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
         }
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 3c0ea8554107..75f23f511ac1 100644
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
index 78225f68c15c..376076865198 100644
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


