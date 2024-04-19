Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B38AA782
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 05:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708681.1107724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfKa-00023K-9s; Fri, 19 Apr 2024 03:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708681.1107724; Fri, 19 Apr 2024 03:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfKa-000212-6K; Fri, 19 Apr 2024 03:54:32 +0000
Received: by outflank-mailman (input) for mailman id 708681;
 Fri, 19 Apr 2024 03:54:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1xH=LY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rxfKZ-0001xW-F3
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 03:54:31 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84a366c7-fe00-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 05:54:28 +0200 (CEST)
Received: from CH2PR15CA0027.namprd15.prod.outlook.com (2603:10b6:610:51::37)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 03:54:25 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::17) by CH2PR15CA0027.outlook.office365.com
 (2603:10b6:610:51::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.29 via Frontend
 Transport; Fri, 19 Apr 2024 03:54:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 03:54:24 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 22:54:20 -0500
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
X-Inumbo-ID: 84a366c7-fe00-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euBBfXiJ13SjbyoRcTG65bAOaVG1ZoRdvxLY3Gnoiz3gCdZYuFPaDIcPzXMqnESDkVBhUYjAJYIB2R/bDRXgMVhMy7Cy6rAbrmkvhR9tLTEdAdM7kdYnWMT4C+KLXpxPh5udtzvBfUd/xP7VdDPLOWaIKd40bigG+N5VaXxK984y0csM6m5KEhtik2olnSM+mHA1uhKYTexMTQHYloP5f5vBhDY8KR9FgTQ3f1vxfGC59LDvwCYJfVx9oKO3SzqiyolYl7weSSfXTZXjZD0nRf/Tef2eUS2USodRN01aZ/Xc0igjWemsjRFMAGPSgj2ZSx/+N74RnTFngibws38N2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Caez2gc/3ChE8xxdCxSMDIEO2s0uO1VlEDaIPNm06/A=;
 b=gorykBmmuroSo1zLYGCyO7YGxYoqZuhCau1bljv1NIA+NLvuv3DXVHPlaSvSCnJmVdmF72qBJAm/cUzBv1e/furONPyyC58/F97mjsznzkJzIReGrFnlN//1a5beDvbrFH0DzgGgrFy9JRBKEkqPmfw3zBeIKUZy4ouKgncW8/O4CgKdW8R31S0zxgLdOlmgEtCFtvnxfolTWtTovVv/5dy976WA75rlrpT9pHfD+raYBE1vN9zQUhrl07qEUxEFjeRy22tR7HxVzX6m8Odsu7f4V4SrcFqJicTawal2d3RiVATQc62EBhBS1oLUYz3/Xx0lMpDtrkhJu1t67yuN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Caez2gc/3ChE8xxdCxSMDIEO2s0uO1VlEDaIPNm06/A=;
 b=HVRJ1aHJn6YNd7MVNNjLiJHfiNuc9SZlKycXimNCbmIK/pGcGCBgdRcmh0npNUitDuIVB7OjrZlPT0BDATHs3mAoAHajmgPgLNYpGZozlgM7N+gS6dg0+zL8j/Jp5pwFn76JWNK6J7pGBJBclS2DHcWf2VSallnyBzyG9K6z/Xg=
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
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [XEN PATCH v7 1/5] xen/vpci: Clear all vpci status of device
Date: Fri, 19 Apr 2024 11:53:36 +0800
Message-ID: <20240419035340.608833-2-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|IA0PR12MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: defb5ace-d058-43ed-20a7-08dc60246741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5tK/cDJLU96HD0aXPZscow//1pFyQNOSHHmlAMqdGM9TOGw7IsrAgvIxNlYYXqbdtQ6erPiU6gTjcpY7PrTOucnrq4RfXVlcn9cMFxDSwfzx2LB3A3OgJeJKEwcZVoEFd4IZ6vrajgzGAjlhkA3KPT++zJzTCYXwrr0m7dFOYvE5qZU5zwPy6ITUs+sxN2l9pceLeOOBaXgpbV0ubz92vniNCOKZOAjczolq/SzIG9/bmg8/CzmLfKDpkAMJZt89sCBSJY5j5hh9peXVS7DJQcU9q/FdqeT27wGwN5EkfOi8hMfo2cJE4n1YD3ZnE52SnrFdyTR1+NxiKapsQUK25QH5VLdcIcf08qu0ToAnnMEAWzO/7Cvx5IhJybm4bNj+ZBVhJ53CWvL7yogpnl+JzF1EvorRy0rUj6PotRJBuFuxOHSrQ7ph413oltJqhko5pWNSnlbSrjDr+APd01HYJMn96hEo2qeN4WeAkMauTsIFdu2Crg3KgJZYQmmWw7eFnQt7s+QduGa1wLhQ25iquDCCdhkclQzTdy0/pHllPrlSzKuC+WayBxT8FDgi7lzRQw7UCTYv6iXmggpac1aFUy6ZovQOrz0juR81FZHdb6MHXXJV9dovbtR0E/zkKKMFlicrYF1TLpQiN1kNS3QlTNYGhvCh3Gu0W1rFf/i+EGmgMyxDK8NhE6WQEHK2W8SCpw+H4S88are0a4Qqv8k0AVUFJKSnn5e17kbOVwAnL45iVuVl1dvBxS/JTViW7Nt9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 03:54:24.6709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: defb5ace-d058-43ed-20a7-08dc60246741
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697

When a device has been reset on dom0 side, the vpci on Xen
side won't get notification, so the cached state in vpci is
all out of date compare with the real device state.
To solve that problem, add a new hypercall to clear all vpci
device state. When the state of device is reset on dom0 side,
dom0 can call this hypercall to notify vpci.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  1 +
 xen/drivers/pci/physdev.c    | 36 ++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c      | 10 ++++++++++
 xen/include/public/physdev.h |  7 +++++++
 xen/include/xen/vpci.h       |  6 ++++++
 5 files changed, 60 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 14679dd82971..56fbb69ab201 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -84,6 +84,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_pci_device_state_reset:
     case PHYSDEVOP_dbgp_op:
         if ( !is_hardware_domain(currd) )
             return -ENOSYS;
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d133c..73dc8f058b0e 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -2,6 +2,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/vpci.h>
 
 #ifndef COMPAT
 typedef long ret_t;
@@ -67,6 +68,41 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case PHYSDEVOP_pci_device_state_reset: {
+        struct physdev_pci_device dev;
+        struct pci_dev *pdev;
+        pci_sbdf_t sbdf;
+
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev, arg, 1) != 0 )
+            break;
+        sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);
+
+        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
+        if ( ret )
+            break;
+
+        pcidevs_lock();
+        pdev = pci_get_pdev(NULL, sbdf);
+        if ( !pdev )
+        {
+            pcidevs_unlock();
+            ret = -ENODEV;
+            break;
+        }
+
+        write_lock(&pdev->domain->pci_lock);
+        ret = vpci_reset_device_state(pdev);
+        write_unlock(&pdev->domain->pci_lock);
+        pcidevs_unlock();
+        if ( ret )
+            printk(XENLOG_ERR "%pp: failed to reset PCI device state\n", &sbdf);
+        break;
+    }
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 97e115dc5798..424aec2d5c46 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -115,6 +115,16 @@ int vpci_assign_device(struct pci_dev *pdev)
 
     return rc;
 }
