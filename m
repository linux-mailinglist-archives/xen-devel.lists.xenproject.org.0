Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6C44A752
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223702.386555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9o-00015f-KT; Tue, 09 Nov 2021 07:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223702.386555; Tue, 09 Nov 2021 07:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9o-0000v6-96; Tue, 09 Nov 2021 07:03:00 +0000
Received: by outflank-mailman (input) for mailman id 223702;
 Tue, 09 Nov 2021 07:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkL9m-00004s-GX
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:02:58 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eab::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1057e480-412b-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 08:02:57 +0100 (CET)
Received: from DS7PR03CA0312.namprd03.prod.outlook.com (2603:10b6:8:2b::21) by
 PH0PR02MB8764.namprd02.prod.outlook.com (2603:10b6:510:f1::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Tue, 9 Nov 2021 07:02:53 +0000
Received: from DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::6d) by DS7PR03CA0312.outlook.office365.com
 (2603:10b6:8:2b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 07:02:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT010.mail.protection.outlook.com (10.13.5.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:02:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:50 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:45 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9Z-000Ga6-B8; Mon, 08 Nov 2021 23:02:45 -0800
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
X-Inumbo-ID: 1057e480-412b-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hvhb/GtflsSdlsrap72a9LIKqeI+HQaPHZQE6u7fqQVPFcbVp/OeswCDREjCpK0j2R03wdszzOHUkEawJKA9vlMH+6/u43YglGd4496Eed4rsElW433R2a4dFK5NuDBRA1IPrp8qOA42meNsWLKJxesG4uHNqu9z0ck6VR9pVQxa11uUmy4Yv9IqNoQiD+bSybBR+Z2nDxfRMW4Ekczf4UCiq8yETBCh9YeL0+S0GOoarNNM6KDbRh7t2LvJ2ygGEl+X20h8dGezN4qFLHyKKhXJxPYcb8Xhx2rme5fBrZb/qNaz8GoXLRvI75b5YdRqZ1OAG/CwEFx6/wukriRVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucS9bxaKbvaVkKdEqBhV0clkSHJP3512JULTceCiTlY=;
 b=WdigXF73JSyVQotKNifoDNsKB742B7i/wntqMxIkl2y8HYxJ5D/1nCpxYTIgfwZH5FibPHdmmaTYhPIEunBUYn4weC17tcsBDT8uPvpmAGPgQz10LjF8hIm8FjYITOPXP3jZHJQoeDRWLSLVmRwPdoPy/g6Xc3G95TIVQXinQg1yR7a4zmcYO0ZA4sNqfflwhQ6CdE88iDHjuYY/3Nr7+NeMUOIgsa79btfzggpApMPoWt7ab/eXFQkFZ1SOUapOYU1e5LNyl/qak7sVDsjtKB9jSq4CGHdggyMT/X+ag/oaB/5s2VBzpKoUCg4japg52CiV+6Dk3OIFKkb/J84OPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucS9bxaKbvaVkKdEqBhV0clkSHJP3512JULTceCiTlY=;
 b=ffaJvF8Ge7QTHN8Jqk3nWzUTec/X9ybR8TO4BbBMiSNTcCZdPBuIHoBk7v96wt2nQkUX4JfPPCwdjlcV9+1osb99Nk8cUCc5Fs4200EXSNG+gvyCWiB0IHdkPHkqhfB1txPIOI/3KOFyPbNS4NBCmDcCBhtD9+cjEcxzQa9mfYs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RFC PATCH v2 01/12] device tree: Remove __init from function type
Date: Mon, 8 Nov 2021 23:02:16 -0800
Message-ID: <1636441347-133850-2-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcf0a359-5a55-466c-0314-08d9a34ef323
X-MS-TrafficTypeDiagnostic: PH0PR02MB8764:
X-Microsoft-Antispam-PRVS:
	<PH0PR02MB87645A136E5D82BDDBF5BB57BC929@PH0PR02MB8764.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hvv82Q3NNI84GInLTU04XdX9QUqq063oCXClE9vDHyA7ZzOjTqr7YSIRInytYWiKAzDaN2WmRgISQih7XNEsVCEzYORNOspQtqLnj9LOnSJcr53/TaMBN+yHX15zOmTQY97Jqe4IlZqhAHdlEI77/gFscQyEO5BN83MPiAjwfksEdWzoIwiubpfQW6eo2Wzf1xJ3mvha3wlvSqYMjQeYqLUyIXjoyT9AFqF8015Z0N2WSRp4+fWMme2wr1nSxY3PTHShukbLgWTMgjdIRtGPfIbfHocf1xTrSAqfsgf2ydRla4rIOIUEzj7EVdmBSWmmtkKIaeq1VGh9ajTciBKZj/rRQ9zdaVvP9ssviwAbeqrosvz/15QR5AWKFYMkCObbgqXQByS/2tU+cu5bq7PwlkZ9TBRNCCZJ0w+rhuL/QUEa7aJy0agnr1DnNmVggSHS14j61O37L9e7jRkHyx628QV7Noza9NOarfBSX3GvWP8KK1LHxJ0eUT/OcvxmrA9kZIv0RzMN4vpK4aE0PL/YRD8J0Os5RL/hj04PfQ+mAXJIzPA8v6cjCsaa47piIxiooyfezaspi/5mJhHpk1kFh3SC95/5Yk94Mfo1vH2pcwIqWgxe1ji/2d63UfwT/H/HPZUDZd84u0Lx4yrhWpE66o8KtGFkTP00Ppnj+USedVeR4USPr9tobi2vsLiiBWsIsR4E7terP5cW7Hf+IAkTHFnpL4W2MYWdw/PcUHoeSQ4=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(356005)(8936002)(186003)(47076005)(508600001)(82310400003)(7696005)(2616005)(30864003)(7636003)(26005)(70586007)(83380400001)(36860700001)(426003)(70206006)(8676002)(54906003)(4326008)(6916009)(2906002)(9786002)(36756003)(36906005)(336012)(316002)(5660300002)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:02:53.0401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf0a359-5a55-466c-0314-08d9a34ef323
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8764

Change function type of following function to access during runtime:
    1. map_irq_to_domain()
    2. handle_device_interrupt()
    3. map_range_to_domain()
    4. unflatten_dt_node()
    5. unflatten_device_tree()

Move map_irq_to_domain(), handle_device_interrupt() and map_range_to_domain() to
device.c.

Move map_range_data declaration to domain_build.h.

These changes are done to support the dynamic programming of a nodes where an
overlay node will be added to fdt and unflattened node will be added to dt_host.
Furthermore, IRQ and mmio mapping will be done for the added node.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/arch/arm/device.c              | 146 ++++++++++++++++++++++++++++++++++++
 xen/arch/arm/domain_build.c        | 150 -------------------------------------
 xen/common/device_tree.c           |  18 ++---
 xen/include/asm-arm/domain_build.h |  10 +++
 xen/include/xen/device_tree.h      |   5 ++
 5 files changed, 170 insertions(+), 159 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 70cd6c1..c7cf2b9 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -21,6 +21,8 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/iocap.h>
+#include <asm/domain_build.h>
 
 extern const struct device_desc _sdevice[], _edevice[];
 extern const struct acpi_device_desc _asdevice[], _aedevice[];
@@ -84,6 +86,150 @@ enum device_class device_get_class(const struct dt_device_node *dev)
     return DEVICE_UNKNOWN;
 }
 
