Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372D48AA786
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 05:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708685.1107765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfKn-0003LB-P2; Fri, 19 Apr 2024 03:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708685.1107765; Fri, 19 Apr 2024 03:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfKn-0003H6-KX; Fri, 19 Apr 2024 03:54:45 +0000
Received: by outflank-mailman (input) for mailman id 708685;
 Fri, 19 Apr 2024 03:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1xH=LY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rxfKm-0001xW-Bf
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 03:54:44 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dae33da-fe00-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 05:54:43 +0200 (CEST)
Received: from CH5P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::27)
 by SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Fri, 19 Apr
 2024 03:54:39 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::21) by CH5P220CA0013.outlook.office365.com
 (2603:10b6:610:1ef::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.30 via Frontend
 Transport; Fri, 19 Apr 2024 03:54:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 03:54:39 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 22:54:35 -0500
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
X-Inumbo-ID: 8dae33da-fe00-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlDsUKlKei7n//oNTPMikpBFamIJsK//ttUee/5JXckFvc1JkSusZDiAZMiazYmZ6RG0eOlkjpTkVnJHZF9lcEBLE+eUTf2OhsxYGcTNhvqGzvD8qeIR3o80ZFnN0r0VoyPg9cfsAgSJpDbsogYBEvaXyfcFUC5U3dz16/MEGb5MY339krYF/UsqLBl0ZWelTEh/lW3CLvvOQ4QrPisy3SDQM3B8+1HLdtl9SdQVyRFmNhEl1R/X8RAans85hxAGHv/3Tg49YqCb1+6IrIcSDUrw53+oLKmpzFrEOPLT0dFp7PkOtA1NgsW0iPx29nsIeaiRFpv7aDgWNP2WIDm4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9ITGTvJFNB2j4xLy9eNOmtDYVp8M9SoBRDzPUxldn0=;
 b=KFhIJzOC9BXqsX5MdrDlwoNsjM2ndYDewZojggevX0o9qXjzpengRo2+hMpXO1LVwjSzogH90cgMOftGa5vodMmO5pu5OLqh2ybxJtjMW2h0adcuQu/2xKTrPbT96N+4LUjyk3s2YyGX3o6Fm0iKahuXGSJ8lg0VVC/FXKTfsBWej0y9wspdanaY1xHtm8ghQhFRPYr5ZuP4uGTe9RDh/wuTtCNUgbuIAlAF5XCJoGLrAXBqnET+CAd9v2kIkUg1zVQU4I0JfR3Eslan7VR+ICuFhhHJYCyfJXRZd4QL3W5Lo4ac3wVyYl1ljZgprpOOcyLqdikvY8pES+K1zH8KVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9ITGTvJFNB2j4xLy9eNOmtDYVp8M9SoBRDzPUxldn0=;
 b=Rk/+PewjdC9U+qd5feMoYxHUuCmAYMAeJ3w6eR7es1xcIRuBK6U/9DC6U2GiwouZWed+2hQbvS0HI1IHA2g0V/xdgJz9y0l2YBfIzXiOtUJmGF/oI5khL19jplRW2R6sNyRZiQqzc/rKQ/0i7Oq+geE6koc+WoC4n+nFB0eQuFs=
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
Subject: [RFC XEN PATCH v7 5/5] domctl: Add XEN_DOMCTL_gsi_permission to grant gsi
Date: Fri, 19 Apr 2024 11:53:40 +0800
Message-ID: <20240419035340.608833-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419035340.608833-1-Jiqian.Chen@amd.com>
References: <20240419035340.608833-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 476b92d3-9f9c-45bf-4710-08dc60246fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yCMkr+CN+6ERLnwU+MJ7MVn2tQelGTftT31njxYLeNogkEj7wiX2uPpuuRMr?=
 =?us-ascii?Q?bysMoyKB0GZUrj5F7rbxfN1yIzkkIwFFOR4dHNZAI0HgQ98cMt92DVNrPFfG?=
 =?us-ascii?Q?Lergtbdi6e6eeCgFjQyeIHmpYirj51+KqiKyHHeELOK3uKmF5wlqYU/g3RKV?=
 =?us-ascii?Q?koCjx7+NZYFh1PBk7Dbt4JTbGFOcmErnogEWHMxfZwXvnO1if2gy7KHe1zA/?=
 =?us-ascii?Q?Q97QxD6i4kKuoxfAPjll0RvyYIxUemobIbD+FOk48oqgp/twp517jMuMUIHy?=
 =?us-ascii?Q?/agBUOTcvSlrnco60Jo7InhnXpyoQ7vNESEAZTmmQ3LsK7tfqTMOzbDTOeDM?=
 =?us-ascii?Q?sdaA0eTkfBAUW4ADbSWAMaFRGBGMNUXFbhNvWFv0ddjfVr6Z6SxCq4xpiBtx?=
 =?us-ascii?Q?6weqk2mwI2ssUAu7LGv3Og5fDw+mRdmmjb+BxrBNmimxldgUpGtgIAp659MM?=
 =?us-ascii?Q?W9jA9byhx8kO5P14uef1+JLbGHFwHHdrITjedo/+YYjEtaQzsH2p09nQh0Sb?=
 =?us-ascii?Q?Y7T+qBZWIC3Veef53xpYyT9a5pbYhTBaEmwx4XVGjEuwuHw9EQlu3t3Y1Ru0?=
 =?us-ascii?Q?PYdnwvWU+xJOzxj78JKzgwyZgarVZsMQAnWIqYNOwC5hJ2r6dKyq8C7cJOHZ?=
 =?us-ascii?Q?1yPIOIkXlRJtzNIKsr3feJFXekrhYNOYktFiOTDcCP9G0IWJJ3dO65IPM/tp?=
 =?us-ascii?Q?y2sTYs1pB6Pd/p4ASn3A4FQaMYt2hlFjY5sNTKz9oZgNDrLCDqbNColKk4FY?=
 =?us-ascii?Q?0BXhufU2k5YDnTH7yWhACl+SpV+CRZOZnw1oVdnrst/gQM5Jlnkgr0SzbxEr?=
 =?us-ascii?Q?ioqIEEBg85ApXb80JwD0CTOs5EB/sWDACA4Mz6KwZ+/6WRYOyqrzAniqbf+K?=
 =?us-ascii?Q?lWwoi39XMwLBUzqd/CpAH5XA+uHabnG+nzWAP1q+lmQu4UXgL6C5yAlH6d1T?=
 =?us-ascii?Q?bZGTBm0x1dftdZMq+sZUP96bJYQvFzkHWAzBxuf+2IN1Z59hr9hvAPbsWQSi?=
 =?us-ascii?Q?8AAC5X/Ay4UFuuxcQmZoVEUzVlNy41k4KOHR1dOd1LmA35AD9YUpI/LcoJeA?=
 =?us-ascii?Q?yrG9qIuzi44moNrdDVWqekWScBDCEL65Q+St5LTD+AK0LsYxMJixu9XQklhS?=
 =?us-ascii?Q?KXryzID+KDeKQ05VJotFR4JY34ovoT2asPDWwfkNbXqO6tQ+l55CbPvz6D4C?=
 =?us-ascii?Q?4Zj0dbANoPgjPkN7x5m/oaJOnJ4TTdUz+1S5J6HMqLqjaic4uFPg8K47azNv?=
 =?us-ascii?Q?wv0T4bZYyxFyHYr3x1xZVrWLVY4mg+niRqLYVq/vqs1vgm3/H4531K3of8uc?=
 =?us-ascii?Q?g9NgO2YglXYKrRD8Vu6uqyEkMEW2wQ8runz/V2lPm6kZpURCrnzk8mMqax9/?=
 =?us-ascii?Q?XWLe0z8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(7416005)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 03:54:39.1004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 476b92d3-9f9c-45bf-4710-08dc60246fdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241

Some type of domain don't have PIRQ, like PVH, when
passthrough a device to guest on PVH dom0, callstack
pci_add_dm_done->XEN_DOMCTL_irq_permission will failed
at domain_pirq_to_irq.

So, add a new hypercall to grant/revoke gsi permission
when dom0 is not PV or dom0 has not PIRQ flag.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 tools/include/xenctrl.h      |  5 ++++
 tools/libs/ctrl/xc_domain.c  | 15 ++++++++++++
 tools/libs/light/libxl_pci.c | 46 ++++++++++++++++++++++++++++--------
 xen/arch/x86/domctl.c        | 31 ++++++++++++++++++++++++
 xen/include/public/domctl.h  |  9 +++++++
 xen/xsm/flask/hooks.c        |  1 +
 6 files changed, 97 insertions(+), 10 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2b9d55d2c6d7..adeaab93d0f7 100644
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
index d4313e196ebd..7e82f31ffc4f 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1421,6 +1421,8 @@ static void pci_add_dm_done(libxl__egc *egc,
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
+    int gsi;
+    bool is_gsi = false;
 
     /* Convenience aliases */
     bool starting = pas->starting;
@@ -1490,6 +1492,8 @@ static void pci_add_dm_done(libxl__egc *egc,
         r = xc_physdev_gsi_from_irq(ctx->xch, irq);
         if (r != -1) {
             irq = r;
+            gsi = r;
+            is_gsi = true;
         }
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
@@ -1499,13 +1503,25 @@ static void pci_add_dm_done(libxl__egc *egc,
             rc = ERROR_FAIL;
             goto out;
         }
-        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
-        if (r < 0) {
-            LOGED(ERROR, domainid,
-                  "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
-            fclose(f);
-            rc = ERROR_FAIL;
-            goto out;
+        if (is_gsi) {
+            r = xc_domain_gsi_permission(ctx->xch, domid, gsi, 1);
+            if (r < 0 && errno != -EOPNOTSUPP) {
+                LOGED(ERROR, domainid,
+                      "xc_domain_gsi_permission gsi=%d (error=%d)", gsi, errno);
+                fclose(f);
+                rc = ERROR_FAIL;
+                goto out;
+            }
+        }
+        if (!is_gsi || errno == -EOPNOTSUPP) {
+            r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
+            if (r < 0) {
+                LOGED(ERROR, domainid,
+                    "xc_domain_irq_permission irq=%d (error=%d)", irq, errno);
+                fclose(f);
+                rc = ERROR_FAIL;
+                goto out;
+            }
         }
     }
     fclose(f);
@@ -2180,6 +2196,7 @@ static void pci_remove_detached(libxl__egc *egc,
     uint32_t domainid = prs->domid;
     bool isstubdom;
     int r;
+    bool is_gsi = false;
 
     /* Convenience aliases */
     libxl_device_pci *const pci = &prs->pci;
@@ -2249,6 +2266,7 @@ skip_bar:
         r = xc_physdev_gsi_from_irq(ctx->xch, irq);
         if (r != -1) {
             irq = r;
+            is_gsi = true;
         }
         rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
         if (rc < 0) {
@@ -2260,9 +2278,17 @@ skip_bar:
              */
             LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
         }
-        rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
-        if (rc < 0) {
-            LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
+        if (is_gsi) {
+            r = xc_domain_gsi_permission(ctx->xch, domid, irq, 0);
+            if (r < 0 && errno != -EOPNOTSUPP) {
+                LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d", irq);
+            }
+        }
+        if (!is_gsi || errno == -EOPNOTSUPP) {
+            r = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
+            if (r < 0) {
+                LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
+            }
         }
     }
 
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