+
+int vpci_reset_device_state(struct pci_dev *pdev)
+{
+    ASSERT(pcidevs_locked());
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
+    vpci_deassign_device(pdev);
+    return vpci_assign_device(pdev);
+}
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index f0c0d4727c0b..f5bab1f29779 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -296,6 +296,13 @@ DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
  */
 #define PHYSDEVOP_prepare_msix          30
 #define PHYSDEVOP_release_msix          31
+/*
+ * Notify the hypervisor that a PCI device has been reset, so that any
+ * internally cached state is regenerated.  Should be called after any
+ * device reset performed by the hardware domain.
+ */
+#define PHYSDEVOP_pci_device_state_reset     32
+
 struct physdev_pci_device {
     /* IN */
     uint16_t seg;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e89c571890b2..ea64d94e818b 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -30,6 +30,7 @@ int __must_check vpci_assign_device(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_deassign_device(struct pci_dev *pdev);
+int __must_check vpci_reset_device_state(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
@@ -266,6 +267,11 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
 
 static inline void vpci_deassign_device(struct pci_dev *pdev) { }
 
+static inline int __must_check vpci_reset_device_state(struct pci_dev *pdev)
+{
+    return 0;
+}
+
 static inline void vpci_dump_msi(void) { }
 
 static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
-- 
2.34.1