+int map_irq_to_domain(struct domain *d, unsigned int irq,
+                             bool need_mapping, const char *devname)
+{
+    int res;
+
+    res = irq_permit_access(d, irq);
+    if ( res )
+    {
+        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
+               d->domain_id, irq);
+        return res;
+    }
+
+    if ( need_mapping )
+    {
+        /*
+         * Checking the return of vgic_reserve_virq is not
+         * necessary. It should not fail except when we try to map
+         * the IRQ twice. This can legitimately happen if the IRQ is shared
+         */
+        vgic_reserve_virq(d, irq);
+
+        res = route_irq_to_guest(d, irq, irq, devname);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
+                   irq, d->domain_id);
+            return res;
+        }
+    }
+
+    dt_dprintk("  - IRQ: %u\n", irq);
+    return 0;
+}
+
+int map_range_to_domain(const struct dt_device_node *dev,
+                                      u64 addr, u64 len,
+                                      void *data)
+{
+    struct map_range_data *mr_data = data;
+    struct domain *d = mr_data->d;
+    bool need_mapping = !dt_device_for_passthrough(dev);
+    int res;
+
+    /*
+     * reserved-memory regions are RAM carved out for a special purpose.
+     * They are not MMIO and therefore a domain should not be able to
+     * manage them via the IOMEM interface.
+     */
+    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
+                     strlen("/reserved-memory/")) != 0 )
+    {
+        res = iomem_permit_access(d, paddr_to_pfn(addr),
+                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to permit to dom%d access to"
+                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                    d->domain_id,
+                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
+            return res;
+        }
+    }
+
+    if ( need_mapping )
+    {
+        res = map_regions_p2mt(d,
+                               gaddr_to_gfn(addr),
+                               PFN_UP(len),
+                               maddr_to_mfn(addr),
+                               mr_data->p2mt);
+
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
+                   " - 0x%"PRIx64" in domain %d\n",
+                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
+                   d->domain_id);
+            return res;
+        }
+    }
+
+    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
+               addr, addr + len, mr_data->p2mt);
+
+    return 0;
+}
+
+/*
+ * handle_device_interrupts retrieves the interrupts configuration from
+ * a device tree node and maps those interrupts to the target domain.
+ *
+ * Returns:
+ *   < 0 error
+ *   0   success
+ */
+int handle_device_interrupts(struct domain *d,
+                                           struct dt_device_node *dev,
+                                           bool need_mapping)
+{
+    unsigned int i, nirq;
+    int res;
+    struct dt_raw_irq rirq;
+
+    nirq = dt_number_of_irq(dev);
+
+    /* Give permission and map IRQs */
+    for ( i = 0; i < nirq; i++ )
+    {
+        res = dt_device_get_raw_irq(dev, i, &rirq);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        /*
+         * Don't map IRQ that have no physical meaning
+         * ie: IRQ whose controller is not the GIC
+         */
+        if ( rirq.controller != dt_interrupt_controller )
+        {
+            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
+                      i, dt_node_full_name(rirq.controller));
+            continue;
+        }
+
+        res = platform_get_irq(dev, i);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
+        if ( res )
+            return res;
+    }
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0167731..3e8f6da 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -51,12 +51,6 @@ static int __init parse_dom0_mem(const char *s)
 }
 custom_param("dom0_mem", parse_dom0_mem);
 
