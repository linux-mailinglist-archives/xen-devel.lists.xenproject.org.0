Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F7E88F7F7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 07:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698791.1090957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjLZ-0006cK-9l; Thu, 28 Mar 2024 06:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698791.1090957; Thu, 28 Mar 2024 06:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjLZ-0006Z3-4Y; Thu, 28 Mar 2024 06:34:45 +0000
Received: by outflank-mailman (input) for mailman id 698791;
 Thu, 28 Mar 2024 06:34:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwcp=LC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rpjLY-00050u-9n
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 06:34:44 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e88::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42a37dcb-eccd-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 07:34:43 +0100 (CET)
Received: from CH2PR16CA0004.namprd16.prod.outlook.com (2603:10b6:610:50::14)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 06:34:40 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::cf) by CH2PR16CA0004.outlook.office365.com
 (2603:10b6:610:50::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.39 via Frontend
 Transport; Thu, 28 Mar 2024 06:34:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 06:34:39 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 01:34:35 -0500
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
X-Inumbo-ID: 42a37dcb-eccd-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeB0gOXfEDmfiUZVoLSTLEiLfXliEtDMvm+BI4TMzOgR2wz/OsUhIxO3IFn7eeKgd3o8JR2CHEJUAPBIT6tqiOmW2UICJTil+lFfldZw9izf0aj3XsmfJI838f8FrP7RWrQcA4oDlPjdsLDbPpQ0j2sO9uXKKYua8iRv6fiw/x4945JNTD8Fo1sjmpk9oFsH0jvDbDkqLhVa19JaNMT9q6frU8MAtjDf/VZYPkUealvVRB5TitKB1COMcrdUEcD09A1BQZnUJLFqPVmmsoCT8aHI5FGTQ0HNAgBanvZ87TDhnRhCQ3tW4BGt3zSm62mbVngwsN/yLVRee5351IQnew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYVEVM14U5UZ2YEi1dg7K9xI2Fd7nuSqWrGJlbiocK8=;
 b=WNUpsOedxHeTLLGnGBop8pnvUc9PrYLtTdn5HHNeHBzqFIaw5ql/eEIb9FbSq03kj0wMZ5kbB0y+zogTFy56q9wjTgJQaqhQmmDgUTvyGN5US+fJwSmkJWReQVHPSYCEXQW8RHQB/36QQaLJ9NFm366tThGvJ5G6YT9KRNqP96/c9rsFths8hWi692z5awdAXOBvFfDKF87NkUHsJJL0gHUQ3b58lqx/9bqDzKvS1QRvkn1jDt/99jriXNawFFuu+OMUjUAiYMI91CFbJax5MI+RVnO6D+6LewHBGUfN/2925kafyn067codD45xb7cHgrqKzw3y9kUW6nE2IvTKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYVEVM14U5UZ2YEi1dg7K9xI2Fd7nuSqWrGJlbiocK8=;
 b=FM00paNZJ1UhckIbrDM0UTNDlVZ8U1YhkeRfqJL07ZVZZ3eLI2fFliXyGyH68X9JA2imW89yV4byb/EGWjdx1944Rs6GmnLuAvBcsS/bng9sXFyb/IHWWhBSz5FleSAfItZyix23+EDDdVUraZtcCCaARbznnosXMYOjd+eV3yk=
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
Subject: [RFC XEN PATCH v6 5/5] domctl: Add XEN_DOMCTL_gsi_permission to grant gsi
Date: Thu, 28 Mar 2024 14:34:02 +0800
Message-ID: <20240328063402.354496-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328063402.354496-1-Jiqian.Chen@amd.com>
References: <20240328063402.354496-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: b354861a-c49f-4c92-f056-08dc4ef1254a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IOAuaYrNBz1VtmJNNXerVNOzHHRK6fX1ObcRPA9SzfrWOH4dOf7/qqPF3r02OMa4QErozETSPhrCxNfYNJuH1lm214aX6zDqfL/Y1qpK8w+otb9eAd3DuT4cgNdTXdoSs70ov6kuwXR7XBo0bOqBA0Ka77W9636wqoV/3HM84LI0m/0ugjAz5Daz9pm4dgBm14onCR1S+fWpt7u+zPUK9ZOzS9Dhk9/bA5gsE7x82D9290yV3TqTDHkbwW9m0McfdeTgV+BryV0DEvhOMtBpAN1lGPLGnqf2wrFOHSlCjbOqviQ7emZxG2KV+2HPA4HlYMGq+S+/u1pawyKPTkY9eCcH51QVGLf31NgVaBqg3cc10YOVmpd/99AjR9TVlb+wQLs+Cc5K6t8LR0JC1/Bu71zCs6b5M7jY+JDbwLpxTkqbD4GNitiv7f8NAhgy/fxkqf2HZR4EHtgmWsW1l1y6yy1juj9jtRLQE0Xn25GOPLZW/MTLGk4UMt5NlJpzooe9bwx8zxK0sr1iQl3VX+KqbCOBlAZhgGthDKijxdkXIEQtKxIUOuB1YMVJWeX55TJsuldy3iaBjwo+xcRAE6QsD43seGdaZKqRLxght/yMfiFtUZn7jV/gloZMlqIfVJgk2xNDQV5Mq3FIoTKl4yRRwYHCU4Jw2WW1SFHQhcYQ3dGxf+mA1d9nHNrIuI7SORkf5lvHwogADtAN01BUSRKZQJNkIHNRU9caB4UHhaoXORqE3eY0nvXO6qrs4DZIXgbh
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 06:34:39.8895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b354861a-c49f-4c92-f056-08dc4ef1254a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188

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
 tools/libs/ctrl/xc_domain.c  | 15 +++++++++++
 tools/libs/light/libxl_pci.c | 52 +++++++++++++++++++++++++++++-------
 xen/arch/x86/domctl.c        | 31 +++++++++++++++++++++
 xen/include/public/domctl.h  |  9 +++++++
 xen/xsm/flask/hooks.c        |  1 +
 6 files changed, 103 insertions(+), 10 deletions(-)

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
index 2cec83e0b734..debf6ec6ddc7 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1421,6 +1421,8 @@ static void pci_add_dm_done(libxl__egc *egc,
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
+    int gsi;
+    bool is_gsi = true;
 
     /* Convenience aliases */
     bool starting = pas->starting;
@@ -1485,6 +1487,7 @@ static void pci_add_dm_done(libxl__egc *egc,
         /* To compitable with old version of kernel, still need to use irq */
         sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                                pci->bus, pci->dev, pci->func);
+        is_gsi = false;
     }
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
@@ -1492,6 +1495,13 @@ static void pci_add_dm_done(libxl__egc *egc,
         goto out_no_irq;
     }
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        /*
+         * If use gsi, save the value, because the value of irq
+         * will be changed by function xc_physdev_map_pirq
+         */
+        if (is_gsi) {
+            gsi = irq;
+        }
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
@@ -1500,13 +1510,25 @@ static void pci_add_dm_done(libxl__egc *egc,
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
+            if (r < 0 && r != -EOPNOTSUPP) {
+                LOGED(ERROR, domainid,
+                      "xc_domain_gsi_permission gsi=%d (error=%d)", gsi, r);
+                fclose(f);
+                rc = ERROR_FAIL;
+                goto out;
+            }
+        }
+        if (!is_gsi || r == -EOPNOTSUPP) {
+            r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
+            if (r < 0) {
+                LOGED(ERROR, domainid,
+                    "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
+                fclose(f);
+                rc = ERROR_FAIL;
+                goto out;
+            }
         }
     }
     fclose(f);
@@ -2180,6 +2202,7 @@ static void pci_remove_detached(libxl__egc *egc,
     FILE *f;
     uint32_t domainid = prs->domid;
     bool isstubdom;
+    bool is_gsi = true;
 
     /* Convenience aliases */
     libxl_device_pci *const pci = &prs->pci;
@@ -2243,6 +2266,7 @@ skip_bar:
         /* To compitable with old version of kernel, still need to use irq */
         sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                                pci->bus, pci->dev, pci->func);
+        is_gsi = false;
     }
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
@@ -2261,9 +2285,17 @@ skip_bar:
              */
             LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
         }
-        rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
-        if (rc < 0) {
-            LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
+        if (is_gsi) {
+            rc = xc_domain_gsi_permission(ctx->xch, domid, irq, 0);
+            if (rc < 0 && rc != -EOPNOTSUPP) {
+                LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d", irq);
+            }
+        }
+        if (!is_gsi || rc == -EOPNOTSUPP) {
+            rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
+            if (rc < 0) {
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


