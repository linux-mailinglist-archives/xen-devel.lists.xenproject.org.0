Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D54824EFD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 08:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661985.1031885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeLH-0002wQ-H7; Fri, 05 Jan 2024 07:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661985.1031885; Fri, 05 Jan 2024 07:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeLH-0002sS-AQ; Fri, 05 Jan 2024 07:10:07 +0000
Received: by outflank-mailman (input) for mailman id 661985;
 Fri, 05 Jan 2024 07:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI+5=IP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rLeLG-0000zs-6H
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:10:06 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73a42acc-ab99-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 08:10:05 +0100 (CET)
Received: from PH8PR02CA0015.namprd02.prod.outlook.com (2603:10b6:510:2d0::7)
 by MW4PR12MB5666.namprd12.prod.outlook.com (2603:10b6:303:188::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 07:09:59 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::77) by PH8PR02CA0015.outlook.office365.com
 (2603:10b6:510:2d0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16 via Frontend
 Transport; Fri, 5 Jan 2024 07:09:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:09:58 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:09:54 -0600
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
X-Inumbo-ID: 73a42acc-ab99-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8w/ryduOw+w0uWbyaulW8uccfBuvNqqEbWnNjhe+tdzfdGifbjC3aB0T06MvQ07g3x+hH4rWikJFWNZkP5N/UorbtU/KuxpObwfLmMlVGEPf0e7ta/y7piR2WfoGzCvNSneiuj8KC/jpElCIxj7OIiPSPSILSHGENr59xiYJC3AVLYOOsKdgRnqAkbVPiW1AGlRJLxgUdcEs758O+ZXLhiA6pqvfiYZOXXlQc7rao/Pj7mB+CP+BPFPfzLRORX3myD3wHRy6050IRge2txNV1I7MJMWVnDAbEJuDu9J4HL0l6X8FkRixcYZFGa232v5glUcIfJwmXr8ed+J0K/qkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rf4Pu/sqcMtXSsRIZdrBWFvuz03FcIxT/N0cvVCw+TI=;
 b=GTpRtNlGgCvORdOnvv+S+i/G18XL313ASrOuoTd8bdFKT4nqmpQ85Fwe2ahUDFhLiRsDbzX2ZvdmaoHh0yY9zElWIVHkY9X2HlBkGPz5eZOTfSF2oDyrLaaPmHJ0xDt1WE0hCXHBwVfjNn+7vIk5vJW2DeuCzVcsfyjuO+uMofh46saspo/QeOVmOuaS4adGZ6v602t4iGCI8ZkWNKjp5JH0EzI40Eac0NKRFWaJe/FmTSlEXdLNRGwKM82M0KoxeMMY/Ta2AKw9BLoG1Sqzj+NNL8QJTDAVhYBy0bo+AjRFnaxLHSi090j1mkrm0dtRBiMlsS+Ms5e3xUrPbd3RCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rf4Pu/sqcMtXSsRIZdrBWFvuz03FcIxT/N0cvVCw+TI=;
 b=DfgE6hLlaNKb8qAmCo6YglFTeU6CKAoscyCLoyR83rI1zBV0JHizmSRYsiC22jhTldX3swp9jL3R8KWARyScSSm3f8wZvuSHWU6POmNwEfILg71i+40LvxftiM2BpqLE7MFh5915JaHUMyqrgORb7Y/73plJhHW2BFCs1G+YWfw=
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
	"Juergen Gross" <jgross@suse.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq permission
Date: Fri, 5 Jan 2024 15:09:19 +0800
Message-ID: <20240105070920.350113-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105070920.350113-1-Jiqian.Chen@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|MW4PR12MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ab51ce-7600-4170-774d-08dc0dbd53f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9j3sB6Xb1ShR5vObfhkbmDTD3xOOHvJ7Qa/FkkoIG80L1G9SRA0VqGTcsR6ph+P6rXvE6b3RfsUWzdfypYMIiXjm2ape+06Z+ZwQgEA5dtHbGT66aymSCtG7b2QoqhLQ2B8m/TTXz1jnVELoZ+525yN0heJbC5D16BRwmdQ0nLUkJ58M5axDNCJOWv33rjnWkXyqtLN8LAFOzVd+8Dfirb/KTRAbZHDdnw3r7bFntbeO0P7PrMGhY8VUsi3ehRJhao+tm1GRR/5BN22ym785SWDLQ0VCsZkxHn664wFf9o0PNgyHUeRAwajQLr1xK0evCm3Qs49Rdui69bxr8nVy/HGoVx6MSAekzmZj88+fDDkrSB4/DfVRoguag5s09EEdLyIQ5qacKp/31rYkDCJpuhe3w4OUYQX5VbusK4YIamn5niDayjYytEyMrWyUL7HIUg7Xr7Ez6N9ruqcx/CrANh3UUZXjdkcQ0jq/xbLNGD7ckSwoneyA7+4guUyMicge/3teyygGA9XDlTC5EPp7RD06r19tKETWSwlD99UJNIsbh5BUblbA1vGHcRRJrnXEup2V8sRuhYiVRxyol58hGUCuNN88oiUgMJIjHjwTC9VoNVs6oLFLCTscV1W+CDGAglUY+wcuxJj7hrOajFGVxx2+MFg5kupIujzVadyR7JpWHeoF/JM1cFGWAe/xCUxgKVMRbeXhJ+SUsajcX1JgOa25C8nU8eys4VAY06Qr26MxS3Ij6EaAgyNneuV4zhMxQO7rTDMP4CKWSIxrY5Iy0g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(83380400001)(41300700001)(70586007)(70206006)(81166007)(356005)(36756003)(86362001)(316002)(82740400003)(36860700001)(47076005)(16526019)(26005)(426003)(336012)(2616005)(1076003)(5660300002)(6666004)(2906002)(478600001)(6916009)(54906003)(7696005)(8936002)(8676002)(7416002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:09:58.7602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ab51ce-7600-4170-774d-08dc0dbd53f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5666

Some type of domain don't have PIRQ, like PVH, current
implementation is not suitable for those domain.

When passthrough a device to guest on PVH dom0, this
pci_add_dm_done->XEN_DOMCTL_irq_permission will failed
at domain_pirq_to_irq.

So, change it to use gsi to grant/revoke irq permission.
And change the caller of XEN_DOMCTL_irq_permission to
pass gsi to it instead of pirq.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 tools/libs/light/libxl_pci.c |  6 ++++--
 tools/libs/light/libxl_x86.c |  5 ++++-
 xen/common/domctl.c          | 12 ++++++++++--
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da0794e..e1341d1e9850 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1418,6 +1418,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     unsigned long long start, end, flags, size;
     int irq, i;
     int r;
+    int gsi;
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
@@ -1486,6 +1487,7 @@ static void pci_add_dm_done(libxl__egc *egc,
         goto out_no_irq;
     }
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        gsi = irq;
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
@@ -1494,10 +1496,10 @@ static void pci_add_dm_done(libxl__egc *egc,
             rc = ERROR_FAIL;
             goto out;
         }
-        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
+        r = xc_domain_irq_permission(ctx->xch, domid, gsi, 1);
         if (r < 0) {
             LOGED(ERROR, domainid,
-                  "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
+                  "xc_domain_irq_permission irq=%d (error=%d)", gsi, r);
             fclose(f);
             rc = ERROR_FAIL;
             goto out;
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index d16573e72cd4..88ad50cf6360 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -654,12 +654,15 @@ out:
 int libxl__arch_domain_map_irq(libxl__gc *gc, uint32_t domid, int irq)
 {
     int ret;
+    int gsi;
+
+    gsi = irq;
 
     ret = xc_physdev_map_pirq(CTX->xch, domid, irq, &irq);
     if (ret)
         return ret;
 
-    ret = xc_domain_irq_permission(CTX->xch, domid, irq, 1);
+    ret = xc_domain_irq_permission(CTX->xch, domid, gsi, 1);
 
     return ret;
 }
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f5a71ee5f78d..eeb975bd0194 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -653,12 +653,20 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         unsigned int pirq = op->u.irq_permission.pirq, irq;
         int allow = op->u.irq_permission.allow_access;
 
-        if ( pirq >= current->domain->nr_pirqs )
+        if ( pirq >= nr_irqs_gsi )
         {
             ret = -EINVAL;
             break;
         }
-        irq = pirq_access_permitted(current->domain, pirq);
+
+        if ( irq_access_permitted(current->domain, pirq) )
+            irq = pirq;
+        else
+        {
+            ret = -EPERM;
+            break;
+        }
+
         if ( !irq || xsm_irq_permission(XSM_HOOK, d, irq, allow) )
             ret = -EPERM;
         else if ( allow )
-- 
2.34.1