-struct map_range_data
-{
-    struct domain *d;
-    p2m_type_t p2mt;
-};
-
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
@@ -1624,41 +1618,6 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
-int __init map_irq_to_domain(struct domain *d, unsigned int irq,
-                             bool need_mapping, const char *devname)
-{
-    int res;
-
-    res = irq_permit_access(d, irq);
-    if ( res )
-    {
-        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
-               d->domain_id, irq);
-        return res;
-    }
-
-    if ( need_mapping )
-    {
-        /*
-         * Checking the return of vgic_reserve_virq is not
-         * necessary. It should not fail except when we try to map
-         * the IRQ twice. This can legitimately happen if the IRQ is shared
-         */
-        vgic_reserve_virq(d, irq);
-
-        res = route_irq_to_guest(d, irq, irq, devname);
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
-                   irq, d->domain_id);
-            return res;
-        }
-    }
-
-    dt_dprintk("  - IRQ: %u\n", irq);
-    return 0;
-}
-
 static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
                                        const struct dt_irq *dt_irq,
                                        void *data)
@@ -1690,59 +1649,6 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
     return 0;
 }
 
-static int __init map_range_to_domain(const struct dt_device_node *dev,
-                                      u64 addr, u64 len,
-                                      void *data)
-{
-    struct map_range_data *mr_data = data;
-    struct domain *d = mr_data->d;
-    bool need_mapping = !dt_device_for_passthrough(dev);
-    int res;
-
-    /*
-     * reserved-memory regions are RAM carved out for a special purpose.
-     * They are not MMIO and therefore a domain should not be able to
-     * manage them via the IOMEM interface.
-     */
-    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
-                     strlen("/reserved-memory/")) != 0 )
-    {
-        res = iomem_permit_access(d, paddr_to_pfn(addr),
-                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
-        if ( res )
-        {
-            printk(XENLOG_ERR "Unable to permit to dom%d access to"
-                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
-                    d->domain_id,
-                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
-            return res;
-        }
-    }
-
-    if ( need_mapping )
-    {
-        res = map_regions_p2mt(d,
-                               gaddr_to_gfn(addr),
-                               PFN_UP(len),
-                               maddr_to_mfn(addr),
-                               mr_data->p2mt);
-
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
-                   " - 0x%"PRIx64" in domain %d\n",
-                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
-                   d->domain_id);
-            return res;
-        }
-    }
-
-    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
-               addr, addr + len, mr_data->p2mt);
-
-    return 0;
-}
-
 /*
  * For a node which describes a discoverable bus (such as a PCI bus)
  * then we may need to perform additional mappings in order to make
@@ -1773,62 +1679,6 @@ static int __init map_device_children(struct domain *d,
 }
 
 /*
- * handle_device_interrupts retrieves the interrupts configuration from
- * a device tree node and maps those interrupts to the target domain.
- *
- * Returns:
- *   < 0 error
- *   0   success
- */
-static int __init handle_device_interrupts(struct domain *d,
-                                           struct dt_device_node *dev,
-                                           bool need_mapping)
-{
-    unsigned int i, nirq;
-    int res;
-    struct dt_raw_irq rirq;
-
-    nirq = dt_number_of_irq(dev);
-
-    /* Give permission and map IRQs */
-    for ( i = 0; i < nirq; i++ )
-    {
-        res = dt_device_get_raw_irq(dev, i, &rirq);
-        if ( res )
-        {
-            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
-                   i, dt_node_full_name(dev));
-            return res;
-        }
-
-        /*
-         * Don't map IRQ that have no physical meaning
-         * ie: IRQ whose controller is not the GIC
-         */
-        if ( rirq.controller != dt_interrupt_controller )
-        {
-            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
-                      i, dt_node_full_name(rirq.controller));
-            continue;
-        }
-
-        res = platform_get_irq(dev, i);
-        if ( res < 0 )
-        {
-            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
-                   i, dt_node_full_name(dev));
-            return res;
-        }
-
-        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
-        if ( res )
-            return res;
-    }
-
-    return 0;
-}
-
-/*
  * For a given device node:
  *  - Give permission to the guest to manage IRQ and MMIO range
  *  - Retrieve the IRQ configuration (i.e edge/level) from device tree
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 92ce59e..88f3f7e 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -1821,12 +1821,12 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
  * @allnextpp: pointer to ->allnext from last allocated device_node
  * @fpsize: Size of the node path up at the current depth.
  */
-static unsigned long __init unflatten_dt_node(const void *fdt,
-                                              unsigned long mem,
-                                              unsigned long *p,
-                                              struct dt_device_node *dad,
-                                              struct dt_device_node ***allnextpp,
-                                              unsigned long fpsize)
+static unsigned long unflatten_dt_node(const void *fdt,
+                                unsigned long mem,
+                                unsigned long *p,
+                                struct dt_device_node *dad,
+                                struct dt_device_node ***allnextpp,
+                                unsigned long fpsize)
 {
     struct dt_device_node *np;
     struct dt_property *pp, **prev_pp = NULL;
@@ -2057,7 +2057,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
 }
 
 /**
- * __unflatten_device_tree - create tree of device_nodes from flat blob
+ * unflatten_device_tree - create tree of device_nodes from flat blob
  *
  * unflattens a device-tree, creating the
  * tree of struct device_node. It also fills the "name" and "type"
@@ -2066,7 +2066,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
  */
-static void __init __unflatten_device_tree(const void *fdt,
+void unflatten_device_tree(const void *fdt,
                                            struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
@@ -2189,7 +2189,7 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    __unflatten_device_tree(device_tree_flattened, &dt_host);
+    unflatten_device_tree(device_tree_flattened, &dt_host);
     dt_alias_scan();
 }
 
diff --git a/xen/include/asm-arm/domain_build.h b/xen/include/asm-arm/domain_build.h
index 34ceddc..17449b1 100644
--- a/xen/include/asm-arm/domain_build.h
+++ b/xen/include/asm-arm/domain_build.h
@@ -4,10 +4,20 @@
 #include <xen/sched.h>
 #include <asm/kernel.h>
 
+struct map_range_data
+{
+    struct domain *d;
+    p2m_type_t p2mt;
+};
+
 int map_irq_to_domain(struct domain *d, unsigned int irq,
                       bool need_mapping, const char *devname);
 int make_chosen_node(const struct kernel_info *kinfo);
 void evtchn_allocate(struct domain *d);
+int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
+                             bool need_mapping);
+int map_range_to_domain(const struct dt_device_node *dev, u64 addr, u64 len,
+                        void *data);
 
 #ifndef CONFIG_ACPI
 static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 573e4a0..9fc63ab 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -177,6 +177,11 @@ int device_tree_for_each_node(const void *fdt, int node,
  */
 void dt_unflatten_host_device_tree(void);
 
+/*
+ * unflatten any device tree.
+ */
+void unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
+
 /**
  * IRQ translation callback
  * TODO: For the moment we assume that we only have ONE
-- 
2.7.4


